import 'package:flutter/material.dart';
import 'package:train/presentation/main_page/ui/profile_page.dart';
import 'package:train/presentation/utils/widgets/pet_card.dart';
import 'package:train/presentation/utils/widgets/custom_app_bar.dart';

import '../../utils/widgets/custom_nav_bar.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                left: 25,
              ),
              child: Row(
                children: const [
                  Text(
                    'History',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.indigoAccent,
                    ),
                  ),
                  Icon(
                    Icons.menu_book,
                    color: Colors.indigoAccent,
                    size: 30,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
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
      bottomNavigationBar: const CustomNavBar(selectedIndex: 2),
    );
  }
}
