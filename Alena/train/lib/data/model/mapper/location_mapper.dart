import '../../../domain/entity/location_entity.dart';
import '../location_dto/location_dto.dart';

class LocationMapper{
  static List<Location> toLocations(List<LocationDTO> locationModelList) {
    List<Location> newLocationModelList = [];
    for (int i = 0; i < locationModelList.length; i++) {
      newLocationModelList.add(
        Location(
          name: locationModelList[i].name,
          url: locationModelList[i].url,
        ),
      );
    }
    return newLocationModelList;
  }

  static Location toLocation(LocationDTO location) {
    return Location(
      name: location.name,
      url: location.url,
    );
  }
}
