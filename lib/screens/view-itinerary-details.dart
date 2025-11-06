import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripsharemobile_s4/viewModels/itineraryViewModel.dart';

class ViewItineraryDetails extends StatefulWidget{

  @override
  State<ViewItineraryDetails> createState() => _ViewItineraryDetailsState();
}

class _ViewItineraryDetailsState extends State<ViewItineraryDetails> {
  @override
  Widget build(BuildContext context) {
    final itineraryContext = context.watch<ItineraryViewModel>();

    return Scaffold(
      body: SafeArea(child: 
      Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Image(image: NetworkImage('url'), fit: BoxFit.contain,),
          ),

          Positioned(top: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('CITY',  style: TextStyle(fontSize: 30,),),
              SizedBox(height: 35,),
              Text('COUNTRY'),
              SizedBox(height: 20,),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(40)),
                child: Text('December 6 - December 29', style: TextStyle(fontWeight: FontWeight.bold),),
              )
            ],
          )),

          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Description', style: TextStyle(fontWeight: FontWeight.bold),),
                      Text('23 days', style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),

                  SizedBox(height: 15,),

                  Text('Description', overflow: TextOverflow.clip, maxLines: 5,), // check to see how to add that read more thing

                  SizedBox(height: 15,),

                  //Submenu 
                  Row(
                    children: [
                      // each oval pill item
                    ],
                  ),

                  // date and action button
                  Row(
                    children: [
                      Text('Day 1 - 6/12'),
                      FilledButton(onPressed: () {

                      }, style: FilledButton.styleFrom(
                        backgroundColor:  Color(0xFF18C0C1) 
                      ), child: Text('Add Activity', style: TextStyle(
                        color: Colors.white
                      ),))
                    ],
                  ),

                  //activity display
                  ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index){
                      // final activity = activities[index]
                      return Card();
                      // return activity card
                  }
                  )

                ],
              ),
            ),
          )



        ],
      )),
    );
  }
}