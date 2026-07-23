import 'package:flutter/material.dart';
import 'package:holistq/features/home/presentation/widgets/health_score_card.dart';
import 'package:holistq/features/home/presentation/widgets/summary_grid.dart';
import 'package:holistq/features/home/presentation/widgets/ai_coach_card.dart';
import 'package:holistq/features/home/presentation/widgets/quick_actions_grid.dart';
import 'package:holistq/features/home/presentation/widgets/habit_tracker_section.dart';
import 'package:holistq/features/home/presentation/widgets/progress_section.dart';
import 'package:holistq/features/home/presentation/widgets/schedule_section.dart';
import 'package:holistq/features/home/presentation/widgets/achievements_section.dart';

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {},
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.favorite_rounded, color: Color(0xFF10B981)),
                          const SizedBox(width: 8),
                          Text('HolistQ', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text('Good Morning, Maya', style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(height: 4),
                      Text('Here is your wellness snapshot for today.', style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              const SliverToBoxAdapter(child: HealthScoreCard()),
              const SliverToBoxAdapter(child: SummaryGrid()),
              const SliverToBoxAdapter(child: AiCoachCard()),
              const SliverToBoxAdapter(child: QuickActionsGrid()),
              const SliverToBoxAdapter(child: HabitTrackerSection()),
              const SliverToBoxAdapter(child: ProgressSection()),
              const SliverToBoxAdapter(child: ScheduleSection()),
              const SliverToBoxAdapter(child: AchievementsSection()),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
            ],
          ),
        ),
      ),
    );
  }
}
