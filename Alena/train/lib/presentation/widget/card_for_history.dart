import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:train/presentation/util/standard_colors.dart';

import '../../../domain/entity/person_entity.dart';
import '../../domain/repository/shared_preferences_repository.dart';

class CardForHistory extends StatelessWidget {
  final Person person;

  final StandardColors color;
  final int font;

  CardForHistory({
    super.key,
    required this.person,
    required this.font,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.background,
        //borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: color.shadowColor,
            blurRadius: 3,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.network(
              person.image,
              scale: 3,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 261.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    person.name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: color.title2Color,
                      fontSize: 18 + font.toDouble(),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    person.status,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14 + font.toDouble(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
