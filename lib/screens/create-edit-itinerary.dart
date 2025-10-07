import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tripsharemobile_s4/models/itinerary.dart';
import 'package:tripsharemobile_s4/viewModels/itineraryViewModel.dart';

class CreateEditItineraryScreen extends StatefulWidget {
  @override
  State<CreateEditItineraryScreen> createState() =>
      _CreateEditItineraryScreenState();
}

class _CreateEditItineraryScreenState extends State<CreateEditItineraryScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final itineraryViewModel = context.watch<ItineraryViewModel>();

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an itinerary name';
                }
              },
              initialValue: '',
              decoration: InputDecoration(hintText: 'Name'),
            ),
            DatePickerDialog(
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now(),
            ),
            TextFormField(
              initialValue: '',
              decoration: InputDecoration(hintText: 'Description'),
            ),
            TextFormField(
              initialValue: '',
              decoration: InputDecoration(hintText: 'Country'),
            ),
            TextFormField(
              initialValue: '',
              decoration: InputDecoration(hintText: 'City'),
            ),
            Card(shadowColor: Colors.grey, child: Text('Add Cover Photo')),
            SizedBox(height: 4),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      color: Color(0xFF18C0C1)
                    )
                  ),
                  onPressed: () {
                    context.go('/');
                  },
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Color(0xFF18C0C1),
                    textStyle: TextStyle(
                      color: Colors.white
                    )
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // itineraryViewModel.createItinerary(itinerary);
                    }
                  },
                  child: const Text('Create'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
