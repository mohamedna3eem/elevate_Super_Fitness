import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:elevate_super_fitness/api/models/chat_message_model.dart';
import 'package:injectable/injectable.dart';
import 'package:elevate_super_fitness/objectbox.g.dart';

@singleton
class ObjectBoxService {
  late final Store _store;
  late final Box<ChatMessageModel> _messageBox;

  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;

    final docsDir = await getApplicationDocumentsDirectory();
    final dirPath = '${docsDir.path}/objectbox';
    final dir = Directory(dirPath);
    if (!dir.existsSync()) dir.createSync(recursive: true);

    _store = await openStore(directory: dirPath);
    _messageBox = _store.box<ChatMessageModel>();

    _initialized = true;
  }

  
  int generateConversationId() => DateTime.now().millisecondsSinceEpoch;

  
  int addMessage({
    required int conversationId,
    required String text,
    required bool isUser,
    required String image,
    String? conversationTitle
  }) {
    final msg = ChatMessageModel(
      conversationId: conversationId,
      text: text,
      isUser: isUser,
      image: image,
      conversationTitle: conversationTitle 
    );
    return _messageBox.put(msg);
  }

  
  List<ChatMessageModel> getMessages(int conversationId) {
    final q = _messageBox
        .query(ChatMessageModel_.conversationId.equals(conversationId))
        .order(ChatMessageModel_.createdAt)
        .build();
    final list = q.find();
    q.close();
    return list;
  }

  
  List<int> getAllConversationIds() {
    final all = _messageBox.getAll();
    if (all.isEmpty) return [];

    final map = <int, DateTime>{};
    for (final m in all) {
      final prev = map[m.conversationId];
      if (prev == null || m.createdAt.isAfter(prev)) {
        map[m.conversationId] = m.createdAt;
      }
    }

    final ids = map.keys.toList();
    ids.sort((a, b) => map[b]!.compareTo(map[a]!));
    return ids;
  }

  String? getConversationTitle(int conversationId) {
    final q = _messageBox
        .query(ChatMessageModel_.conversationId.equals(conversationId))
        .order(ChatMessageModel_.createdAt)
        .build();
    final list = q.find();
    q.close();
    if (list.isEmpty) return null;
    return list.first.conversationTitle ?? list.first.text;
  }

  void close() => _store.close();
}
