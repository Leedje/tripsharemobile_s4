import 'package:flutter/material.dart';

class ItineraryCard extends StatelessWidget{
  //itinerary required.this

  @override
  Widget build(BuildContext context) {
     return Card(
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Row(
          children: [
            Container(margin: EdgeInsets.all(5), padding: EdgeInsets.all(5), width: 135, height: 130,decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), image: DecorationImage(alignment: Alignment.center, fit: BoxFit.fill, image: NetworkImage('https://www.turtlefiji.com/wp-content/uploads/2024/10/pexels-julius-silver-240301-753626.jpg')))
            ),
            SizedBox(width: 10),
            Container(
              height: 150,
              width: 160, // height is fixed, but width should match the width of the device's screen
              child: Column(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bali Vaca', style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('6/12/2025 - 29/12/2025', style: TextStyle(fontWeight: FontWeight.w100),)
                  ,Text('This is going to be the vacation of our lives! This is going to be the vacation of our lives', maxLines: 4, overflow: TextOverflow.clip,) 
                ],
              ),
            )
          ],
        ),
      ),
     );
  }
}