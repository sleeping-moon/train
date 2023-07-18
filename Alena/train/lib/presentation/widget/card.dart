import 'package:flutter/material.dart';
import '../../../domain/entity/person_entity.dart';
import '../util/standard_colors.dart';

class PersonCard extends StatelessWidget {
  final Person person;
  final int font ;
  final StandardColors color ;

  const PersonCard({
    super.key,
    required this.person,
    required this.color,
    required this.font,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: mediaQuery.size.height / 5.5,
          child: Image.network(
            person.image,
            fit: BoxFit.fill,
            scale: 3,
          ),
        ),
        Center(
          child: Text(
            person.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14 + font.toDouble(),
              color: color.title2Color,
            ),
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
