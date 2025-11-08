import 'package:elevate_super_fitness/api/models/chat_message_model.dart';
import 'package:elevate_super_fitness/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gpt_markdown/gpt_markdown.dart';

class ChatMessageCustomWidget extends StatelessWidget {
  final ChatMessageModel message;

  const ChatMessageCustomWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: message.isUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!message.isUser)
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(message.image),
              backgroundColor: AppColors.lightGray,
            ),

          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.all(8),
            constraints: const BoxConstraints(maxWidth: 250),
            decoration: BoxDecoration(
              color: message.isUser
                  ? AppColors.transparentOrange.withOpacity(0.5)
                  : AppColors.backGroundD.withOpacity(0.7),
              borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(20),
                bottomRight: const Radius.circular(20),
                topLeft: Radius.circular(message.isUser ? 20 : 0),
                topRight: Radius.circular(message.isUser ? 0 : 20),
              ),
            ),
            child: GptMarkdown(
              message.text,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium!.copyWith(color: AppColors.pureWhite),
            ),
          ),

          const SizedBox(width: 8),
          if (message.isUser)
            CircleAvatar(
              radius: 18,
              backgroundImage: message.image.startsWith('http')
                  ? NetworkImage(message.image)
                  : AssetImage(message.image),
              backgroundColor: AppColors.lightGray,
            ),
        ],
      ),
    );
  }
}
