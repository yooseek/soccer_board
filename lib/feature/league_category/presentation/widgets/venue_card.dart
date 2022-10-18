import 'package:flutter/material.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/team.dart';

class VenueCard extends StatelessWidget {
  final Venue venue;
  const VenueCard({required this.venue, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(venue.name,style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
        Text('도시 : ${venue.city}',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis)),
        Text('주소 : ${venue.address}',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis)),
        Text('지면 : ${venue.surface}',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis)),
      ],
    );
  }
}
