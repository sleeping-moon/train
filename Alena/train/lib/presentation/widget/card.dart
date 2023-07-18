import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/essence/person_entity.dart';


class PersonCard extends StatelessWidget {

  final Person person;
  final _font =  GetIt.instance<SharedPreferences>().getInt('font');

  PersonCard({
    super.key,
    required this.person
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 160,
            child: Image.network(
              person.image,
              fit: BoxFit.fill,
              //scale: 3,
            ),
          ),
          Text(
            person.name,
            style:  TextStyle(
              fontSize: 14 - _font!.toDouble(),
            ),
          ),
        ],
      ),
    );
  }
}
