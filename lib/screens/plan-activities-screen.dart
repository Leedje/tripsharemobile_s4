import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tripsharemobile_s4/dateFormatters/DateFormatters.dart';
import 'package:tripsharemobile_s4/models/activityDTO.dart';
import 'package:tripsharemobile_s4/models/dayDTO.dart';
import 'package:tripsharemobile_s4/viewModels/activityViewModel.dart';
import 'package:tripsharemobile_s4/widgets/activityCard.dart';
import 'package:tripsharemobile_s4/widgets/addActivityWidget.dart';

class PlanActivitiesScreen extends StatefulWidget {
  final DayDTO day;

  const PlanActivitiesScreen({required this.day});

  @override
  State<PlanActivitiesScreen> createState() => _PlanActivitiesScreenState();
}

class _PlanActivitiesScreenState extends State<PlanActivitiesScreen> {
  bool addActivityFormVisible = false;

  @override
  Widget build(BuildContext context) {
    final activityVM = context.watch<ActivityViewModel>();
    final day = widget.day;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title and Back Button
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
          
                  SizedBox(width: 85),
          
                  Text(
                    'Add Activities',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
          
              SizedBox(height: 25),
          
              Center(
                child: Text('${day.name} - ${DateFormatters.fullDateDisplay(day.date)}', style: TextStyle()),
              ), 
          
              SizedBox(height: 30),
          
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Text(
                      'Activities Planned',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
          
                    Spacer(),
          
                    IconButton.filled(
                      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(const Color(0xFF18C0C1)), foregroundColor: WidgetStatePropertyAll(Colors.white)),
                      onPressed: () {
                        setState(() {
                          addActivityFormVisible = !addActivityFormVisible;
                        });
                      },
                      icon: Icon(Icons.add),
                    ), 
                    ]
                ),
              ),
          
              //Add activities popup
              if (addActivityFormVisible)
                AddActivityWidget(
                  dayId: day.id,
                  onClosed: () {
                    setState(() => addActivityFormVisible = false); 
                  },
                  onSaved: (activity) {
                    activityVM.addActivity(activity);
                    day.activities.add(activity);
                    setState(() => addActivityFormVisible = false);
                  },
                ),
          
              Expanded(
                child: ListView.builder(
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
            ],
          ),
        ),
      ),
    );
  }
}
