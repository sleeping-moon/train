import '../../../domain/entity/location_entity.dart';
import '../location_dto/location_dto.dart';

class LocationShell {
  static List<Location> toLocations(List<LocationDTO> locationModelList) {
    List<Location> newLocationModelList = [];
    for (int i = 0; i < locationModelList.length; i++) {
      newLocationModelList.add(
        Location(
          Name: locationModelList[i].name,
          url: locationModelList[i].url,
        ),
      );
    }
    return newLocationModelList;
  }

  static Location toLocation(LocationDTO location) {
    return Location(
      Name: location.name,
      url: location.url,
    );
  }
}
