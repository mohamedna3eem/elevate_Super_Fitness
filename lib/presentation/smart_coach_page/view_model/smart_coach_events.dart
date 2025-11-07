sealed class SmartCoachEvents {}

class OnLoadWelcomeMessageEvent extends SmartCoachEvents {}

class OnSendMessageEvent extends SmartCoachEvents {}

class OnLoadConversationsEvent extends SmartCoachEvents {}

class OnLoadSelectedConversationEvent extends SmartCoachEvents {
  final int conversationId;
  OnLoadSelectedConversationEvent({required this.conversationId});
}
