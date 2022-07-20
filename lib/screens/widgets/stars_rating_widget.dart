import 'package:flutter/material.dart';
import 'package:sclp_final/models/rating.dart';

class StarsRatingWidget extends StatelessWidget {
  const StarsRatingWidget({
    Key? key,
    required this.rating,
    this.size = 24,
    this.isLeading = true,
    this.isTrailing = true,
  }) : super(key: key);

  final bool isLeading;
  final bool isTrailing;
  final Rating? rating;
  final double size;

  Icon get starEmpty => Icon(
        Icons.star_border,
        color: Colors.amber,
        size: size,
      );

  Icon get starFull => Icon(
        Icons.star,
        color: Colors.amber,
        size: size,
      );

  Icon get starHalf => Icon(
        Icons.star_half,
        color: Colors.amber,
        size: size,
      );

  List<Icon> getRating() {
    List<Icon> stars = [];
    final rate = rating?.rate ?? 0;
    final integer = rate.floor();
    final fraction = rate % 1;
    for (var i = 0; i < integer; i++) {
      stars.add(starFull);
    }
    if (fraction > 3) stars.add(starHalf);
    while (stars.length < 5) {
      stars.add(starEmpty);
    }
    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (isLeading)
          Container(
            alignment: Alignment.center,
            height: 20,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(5)),
            child: Text("${rating?.rate}"),
          ),
        const SizedBox(
          width: 5,
        ),
        ...getRating(),
        if (isTrailing) Text("(${rating?.count})"),
      ],
    );
  }
}
