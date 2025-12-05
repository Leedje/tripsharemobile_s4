import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:tripsharemobile_s4/models/itineraryDTO.dart';
import 'package:tripsharemobile_s4/viewModels/itineraryViewModel.dart';

class CreateEditItineraryScreen extends StatefulWidget {
  const CreateEditItineraryScreen({super.key});

  @override
  State<CreateEditItineraryScreen> createState() =>
      _CreateEditItineraryScreenState();
}

class _CreateEditItineraryScreenState extends State<CreateEditItineraryScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTimeRange? _selectedRange;

  final itinerary = ItineraryDTO();

  void _showDateRangePicker(BuildContext context) async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (picked != null) {
      setState(() {
        _selectedRange = picked;
        itinerary.startDate = picked.start;
        itinerary.endDate = picked.end;
        itinerary.numberOfDays = picked.duration.inDays;
      });
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('MMM d yyyy').format(date);
  }

  XFile? _image;
  final picker = ImagePicker();

  Future<void> selectImage() async {
    final selectedImage = await picker.pickImage(source: ImageSource.gallery);

    if (selectedImage != null) {
      setState(() {
        _image = selectedImage;
        itinerary.image = _image!.path;
      });
    }
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
                    onChanged: (value) => {itinerary.name = value},
                    initialValue: '',
                    style: TextStyle(fontFamily: 'Poppins'),
                    decoration: InputDecoration(
                      hintText: 'Itinerary Name',
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
                    onChanged: (value) {
                      itinerary.description = value;
                    },
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
                    onChanged: (value) {
                      itinerary.country = value;
                    },
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
                    onChanged: (value) {
                      itinerary.city = value;
                    },
                  ),
                ),

                SizedBox(height: 12),

                /// Cover Photo Selection
                GestureDetector(
                  onTap: () {
                    selectImage();
                  },
                  child: Card(
                    shadowColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), image: DecorationImage(
                              image: _image == null
                              ? NetworkImage('https://pixsector.com/cache/517d8be6/av5c8336583e291842624.png') 
                              : FileImage(File(_image!.path)) as ImageProvider, 
                              fit: BoxFit.fill,
                            ),),
                            width: 120,
                            height: 100,
                          ),
                          SizedBox(width: 30,),
                          Text(
                            'Add Cover Photo',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
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
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          itineraryViewModel.createItinerary(itinerary);
                          context.push('/days-screen');
                        }
                      },
                      child: Text('Continue'),
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
