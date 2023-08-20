import 'package:flutter/material.dart';
import 'package:flutter_fitness/model/workout_details.dart';
import 'package:flutter_fitness/widget/workout_category.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularWorkout extends StatelessWidget {
  final int index;
  final Size size;

  PopularWorkout(this.index, this.size);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet<dynamic>(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (_) {
            return Wrap(
              children: [
                WorkoutCategory(),
              ],
            );
          },
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          width: size.width * 0.35,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(workouts[index].imageUrl),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                child: Text(
                  workouts[index].title,
                  style: GoogleFonts.nunito(
                    color: Color(0xff0178b8),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
