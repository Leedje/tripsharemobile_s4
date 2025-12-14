import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripsharemobile_s4/models/activityDTO.dart';
import 'package:tripsharemobile_s4/models/dayDTO.dart';
import 'package:tripsharemobile_s4/viewModels/activityViewModel.dart';
import 'package:tripsharemobile_s4/widgets/activityCard.dart';
import 'package:tripsharemobile_s4/dateFormatters/DateFormatters.dart';
import 'package:tripsharemobile_s4/widgets/addActivityWidget.dart';

class ActivitiesTab extends StatefulWidget {
  final List<DayDTO> days;

  const ActivitiesTab({super.key, required this.days});

  @override
  State<ActivitiesTab> createState() => _ActivitiesTabState();
}

class _ActivitiesTabState extends State<ActivitiesTab> {
  bool addActivityFormVisible = false;
  final newActivity = ActivityDTO();

  @override
  Widget build(BuildContext context) {
    final activityVM = context.watch<ActivityViewModel>();

    return PageView.builder(
      itemCount: widget.days.length,
      itemBuilder: (context, index) {
        final day = widget.days[index];
        final formattedDate = DateFormatters.listedShortRange(day.date);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            // Header with date and action button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${day.name} – $formattedDate',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                FilledButton(
                  onPressed: () {
                    setState(() {
                      addActivityFormVisible = !addActivityFormVisible;
                    });
                  },
                  child: Text('Add Activity'),
                ),
              ],
            ),
            SizedBox(height: 20),

            if (addActivityFormVisible)
              AddActivityWidget(
                dayId: day.id,
                onSaved: (newActivity) async {
                  final created = await activityVM.addActivity(newActivity);
                  if (created) {
                    setState(() {
                      day.activities.add(newActivity);
                      addActivityFormVisible = false;
                    });
                  } else {
                    // show error
                  }
                },
                onClosed: () {
                  setState(() {
                    addActivityFormVisible = false;
                  });
                },
              ),

            // Activities list
            Expanded(
              child: day.activities.isEmpty
                  ? Center(
                      child: Text(
                        'No activities planned yet',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    )
                  : ListView.builder(
                      itemCount: day.activities.length,
                      itemBuilder: (context, activityIndex) {
                        final activity = day.activities[activityIndex];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: ActivityCard(
                            activity: activity,
                            activityNumber: activityIndex + 1,
                          ),
                        );
                      },
                    ),
            ),

            //eventually add interactive pagination
          ],
        );
      },
    );
  }
}
