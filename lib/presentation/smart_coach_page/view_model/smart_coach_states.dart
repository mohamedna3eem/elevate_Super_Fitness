import 'package:elevate_super_fitness/api/models/chat_message_model.dart';
import 'package:equatable/equatable.dart';

class SmartCoachStates extends Equatable {
  final bool isLoading;
  final List<ChatMessageModel> messagesListSuccess;
  final String? messagesListErrorMessage;
  final List<int> conversationIds;
  final Map<int, String> conversationTitles;
  final int? currentConversationId;
  
  const SmartCoachStates({
    this.isLoading = false,
    this.messagesListSuccess = const [],
    this.messagesListErrorMessage,
    this.conversationIds = const [],
    this.conversationTitles = const {},
    this.currentConversationId,
  });
  SmartCoachStates copyWith({
    bool? isLoading,
    List<ChatMessageModel>? messagesListSuccess,
    String? messagesListErrorMessage,
    List<int>? conversationIds,
    Map<int, String>? conversationTitles,
    int? currentConversationId,
  }) {
    return SmartCoachStates(
      isLoading: isLoading ?? this.isLoading,
      messagesListSuccess: messagesListSuccess ?? this.messagesListSuccess,
      messagesListErrorMessage: messagesListErrorMessage,
      conversationIds: conversationIds ?? this.conversationIds,
      conversationTitles: conversationTitles ?? this.conversationTitles,
      currentConversationId:
          currentConversationId ?? this.currentConversationId,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    messagesListSuccess,
    messagesListErrorMessage,
    conversationIds,
    conversationTitles,
    currentConversationId
  ];
}
