import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 1)
class PersonHive {

  PersonHive({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.originName,
    required this.originURL,
    required this.image,
    required this.locationName,
    required this.episode,
    required this.locationURL,
    required this.created,
  });

  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String status;

  @HiveField(3)
  String species;

  @HiveField(4)
  String type;

  @HiveField(5)
  String gender;

  @HiveField(6)
  String originName;

  @HiveField(7)
  String originURL;

  @HiveField(8)
  String image;

  @HiveField(9)
  String locationName;

  @HiveField(10)
  String locationURL;

  @HiveField(11)
  DateTime created;

  @HiveField(12)
  List<String> episode;
}
