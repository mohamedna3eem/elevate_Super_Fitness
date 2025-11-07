import 'package:elevate_super_fitness/core/di/di.dart';
import 'package:elevate_super_fitness/presentation/smart_coach_page/view/widgets/chat_view_body.dart';
import 'package:elevate_super_fitness/presentation/smart_coach_page/view/widgets/previous_conversation_drawer.dart';
import 'package:elevate_super_fitness/presentation/smart_coach_page/view_model/smart_coach_view_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final SmartCoachViewModel smartCoachViewModel = getIt.get<SmartCoachViewModel>();
  GlobalKey<ScaffoldState> scafdoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafdoldKey,
      endDrawer: PreviousConversationsDrawer(
        smartCoachViewModel: smartCoachViewModel,
      ),
      body: SafeArea(
        child: ChatViewBody(
          smartCoachViewModel: smartCoachViewModel,
          scafdoldKey: scafdoldKey,
        ),
      ),
    );
  }
}
