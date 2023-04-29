import 'package:flutter/material.dart';

class PetCard extends StatelessWidget {
  final String imageUrl;

  final String dogName;

  final String informationAboutDog;

  const PetCard({
    super.key,
    this.informationAboutDog = 'Some important information',
    this.dogName = 'Name',
    this.imageUrl = 'assets/images/Rectangle.png',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            scale: 2,
          ),
          Text(
            dogName,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            informationAboutDog,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
