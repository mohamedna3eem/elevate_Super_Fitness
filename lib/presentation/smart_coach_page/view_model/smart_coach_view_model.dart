import 'package:elevate_super_fitness/api/models/chat_message_model.dart';
import 'package:elevate_super_fitness/core/constants/app_images.dart';
import 'package:elevate_super_fitness/core/utils/gemini_service.dart';
import 'package:elevate_super_fitness/core/utils/object_box_service.dart';
import 'package:elevate_super_fitness/presentation/smart_coach_page/view_model/smart_coach_events.dart';
import 'package:elevate_super_fitness/presentation/smart_coach_page/view_model/smart_coach_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SmartCoachViewModel extends Cubit<SmartCoachStates> {
  final GeminiService _geminiService;
  final ObjectBoxService _db;

  SmartCoachViewModel(this._geminiService, this._db)
    : super(const SmartCoachStates());

  final TextEditingController inputController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  void doIntent(SmartCoachEvents event) {
    switch (event) {
      case OnLoadWelcomeMessageEvent():
        _loadWelcomeMessage();
        break;
      case OnSendMessageEvent():
        _sendMessage();
        break;
      case OnLoadConversationsEvent():
        _loadConversations();
        break;
      case OnLoadSelectedConversationEvent():
        _loadSelectedConversation(event.conversationId);
        break;
    }
  }

  Future<void> _loadWelcomeMessage() async {
    final newCid = _db.generateConversationId();

    final welcome = await _geminiService.welcomeMessage();
    _db.addMessage(
      conversationId: newCid,
      text: welcome,
      isUser: false,
      image: AppImages.aiImage,
    );

    final msgs = _db.getMessages(newCid);
    emit(
      state.copyWith(
        currentConversationId: newCid,
        messagesListSuccess: msgs,
        conversationIds: _db.getAllConversationIds(),
      ),
    );
  }

  Future<void> _sendMessage() async {
    final text = inputController.text.trim();
    if (text.isEmpty) return;

    var cid = state.currentConversationId;
    cid ??= _db.generateConversationId();

    final isFirstMessage = state.messagesListSuccess.isEmpty;

    _db.addMessage(
      conversationId: cid,
      text: text,
      isUser: true,
      image: AppImages.userImage,
    );

    if (isFirstMessage) {
      final updatedTitles = Map<int, String>.from(state.conversationTitles);
      updatedTitles[cid] = text;
      emit(state.copyWith(conversationTitles: updatedTitles));
    }

    emit(
      state.copyWith(
        currentConversationId: cid,
        messagesListSuccess: [
          ...state.messagesListSuccess,
          ChatMessageModel(
            conversationId: cid,
            text: text,
            isUser: true,
            image: AppImages.userImage,
          ),
        ],
        conversationIds: _db.getAllConversationIds(),
      ),
    );

    _scrollToBottom();
    inputController.clear();

    emit(state.copyWith(isLoading: true));
    final replyText = await _geminiService.sendMessage(text);

    _db.addMessage(
      conversationId: cid,
      text: replyText,
      isUser: false,
      image: AppImages.aiImage,
    );

    emit(
      state.copyWith(
        isLoading: false,
        messagesListSuccess: [
          ...state.messagesListSuccess,
          ChatMessageModel(
            conversationId: cid,
            text: replyText,
            isUser: false,
            image: AppImages.aiImage,
          ),
        ],
        conversationIds: _db.getAllConversationIds(),
      ),
    );

    _scrollToBottom();
  }

  void _loadConversations() {
    final ids = _db.getAllConversationIds();
    final titles = <int, String>{};

    for (final id in ids) {
      final msgs = _db.getMessages(id);
      if (msgs.isNotEmpty) {
        final firstMsg = msgs.firstWhere(
          (m) => m.isUser,
          orElse: () => msgs.first,
        );
        titles[id] = firstMsg.text;
      }
    }

    emit(state.copyWith(conversationIds: ids, conversationTitles: titles));
  }

  void _loadSelectedConversation(int conversationId) {
    final msgs = _db.getMessages(conversationId);
    emit(
      state.copyWith(
        currentConversationId: conversationId,
        messagesListSuccess: msgs,
        conversationIds: _db.getAllConversationIds(),
      ),
    );
    _scrollToBottom();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (!scrollController.hasClients) return;
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Future<void> close() {
    inputController.dispose();
    scrollController.dispose();
    return super.close();
  }
}
