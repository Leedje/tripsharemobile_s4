import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripsharemobile_s4/models/activityDTO.dart';
import 'package:tripsharemobile_s4/viewModels/activityViewModel.dart';

class AddActivityWidget extends StatefulWidget {
  final void Function(ActivityDTO activity) onSaved;
  final VoidCallback onClosed;
  final dayId;

  const AddActivityWidget({
    required this.onSaved,
    required this.onClosed,
    required this.dayId,
  });

  @override
  State<AddActivityWidget> createState() => _AddActivityWidgetState();
}

class _AddActivityWidgetState extends State<AddActivityWidget> {
  final _formKey = GlobalKey<FormState>();
  ActivityDTO activity = ActivityDTO();

  @override
  Widget build(BuildContext context) {
    final activityVM = context.watch<ActivityViewModel>();

    return Form(
      key: _formKey,
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 50,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(40)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                //Activity name field and action buttons
                Row(
                  spacing: 5,
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: '',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter activity name";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          activity.name = value;
                        },
                        decoration: InputDecoration(
                          hint: Text(
                            'Enter activity name',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),

                    IconButton.filled(
                        style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          const Color(0xFF18C0C1),
                        ),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                  
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          activity.dayId = widget.dayId;
                          widget.onSaved(activity);
                        }
                      },
                      icon: Icon(Icons.check),
                    ),
                    IconButton.filled(
                        style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          const Color.fromARGB(255, 241, 32, 64),
                        ),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                  
                      onPressed: () {
                        widget.onClosed();
                      },
                      icon: Icon(Icons.close_sharp),
                    ),
                  ],
                ),

                //Activity location
                TextFormField(
                  initialValue: '',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter an activity location";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    activity.location = value;
                  },
                  decoration: InputDecoration(
                    hint: Text('Enter activity location'),
                  ),
                ),

                //Activity description
                TextFormField(
                  initialValue: '',
                  onChanged: (value) {
                    activity.description = value;
                  },
                  decoration: InputDecoration(
                    hint: Text('Enter activity description (optional)'),
                  ),
                ),

                //Activity link
                TextFormField(
                  initialValue: '',
                  onChanged: (value) {
                    activity.link = value;
                  },
                  decoration: InputDecoration(
                    hint: Text('Enter external activity link (optional)'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
