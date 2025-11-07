import 'package:bloc_test/bloc_test.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/core/utils/gemini_service.dart';
import 'package:elevate_super_fitness/core/utils/object_box_service.dart';
import 'package:elevate_super_fitness/domain/entites/user_info_entity.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_user_logged_data_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:elevate_super_fitness/presentation/smart_coach_page/view_model/smart_coach_view_model.dart';
import 'package:elevate_super_fitness/presentation/smart_coach_page/view_model/smart_coach_states.dart';
import 'package:elevate_super_fitness/presentation/smart_coach_page/view_model/smart_coach_events.dart';
import 'package:elevate_super_fitness/api/models/chat_message_model.dart';
import 'package:elevate_super_fitness/core/constants/app_images.dart';

import 'smart_coach_view_model_test.mocks.dart';


@GenerateMocks([GeminiService, ObjectBoxService, GetUserLoggedDataUseCase])
void main() {
late SmartCoachViewModel viewModel;
  late MockGeminiService mockGeminiService;
  late MockObjectBoxService mockDb;
  late MockGetUserLoggedDataUseCase mockGetUserLoggedDataUseCase;

  setUpAll(() {
    provideDummy<ApiResult<UserInfoEntity>>(
      ApiSuccessResult<UserInfoEntity>(const UserInfoEntity()),
    );
  });

  setUp(() {
    mockGeminiService = MockGeminiService();
    mockDb = MockObjectBoxService();
    mockGetUserLoggedDataUseCase = MockGetUserLoggedDataUseCase();
    viewModel = SmartCoachViewModel(
      mockGeminiService,
      mockDb,
      mockGetUserLoggedDataUseCase,
    );
  });

  group('SmartCoachViewModel', () {
    group('Initial State', () {
      test('initial state is correct', () {
        expect(viewModel.state, const SmartCoachStates());
        expect(viewModel.state.isLoading, false);
        expect(viewModel.state.messagesListSuccess, isEmpty);
        expect(viewModel.state.conversationIds, isEmpty);
        expect(viewModel.state.conversationTitles, isEmpty);
        expect(viewModel.state.currentConversationId, isNull);
        expect(viewModel.state.loggedUserDataLoading, false);
        expect(viewModel.state.loggedUserDataSuccess, isNull);
        expect(viewModel.state.loggedUserDataFailure, isNull);
      });
    });

    group('OnLoadWelcomeMessageEvent', () {
      const testConversationId = 1;
      const welcomeMessage = 'Hello! How can I help you today?';
      final mockMessages = [
        ChatMessageModel(
          conversationId: testConversationId,
          text: welcomeMessage,
          isUser: false,
          image: AppImages.aiImage,
        ),
      ];

      blocTest<SmartCoachViewModel, SmartCoachStates>(
        'emits state with welcome message when OnLoadWelcomeMessageEvent is triggered',
        build: () {
          when(mockDb.generateConversationId()).thenReturn(testConversationId);
          when(
            mockGeminiService.welcomeMessage(),
          ).thenAnswer((_) async => welcomeMessage);
          when(
            mockDb.addMessage(
              conversationId: anyNamed('conversationId'),
              text: anyNamed('text'),
              isUser: anyNamed('isUser'),
              image: anyNamed('image'),
            ),
          ).thenReturn(1);
          when(mockDb.getMessages(testConversationId)).thenReturn(mockMessages);
          when(mockDb.getAllConversationIds()).thenReturn([testConversationId]);
          return viewModel;
        },
        act: (cubit) => cubit.doIntent(OnLoadWelcomeMessageEvent()),
        expect: () => [
          SmartCoachStates(
            currentConversationId: testConversationId,
            messagesListSuccess: mockMessages,
            conversationIds: [testConversationId],
          ),
        ],
        verify: (_) {
          verify(mockDb.generateConversationId()).called(1);
          verify(mockGeminiService.welcomeMessage()).called(1);
          verify(
            mockDb.addMessage(
              conversationId: testConversationId,
              text: welcomeMessage,
              isUser: false,
              image: AppImages.aiImage,
            ),
          ).called(1);
          verify(mockDb.getMessages(testConversationId)).called(1);
          verify(mockDb.getAllConversationIds()).called(1);
        },
      );
    });

    group('OnSendMessageEvent', () {
      const testConversationId = 2;
      const userMessage = 'What is Flutter?';
      const aiResponse = 'Flutter is a UI framework by Google.';
      const mockUserInfo = UserInfoEntity(
        id: '1',
        firstName: 'Test',
        lastName: 'User',
        email: 'test@example.com',
        photo: 'user_photo.jpg',
      );

      blocTest<SmartCoachViewModel, SmartCoachStates>(
        'sends message and receives AI response with user photo',
        build: () {
          viewModel.inputController.text = userMessage;
          when(mockDb.generateConversationId()).thenReturn(testConversationId);
          when(
            mockDb.addMessage(
              conversationId: anyNamed('conversationId'),
              text: anyNamed('text'),
              isUser: anyNamed('isUser'),
              image: anyNamed('image'),
            ),
          ).thenReturn(1);
          when(mockDb.getAllConversationIds()).thenReturn([testConversationId]);
          when(
            mockGeminiService.sendMessage(userMessage),
          ).thenAnswer((_) async => aiResponse);
          when(mockGetUserLoggedDataUseCase.call()).thenAnswer(
            (_) async => ApiSuccessResult<UserInfoEntity>(mockUserInfo),
          );
          return viewModel;
        },
        act: (cubit) => cubit.doIntent(OnSendMessageEvent()),
        expect: () => [
          predicate<SmartCoachStates>((state) {
            return state.loggedUserDataLoading == true;
          }),
          predicate<SmartCoachStates>((state) {
            return state.loggedUserDataLoading == false &&
                state.loggedUserDataSuccess == mockUserInfo &&
                state.messagesListSuccess.isEmpty;
          }),
          predicate<SmartCoachStates>((state) {
            return state.conversationTitles[testConversationId] ==
                    userMessage &&
                state.messagesListSuccess.isEmpty;
          }),
          predicate<SmartCoachStates>((state) {
            return state.currentConversationId == testConversationId &&
                state.messagesListSuccess.length == 1 &&
                state.messagesListSuccess[0].text == userMessage &&
                state.messagesListSuccess[0].isUser == true &&
                state.messagesListSuccess[0].image == 'user_photo.jpg';
          }),
          predicate<SmartCoachStates>((state) {
            return state.isLoading == true;
          }),
          predicate<SmartCoachStates>((state) {
            return state.isLoading == false &&
                state.messagesListSuccess.length == 2 &&
                state.messagesListSuccess[1].text == aiResponse &&
                state.messagesListSuccess[1].isUser == false;
          }),
        ],
      );


      

      blocTest<SmartCoachViewModel, SmartCoachStates>(
        'uses default user image when user data fails to load',
        build: () {
          viewModel.inputController.text = userMessage;
          when(mockDb.generateConversationId()).thenReturn(testConversationId);
          when(
            mockDb.addMessage(
              conversationId: anyNamed('conversationId'),
              text: anyNamed('text'),
              isUser: anyNamed('isUser'),
              image: anyNamed('image'),
            ),
          ).thenReturn(1);
          when(mockDb.getAllConversationIds()).thenReturn([testConversationId]);
          when(
            mockGeminiService.sendMessage(userMessage),
          ).thenAnswer((_) async => aiResponse);
          when(mockGetUserLoggedDataUseCase.call()).thenAnswer(
            (_) async => ApiErrorResult<UserInfoEntity>(
              Exception('Failed to load user data'),
            ),
          );
          return viewModel;
        },
        act: (cubit) => cubit.doIntent(OnSendMessageEvent()),
        skip: 2,
        verify: (_) {
          verify(
            mockDb.addMessage(
              conversationId: testConversationId,
              text: userMessage,
              isUser: true,
              image: AppImages.userImage,
            ),
          ).called(1);
        },
      );

      blocTest<SmartCoachViewModel, SmartCoachStates>(
        'does nothing when message is empty',
        build: () {
          viewModel.inputController.text = '   ';
          return viewModel;
        },
        act: (cubit) => cubit.doIntent(OnSendMessageEvent()),
        expect: () => [],
      );

      blocTest<SmartCoachViewModel, SmartCoachStates>(
        'uses existing conversation ID when available',
        build: () {
          viewModel.inputController.text = userMessage;
          when(
            mockDb.addMessage(
              conversationId: anyNamed('conversationId'),
              text: anyNamed('text'),
              isUser: anyNamed('isUser'),
              image: anyNamed('image'),
            ),
          ).thenReturn(1);
          when(mockDb.getAllConversationIds()).thenReturn([testConversationId]);
          when(
            mockGeminiService.sendMessage(userMessage),
          ).thenAnswer((_) async => aiResponse);
          when(mockGetUserLoggedDataUseCase.call()).thenAnswer(
            (_) async => ApiSuccessResult<UserInfoEntity>(mockUserInfo),
          );
          return viewModel;
        },
        seed: () => const SmartCoachStates(
          currentConversationId: testConversationId,
          messagesListSuccess: [],
        ),
        act: (cubit) => cubit.doIntent(OnSendMessageEvent()),
        skip: 4,
        verify: (_) {
          verifyNever(mockDb.generateConversationId());
        },
      );
    });

    group('OnLoadConversationsEvent', () {
      const conversationId1 = 1;
      const conversationId2 = 2;
      const firstUserMessage1 = 'Hello';
      const firstUserMessage2 = 'What is Dart?';

      final mockMessages1 = [
        ChatMessageModel(
          conversationId: conversationId1,
          text: 'Welcome!',
          isUser: false,
          image: AppImages.aiImage,
        ),
        ChatMessageModel(
          conversationId: conversationId1,
          text: firstUserMessage1,
          isUser: true,
          image: AppImages.userImage,
        ),
      ];

      final mockMessages2 = [
        ChatMessageModel(
          conversationId: conversationId2,
          text: firstUserMessage2,
          isUser: true,
          image: AppImages.userImage,
        ),
      ];

      blocTest<SmartCoachViewModel, SmartCoachStates>(
        'loads all conversations with titles',
        build: () {
          when(
            mockDb.getAllConversationIds(),
          ).thenReturn([conversationId1, conversationId2]);
          when(mockDb.getMessages(conversationId1)).thenReturn(mockMessages1);
          when(mockDb.getMessages(conversationId2)).thenReturn(mockMessages2);
          return viewModel;
        },
        act: (cubit) => cubit.doIntent(OnLoadConversationsEvent()),
        expect: () => [
          const SmartCoachStates(
            conversationIds: [conversationId1, conversationId2],
            conversationTitles: {
              conversationId1: firstUserMessage1,
              conversationId2: firstUserMessage2,
            },
          ),
        ],
        verify: (_) {
          verify(mockDb.getAllConversationIds()).called(1);
          verify(mockDb.getMessages(conversationId1)).called(1);
          verify(mockDb.getMessages(conversationId2)).called(1);
        },
      );

      blocTest<SmartCoachViewModel, SmartCoachStates>(
        'handles conversations with no user messages',
        build: () {
          final messagesNoUser = [
            ChatMessageModel(
              conversationId: conversationId1,
              text: 'AI only message',
              isUser: false,
              image: AppImages.aiImage,
            ),
          ];
          when(mockDb.getAllConversationIds()).thenReturn([conversationId1]);
          when(mockDb.getMessages(conversationId1)).thenReturn(messagesNoUser);
          return viewModel;
        },
        act: (cubit) => cubit.doIntent(OnLoadConversationsEvent()),
        expect: () => [
          const SmartCoachStates(
            conversationIds: [conversationId1],
            conversationTitles: {conversationId1: 'AI only message'},
          ),
        ],
      );
    });

    group('OnLoadSelectedConversationEvent', () {
      const testConversationId = 3;
      final mockMessages = [
        ChatMessageModel(
          conversationId: testConversationId,
          text: 'Previous message 1',
          isUser: true,
          image: AppImages.userImage,
        ),
        ChatMessageModel(
          conversationId: testConversationId,
          text: 'Previous message 2',
          isUser: false,
          image: AppImages.aiImage,
        ),
      ];

      blocTest<SmartCoachViewModel, SmartCoachStates>(
        'loads selected conversation with messages',
        build: () {
          when(mockDb.getMessages(testConversationId)).thenReturn(mockMessages);
          when(mockDb.getAllConversationIds()).thenReturn([testConversationId]);
          return viewModel;
        },
        act: (cubit) => cubit.doIntent(
          OnLoadSelectedConversationEvent(conversationId: testConversationId),
        ),
        expect: () => [
          SmartCoachStates(
            currentConversationId: testConversationId,
            messagesListSuccess: mockMessages,
            conversationIds: [testConversationId],
          ),
        ],
        verify: (_) {
          verify(mockDb.getMessages(testConversationId)).called(1);
          verify(mockDb.getAllConversationIds()).called(1);
        },
      );
    });

    group('OnGetUserLoggedDataEvent', () {
      const mockUserInfo = UserInfoEntity(
        id: '1',
        firstName: 'Test',
        lastName: 'User',
        email: 'test@example.com',
        photo: 'user_photo.jpg',
      );

      blocTest<SmartCoachViewModel, SmartCoachStates>(
        'loads user data successfully',
        build: () {
          when(mockGetUserLoggedDataUseCase.call()).thenAnswer(
            (_) async => ApiSuccessResult<UserInfoEntity>(mockUserInfo),
          );
          return viewModel;
        },
        act: (cubit) => cubit.doIntent(OnGetUserLoggedDataEvent()),
        expect: () => [
          const SmartCoachStates(loggedUserDataLoading: true),
          const SmartCoachStates(
            loggedUserDataLoading: false,
            loggedUserDataSuccess: mockUserInfo,
          ),
        ],
        verify: (_) {
          verify(mockGetUserLoggedDataUseCase.call()).called(1);
        },
      );

      blocTest<SmartCoachViewModel, SmartCoachStates>(
        'handles user data loading error',
        build: () {
          when(mockGetUserLoggedDataUseCase.call()).thenAnswer(
            (_) async => ApiErrorResult<UserInfoEntity>(
              Exception('Failed to load user data'),
            ),
          );
          return viewModel;
        },
        act: (cubit) => cubit.doIntent(OnGetUserLoggedDataEvent()),
        expect: () => [
          const SmartCoachStates(loggedUserDataLoading: true),
          SmartCoachStates(
            loggedUserDataLoading: false,
            loggedUserDataFailure: Exception(
              'Failed to load user data',
            ).toString(),
          ),
        ],
        verify: (_) {
          verify(mockGetUserLoggedDataUseCase.call()).called(1);
        },
      );
    });

    group('Controllers', () {
      test('inputController is initialized', () {
        expect(viewModel.inputController, isA<TextEditingController>());
      });

      test('scrollController is initialized', () {
        expect(viewModel.scrollController, isA<ScrollController>());
      });

      test('controllers are disposed on close', () async {
        final testViewModel = SmartCoachViewModel(
          mockGeminiService,
          mockDb,
          mockGetUserLoggedDataUseCase,
        );

        testViewModel.inputController.text = 'test';
        expect(testViewModel.inputController.text, 'test');

        await testViewModel.close();

        expect(
          () => testViewModel.inputController.addListener(() {}),
          throwsFlutterError,
        );

        expect(
          () => testViewModel.scrollController.addListener(() {}),
          throwsFlutterError,
        );
      });
    });
  });
}
