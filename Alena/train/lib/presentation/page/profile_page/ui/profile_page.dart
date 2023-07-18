import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:train/presentation/util/widget/custom_app_bar.dart';
import '../../../../domain/essence/person_entity.dart';
import '../../../util/standard_colors.dart';
import '../../../util/standard_text.dart';
import '../cubit/profile_cubit.dart';

/*class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
    required this.title,
    required this.thisDog,
  });

  final Dog thisDog;
  final String title;

  @override
  State<ProfilePage> createState() => _ProfilePageState(this.thisDog);
}*/

class ProfilePage extends StatelessWidget {
  final getIt = GetIt.instance<StandardColors>();

  late final ProfileCubit _bloc;

  final _font =  GetIt.instance<SharedPreferences>().getInt('font');

  ProfilePage({super.key, required Person thisPerson}) {
    _bloc = ProfileCubit(thisPerson);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocBuilder<ProfileCubit, ProfileInitial>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(),
            body: Stack(
              children: [
                Image.network(
                  state.person.image,
                  width: mediaQuery.size.width,
                  height: mediaQuery.size.height / 3,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      width: (mediaQuery.size.width / 10) * 9.5,
                      margin: EdgeInsets.only(
                        top: mediaQuery.size.height / 4,
                        left: mediaQuery.size.width / 20,
                      ),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 50),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                state.person.name,
                                style: TextStyle(
                                  color: getIt.titleColor,
                                  fontSize: 40 - _font!.toDouble(),
                                  //fontFamily: "Cuprum",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: mediaQuery.size.height / 50,
                          ),
                          Row(
                            children: [
                              Text(
                                state.person.status,
                                style: TextStyle(
                                  color: getIt.textColor,
                                  fontSize: 28,
                                ),
                              ),
                              SizedBox(
                                width: mediaQuery.size.width / 22,
                              ),
                              Text(
                                ' ',
                                style: TextStyle(
                                  color: getIt.textColor,
                                  fontSize: 28,
                                  //fontFamily: "lifespan",
                                ),
                              ),
                              Text(
                                '',
                                style: TextStyle(
                                  color: getIt.textColor,
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
                              Text(
                                'Gender:',
                                style: TextStyle(
                                  color: getIt.title2Color,
                                  fontSize: 16,
                                  //fontFamily: "Cuprum",
                                ),
                              ),
                              Text(
                                state.person.gender,
                                style: TextStyle(
                                  color: getIt.textColor,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                width: mediaQuery.size.width / 22,
                              ),
                              Text(
                                'Species',
                                style: TextStyle(
                                  color: getIt.title2Color,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                state.person.species,
                                style: TextStyle(
                                  color: getIt.textColor,
                                  fontSize: 16,
                                  //fontFamily: "lifespan",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: mediaQuery.size.height / 50,
                          ),
                          Row(children: [
                            Text(
                              'Location:',
                              style: TextStyle(
                                color: getIt.title2Color,
                                fontSize: 16,
                                //fontFamily: "Cuprum",
                              ),
                            ),
                            Text(
                              state.person.location.Name,
                              style: TextStyle(
                                color: getIt.textColor,
                                fontSize: 16,
                              ),
                            ),
                          ]),
                          SizedBox(
                            height: mediaQuery.size.height / 50,
                          ),
                          Row(
                            children: [
                              Text(
                                'Origin:',
                                style: TextStyle(
                                  color: getIt.title2Color,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                state.person.origin.Name,
                                style: TextStyle(
                                  color: getIt.textColor,
                                  fontSize: 16,
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
                              Text(
                                'Type:',
                                style: TextStyle(
                                  color: getIt.title2Color,
                                  fontSize: 16,
                                  //fontFamily: "Cuprum",
                                ),
                              ),
                              Text(
                                state.person.type,
                                style: TextStyle(
                                  color: getIt.textColor,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                width: mediaQuery.size.width / 22,
                              ),
                              Text(
                                'Created:',
                                style: TextStyle(
                                  color: getIt.title2Color,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'state.person.created',
                                style: TextStyle(
                                  color: getIt.textColor,
                                  fontSize: 16,
                                  //fontFamily: "lifespan",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: mediaQuery.size.height / 45,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: mediaQuery.size.width / 4,
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: getIt.titleColor, // Background color
                              ),
                              onPressed: () {_bloc.addToFavourite();},
                              child:  Text(
                                'to favourite',
                                style: TextStyle(
                                  color: getIt.background,
                                  fontSize: 18,
                                  //fontFamily: "Cuprum",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
