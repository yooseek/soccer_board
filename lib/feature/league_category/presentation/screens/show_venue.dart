import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soccer_board/core/presentation/widgets/backdropfilter_list.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/team.dart';
import 'package:soccer_board/feature/league_category/presentation/widgets/venue_card.dart';

class ShowVenue extends StatelessWidget {
  final Venue venue;
  const ShowVenue({required this.venue, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(2), topLeft: Radius.circular(2)),
              child: venue.image.endsWith('png')
                  ? Image.network(
                venue.image,
                height: 100,
                width: 100,
                fit: BoxFit.contain,
              )
                  : SvgPicture.network(
                venue.image,
                height: 100,
                width: 100,
                fit: BoxFit.contain,
                cacheColorFilter: true,
              ),
            ),
          ),
          BackDropFilterList(
            topPadding: size.height * 0.8,
            childList: [VenueCard(venue: venue)],
            deviceSize: size,
            disableByScrollWidget: true,
          ),
        ],
      ),
    );
  }
}
