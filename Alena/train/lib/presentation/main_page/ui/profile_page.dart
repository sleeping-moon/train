import 'package:flutter/material.dart';
import 'package:train/presentation/utils/widgets/custom_app_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String _informationAboutDog = 'Some important information';
  final String _dogName = 'Marcel';
  final String _imageUrl = 'assets/images/img_1.png';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          Image.asset(
            _imageUrl,
            width: mediaQuery.size.width,
            height: mediaQuery.size.height / 3,
            fit: BoxFit.fill,
          ),
          Positioned(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: (mediaQuery.size.width / 10) * 9,
                margin: EdgeInsets.only(
                  top: mediaQuery.size.height / 4,
                  left: mediaQuery.size.width / 20,
                ),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 50),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _dogName,
                      style: const TextStyle(
                        color: Colors.indigoAccent,
                        fontSize: 40,
                        //fontFamily: "Cuprum",
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.size.height / 50,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Akita-Inu',
                          style: TextStyle(
                            color: Color.fromRGBO(125, 125, 125, 20),
                            fontSize: 28,
                            //fontFamily: "Cuprum",
                          ),
                        ),
                        SizedBox(
                          width: mediaQuery.size.width / 22,
                        ),
                        const Text(
                          '6',
                          style: TextStyle(
                            color: Color.fromRGBO(125, 125, 125, 20),
                            fontSize: 28,
                            //fontFamily: "lifespan",
                          ),
                        ),
                        const Text(
                          ' years',
                          style: TextStyle(
                            color: Color.fromRGBO(125, 125, 125, 20),
                            fontSize: 28,
                            //fontFamily: "lifespan",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: mediaQuery.size.height / 50,
                    ),
                    Row(
                      children: [
                        /* const Icon(Icons.height,
                            color:Color.fromRGBO(157, 116, 177, 10),
                             size: 22,),*/
                        const Text(
                          'Height: ',
                          style: TextStyle(
                            color: Color.fromRGBO(157, 116, 177, 10),
                            fontSize: 22,
                            //fontFamily: "Cuprum",
                          ),
                        ),
                        const Text(
                          '72 cm',
                          style: TextStyle(
                            color: Color.fromRGBO(125, 125, 125, 20),
                            fontSize: 22,
                            //fontFamily: "Cuprum",
                          ),
                        ),
                        SizedBox(
                          width: mediaQuery.size.width / 22,
                        ),
                        /*const Icon(Icons.scale_outlined,
                          color:Color.fromRGBO(157, 116, 177, 10),
                          size: 22,),*/
                        const Text(
                          'Weight: ',
                          style: TextStyle(
                            color: Color.fromRGBO(157, 116, 177, 10),
                            fontSize: 22,
                            //fontFamily: "lifespan",
                          ),
                        ),
                        const Text(
                          '42 kg',
                          style: TextStyle(
                            color: Color.fromRGBO(125, 125, 125, 20),
                            fontSize: 22,
                            //fontFamily: "lifespan",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: mediaQuery.size.height / 50,
                    ),
                    const Text(
                      'Care: ',
                      style: TextStyle(
                        color: Color.fromRGBO(157, 116, 177, 10),
                        fontSize: 34,
                        //fontFamily: "Cuprum",
                      ),
                    ),
                    const Text(
                      "Taking care of an Akita Inu doesn't require much effort. It can be kept both in the apartment and outside. You should not bathe the dog often, one or two times a year is usually enough. It is recommended to comb out the hair a couple of times a week to reduce the amount of it in the house. The most important thing for this dog is daily walks.",
                      style: TextStyle(
                        color: Color.fromRGBO(125, 125, 125, 20),
                        fontSize: 20,
                        //fontFamily: "Cuprum",
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.size.height / 45,
                    ),
                    /*Container(
                     margin: EdgeInsets.only(
                       left: mediaQuery.size.width / 3.5,
                     ),
                     child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigoAccent, // Background color
                      ),
                      onPressed: () {},
                      child: const Text('Button',
                        style: TextStyle(
                          color: Color.fromRGBO(250, 250, 250, 20),
                          fontSize: 27,
                          //fontFamily: "Cuprum",
                        ),
                      ),
                    ),
                   ),*/
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
