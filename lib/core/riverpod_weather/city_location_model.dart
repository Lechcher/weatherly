class CityLocationModel {
  final String id;
  final String name;
  final String country;
  final double lat;
  final double lon;

  CityLocationModel({
    required this.id,
    required this.name,
    required this.country,
    required this.lat,
    required this.lon,
  });

  factory CityLocationModel.fromPhotonFeature(Map<String, dynamic> feature) {
    final props = feature["properties"];
    final geometry = feature["geometry"];
    final double lat = (geometry["coordinates"][1] as num).toDouble();
    final double lon = (geometry["coordinates"][0] as num).toDouble();

    if (props == null) {
      throw Exception("properties is null");
    }

    return CityLocationModel(
      id: "${lat}_${lon}",
      name: props["name"] ?? props["city"] ?? props["town"] ?? "Unknown",
      country: props["country"] ?? "",
      lat: lat,
      lon: lon,
    );
  }
}
