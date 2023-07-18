import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:train/presentation/util/standard_colors.dart';

import '../../../domain/essence/person_entity.dart';


class CardForHistory extends StatelessWidget {
  final Person person;

  final getIt = GetIt.instance<StandardColors>();//todo

  final _font =  GetIt.instance<SharedPreferences>().getInt('font');

  CardForHistory({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: getIt.background,
        //borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: getIt.shadowColor,
            blurRadius: 3,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.left,
        children: [
          Image.network(
            person.image,
            scale: 3,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Align(
                child: Text(
                  person.name,
                  style:  TextStyle(
                    color: const Color.fromRGBO(157, 116, 177, 10),
                    fontSize: 18 -_font!.toDouble(),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Align(
                child: Text(
                  person.status,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
