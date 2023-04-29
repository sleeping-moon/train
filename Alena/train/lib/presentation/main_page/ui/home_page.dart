import 'package:flutter/material.dart';
import 'package:train/presentation/main_page/ui/profile_page.dart';
import 'package:train/presentation/utils/widgets/pet_card.dart';
import 'package:train/presentation/utils/widgets/custom_app_bar.dart';

import '../../utils/widgets/custom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45,
                vertical: 20,
              ),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 3,
                      color: Color.fromRGBO(246, 210, 205, 100),
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 3,
                      color: Color.fromRGBO(246, 210, 205, 100),
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  hintText: 'Search..',
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                crossAxisCount: 2,
                children: List.generate(
                  5,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage(
                              title: 'Lalalal',
                            ),
                          ),
                        );
                      },
                      child: const PetCard(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(selectedIndex: 0),
    );
  }
}
