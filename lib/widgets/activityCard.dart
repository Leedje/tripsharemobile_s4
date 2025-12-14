import 'package:flutter/material.dart';
import 'package:tripsharemobile_s4/models/activityDTO.dart';
import 'package:url_launcher/url_launcher.dart';

class ActivityCard extends StatelessWidget {
  final ActivityDTO activity;
  final activityNumber;

  const ActivityCard({
    super.key,
    required this.activity,
    required this.activityNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFF18C0C1),
            foregroundColor: Colors.white,
            child: Text('${activityNumber}'),
          ),

          SizedBox(width: 15),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    activity.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  if (activity.link.isNotEmpty)
                    IconButton(
                      color: Colors.teal,
                      onPressed: () {
                        launchUrl(
                          Uri.parse(activity.link),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                      icon: Icon(Icons.link),
                    ),
                ],
              ),
              Text(activity.location),
              Text(activity.description),
            ],
          ),
        ],
      ),
    );
  }
}
