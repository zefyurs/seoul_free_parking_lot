class Park {
  final String parkingName;
  final String parkingCode;
  final double lat;
  final double lng;

  Park({required this.parkingName, required this.parkingCode, required this.lat, required this.lng});

  Park.fromJson(Map<String, dynamic> json)
      : parkingName = json['PARKING_NAME'],
        parkingCode = json['PARKING_CODE'],
        lat = json['LAT'],
        lng = json['LNG'];

  Map<String, dynamic> toJson() => {
        'PARKING_NAME': parkingName,
        'PARKING_CODE': parkingCode,
        'LAT': lat,
        'LNG': lng,
      };
}
