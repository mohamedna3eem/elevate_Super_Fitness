import 'dart:ui';
import 'package:elevate_super_fitness/core/constants/app_colors.dart';
import 'package:elevate_super_fitness/generated/l10n.dart';
import 'package:elevate_super_fitness/presentation/smart_coach_page/view_model/smart_coach_events.dart';
import 'package:elevate_super_fitness/presentation/smart_coach_page/view_model/smart_coach_states.dart';
import 'package:elevate_super_fitness/presentation/smart_coach_page/view_model/smart_coach_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviousConversationsDrawer extends StatefulWidget {
  final SmartCoachViewModel smartCoachViewModel;
  const PreviousConversationsDrawer({
    super.key,
    required this.smartCoachViewModel,
  });

  @override
  State<PreviousConversationsDrawer> createState() =>
      _PreviousConversationsDrawerState();
}

class _PreviousConversationsDrawerState
    extends State<PreviousConversationsDrawer> {
  @override
  void initState() {
    widget.smartCoachViewModel.doIntent(OnLoadConversationsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 20),
          child: Container(
            width: 263,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.backGroundL.withOpacity(0.8),
            ),
            child: BlocBuilder<SmartCoachViewModel, SmartCoachStates>(
              bloc: widget.smartCoachViewModel,
              builder: (context, state) {
                final ids = state.conversationIds;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      AppLocalizations.of(context).previousConversations,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.pureWhite,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      child: ids.isEmpty
                          ? Center(
                              child: Text(
                                AppLocalizations.of(context).noConversationsYet,
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .copyWith(color: AppColors.pureWhite),
                              ),
                            )
                          : ListView.builder(
                              itemCount: ids.length,
                              itemBuilder: (context, index) {
                                final id = ids[index];
                                final titles = state.conversationTitles;
                                'Conversation $id';
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context).maybePop();
                                    widget.smartCoachViewModel.doIntent(
                                      OnLoadSelectedConversationEvent(
                                        conversationId: id,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 35,
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: AppColors.darkGray,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.arrow_back_ios_new,
                                          color: AppColors.mainColorL,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            titles[id] ?? 'Conversation $id',
                                            textAlign: TextAlign.end,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color:
                                                      AppColors.backGroundL[90],
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                    const SizedBox(height: 24),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
