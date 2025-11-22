import 'package:flutter/material.dart';
import 'package:tripsharemobile_s4/models/day.dart';
import 'package:tripsharemobile_s4/widgets/activityCard.dart';
import 'package:tripsharemobile_s4/dateFormatters/DateFormatters.dart';

class ActivitiesTab extends StatelessWidget {
  final List<DayDTO> days;

  const ActivitiesTab({super.key, required this.days});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: days.length,
      itemBuilder: (context, index) {
        final day = days[index];
        final formattedDate = DateFormatters.listedShortRange(day.date);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with date and action button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Day ${index + 1} – $formattedDate',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                FilledButton(
                  onPressed: () {
                    // add activity
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Color(0xFF18C0C1),
                  ),
                  child: Text(
                    'Add Activity',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
        
            // Activities list
            Expanded(
              child: day.activities.isEmpty
                  ? Center(
                      child: Text(
                        'No activities planned yet',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    )
                  : ListView.builder(
                      itemCount: day.activities.length,
                      itemBuilder: (context, activityIndex) {
                        final activity = day.activities[activityIndex];
                        return ActivityCard(activity: activity, activityNumber: activityIndex + 1,);
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}
