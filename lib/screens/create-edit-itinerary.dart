import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:tripsharemobile_s4/viewModels/itineraryViewModel.dart';

class CreateEditItineraryScreen extends StatefulWidget {
  @override
  State<CreateEditItineraryScreen> createState() =>
      _CreateEditItineraryScreenState();
}

class _CreateEditItineraryScreenState extends State<CreateEditItineraryScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTimeRange? _selectedRange;

  void _showDateRangePicker(BuildContext context) async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (picked != null) {
      setState(() {
        _selectedRange = picked;
      });
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('MMM d yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final itineraryViewModel = context.watch<ItineraryViewModel>();

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 32.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Create Your Itinerary',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 20),

                /// Name Field
                Card(
                  clipBehavior: Clip.hardEdge,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an itinerary name';
                      }
                      return null;
                    },
                    initialValue: '',
                    style: TextStyle(fontFamily: 'Poppins'),
                    decoration: InputDecoration(
                      hintText: 'Name',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                ),

                SizedBox(height: 12),

                /// Date Picker Card
                Card(
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () => _showDateRangePicker(context),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today, color: Colors.grey),
                          SizedBox(width: 12),
                          Text(
                            _selectedRange == null
                                ? 'Select dates'
                                : '${_formatDate(_selectedRange!.start)} – ${_formatDate(_selectedRange!.end)}',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 12),

                /// Description
                Card(
                  child: TextFormField(
                    initialValue: '',
                    style: TextStyle(fontFamily: 'Poppins'),
                    decoration: InputDecoration(
                      hintText: 'Description (optional)',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                ),

                SizedBox(height: 12),

                /// Country
                Card(
                  child: TextFormField(
                    initialValue: '',
                    style: TextStyle(fontFamily: 'Poppins'),
                    decoration: InputDecoration(
                      hintText: 'Country',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                ),

                SizedBox(height: 12),

                /// City
                Card(
                  child: TextFormField(
                    initialValue: '',
                    style: TextStyle(fontFamily: 'Poppins'),
                    decoration: InputDecoration(
                      hintText: 'City',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                ),

                SizedBox(height: 12),

                /// Cover Photo Placeholder
                Card(
                  shadowColor: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Add Cover Photo',
                      style: TextStyle(fontFamily: 'Poppins'),
                    ),
                  ),
                ),

                SizedBox(height: 24),

                /// Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.go('/');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color(0xFF18C0C1),
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    SizedBox(width: 25),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Color(0xFF18C0C1),
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // itineraryViewModel.createItinerary(itinerary);
                        }
                      },
                      child: Text('Create'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
