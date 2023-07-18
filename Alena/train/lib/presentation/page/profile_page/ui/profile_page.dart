import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train/presentation/util/standard_text.dart';

import '../../../../domain/entity/episode_entity.dart';
import '../../../../domain/entity/person_entity.dart';
import '../../../util/standard_colors.dart';
import '../cubit/profile_cubit.dart';

class ProfilePage extends StatelessWidget {
  late final ProfileCubit _bloc;

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
            backgroundColor: _bloc.color.background,
            body: Stack(
              children: [
                Image.network(
                  state.person.image,
                  width: mediaQuery.size.width,
                  height: mediaQuery.size.height / 2.5,
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
                        right: mediaQuery.size.width / 20,
                      ),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: _bloc.color.profileBackground,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: SizedBox(
                        width: mediaQuery.size.width - 40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: mediaQuery.size.width - 40,
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      state.person.name,
                                      style: TextStyle(
                                        color: _bloc.color.titleColor,
                                        fontSize:
                                            40 + _bloc.font.toDouble(),
                                        //fontFamily: "Cuprum",
                                      ),
                                      maxLines: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: mediaQuery.size.height / 30,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    state.person.status,
                                    style: TextStyle(
                                      color: _bloc.color.textColor,
                                      fontSize: 28 + _bloc.font.toDouble(),
                                    ),
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
                                  StandardText.gender,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: _bloc.color.title2Color,
                                    fontSize: 18 + _bloc.font.toDouble(),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    state.person.gender,
                                    style: TextStyle(
                                      color: _bloc.color.textColor,
                                      fontSize: 16 + _bloc.font.toDouble(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: mediaQuery.size.width / 22,
                                ),
                                Text(
                                  StandardText.species,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: _bloc.color.title2Color,
                                    fontSize: 18 + _bloc.font.toDouble(),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    state.person.species,
                                    style: TextStyle(
                                      color: _bloc.color.textColor,
                                      fontSize: 16 + _bloc.font.toDouble(),
                                      //fontFamily: "lifespan",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: mediaQuery.size.height / 50,
                            ),
                            SizedBox(
                              width: mediaQuery.size.width - 40,
                              child: Row(
                                children: [
                                  Text(
                                    StandardText.location,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: _bloc.color.title2Color,
                                      fontSize: 18 + _bloc.font.toDouble(),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      state.person.location.name,
                                      style: TextStyle(
                                        color: _bloc.color.textColor,
                                        fontSize:
                                            16 + _bloc.font.toDouble(),
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: mediaQuery.size.height / 50,
                            ),
                            SizedBox(
                              width: mediaQuery.size.width - 40,
                              child: Row(
                                children: [
                                  Text(
                                    StandardText.origin,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: _bloc.color.title2Color,
                                      fontSize: 18 + _bloc.font.toDouble(),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      state.person.origin.name,
                                      style: TextStyle(
                                        color: _bloc.color.textColor,
                                        fontSize:
                                            16 + _bloc.font.toDouble(),
                                        //fontFamily: "lifespan",
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: mediaQuery.size.height / 50,
                            ),
                            Row(
                              children: [
                                Text(
                                  StandardText.type,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: _bloc.color.title2Color,
                                    fontSize: 18 + _bloc.font.toDouble(),
                                  ),
                                ),
                                Text(
                                  state.person.type,
                                  style: TextStyle(
                                    color: _bloc.color.textColor,
                                    fontSize: 16 + _bloc.font.toDouble(),
                                  ),
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  width: mediaQuery.size.width / 22,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: mediaQuery.size.height / 50,
                            ),
                            Row(
                              children: [
                                Text(
                                  StandardText.created,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: _bloc.color.title2Color,
                                    fontSize: 18 + _bloc.font.toDouble(),
                                  ),
                                ),
                                Text(
                                  '${state.person.created.day}.${state.person.created.month}.${state.person.created.year}',
                                  style: TextStyle(
                                    color: _bloc.color.textColor,
                                    fontSize: 16 + _bloc.font.toDouble(),
                                    //fontFamily: "lifespan",
                                  ),
                                  maxLines: 2,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: mediaQuery.size.height / 45,
                            ),
                            !state.isFetched
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        StandardText.episodes,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: _bloc.color.title2Color,
                                          fontSize:
                                              18 + _bloc.font.toDouble(),
                                        ),
                                      ),
                                      ListView.separated(
                                        padding:
                                            const EdgeInsets.only(top: 2),
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: state.episode.length,
                                        itemBuilder: (BuildContext context,
                                            int index) {
                                          return EpisodeTile(
                                            episode: state.episode[index],
                                            color: _bloc.color,
                                            font: _bloc.font,
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context,
                                                int index) {
                                          if ((index + 1) % 3 == 0) {
                                            return const SizedBox(
                                                height: 15);
                                          } else {
                                            return const SizedBox(
                                                height: 0);
                                          }
                                        },
                                      )
                                    ],
                                  )
                                : const SizedBox(),
                            SizedBox(
                              height: mediaQuery.size.height / 45,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: mediaQuery.size.width / 4,
                              ),
                              child: !state.isFavourite
                                  ? ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: _bloc.color
                                            .titleColor, // Background color
                                      ),
                                      onPressed: () {
                                        _bloc.addToFavourite();
                                      },
                                      child: Text(
                                        StandardText.toFavourite,
                                        style: TextStyle(
                                          color: _bloc.color.background,
                                          fontSize: 18,
                                        ),
                                      ),
                                    )
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: _bloc.color
                                            .titleColor, // Background color
                                      ),
                                      onPressed: () {
                                        _bloc.deletePersonFromFavourite();
                                      },
                                      child: Text(
                                        StandardText.fromFavourite,
                                        style: TextStyle(
                                          color: _bloc.color.background,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                            ),
                          ],
                        ),
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

class EpisodeTile extends StatelessWidget {
  final Episode episode;

  final StandardColors color;
  final int font;

  EpisodeTile({
    super.key,
    required this.episode,
    required this.font,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color.appBarColor),
        //color: color.background,
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            //alignment: Alignment.centerLeft,
            child: Text(
              episode.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color.textColor,
                fontSize: 16 + font.toDouble(),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Align(
            //alignment: Alignment.centerLeft,
            child: Text(
              '(${episode.orderOfTheEpisode})',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color.textColor,
                fontSize: 16 + font.toDouble(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
