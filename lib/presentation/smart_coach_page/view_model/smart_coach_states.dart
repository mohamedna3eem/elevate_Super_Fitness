import 'package:elevate_super_fitness/api/models/chat_message_model.dart';
import 'package:elevate_super_fitness/domain/entites/user_info_entity.dart';
import 'package:equatable/equatable.dart';

class SmartCoachStates extends Equatable {
  final bool isLoading;
  final List<ChatMessageModel> messagesListSuccess;
  final String? messagesListErrorMessage;
  final List<int> conversationIds;
  final Map<int, String> conversationTitles;
  final int? currentConversationId;
  final bool loggedUserDataLoading;
  final UserInfoEntity? loggedUserDataSuccess;
  final String? loggedUserDataFailure;

  const SmartCoachStates({
    this.isLoading = false,
    this.messagesListSuccess = const [],
    this.messagesListErrorMessage,
    this.conversationIds = const [],
    this.conversationTitles = const {},
    this.currentConversationId,
    this.loggedUserDataLoading = false,
    this.loggedUserDataSuccess,
    this.loggedUserDataFailure,
  });
  SmartCoachStates copyWith({
    bool? isLoading,
    List<ChatMessageModel>? messagesListSuccess,
    String? messagesListErrorMessage,
    List<int>? conversationIds,
    Map<int, String>? conversationTitles,
    int? currentConversationId,
    bool? loggedUserDataLoading,
    UserInfoEntity? loggedUserDataSuccess,
    String? loggedUserDataFailure,
  }) {
    return SmartCoachStates(
      isLoading: isLoading ?? this.isLoading,
      messagesListSuccess: messagesListSuccess ?? this.messagesListSuccess,
      messagesListErrorMessage: messagesListErrorMessage,
      conversationIds: conversationIds ?? this.conversationIds,
      conversationTitles: conversationTitles ?? this.conversationTitles,
      currentConversationId:
          currentConversationId ?? this.currentConversationId,
      loggedUserDataLoading:
          loggedUserDataLoading ?? this.loggedUserDataLoading,
      loggedUserDataSuccess: loggedUserDataSuccess,
      loggedUserDataFailure: loggedUserDataFailure,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    messagesListSuccess,
    messagesListErrorMessage,
    conversationIds,
    conversationTitles,
    currentConversationId,
    loggedUserDataLoading,
    loggedUserDataSuccess,
    loggedUserDataFailure
  ];
}
