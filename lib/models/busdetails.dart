class BusModel {
  String _id;
  String busId;
  String from;
  String to;
  String busType;
  List<String> stops;
  double arrivalTime;
  double departureTime;
  int numOfSeat;
  int availableSeat;
  List<bool> seatNumber;
  double longitude;
  double latitude;

  factory BusModel.fromJson(Map<String, dynamic> json) {
    return BusModel(
      id: json['_id'],
      busId: json['busId'],
      from: json['from'],
      to: json['to'],
      busType: json['busType'],
      stops: List<String>.from(json['stops']),
      arrivalTime: json['arrivalTime'],
      departureTime: json['departureTime'],
      numOfSeat: json['numOfSeat'],
      availableSeat: json['AvailableSeat'],
      seatNumber: List<bool>.from(json['seatNumber']),
      longitude: json['longitude'],
      latitude: json['latitude'],
    );
  }

//<editor-fold desc="Data Methods">
  BusModel({
    required this.busId,
    required this.from,
    required this.to,
    required this.busType,
    required this.stops,
    required this.arrivalTime,
    required this.departureTime,
    required this.numOfSeat,
    required this.availableSeat,
    required this.seatNumber,
    required this.longitude,
    required this.latitude,
    required String id,
  }) : _id = id;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BusModel &&
          runtimeType == other.runtimeType &&
          _id == other._id &&
          busId == other.busId &&
          from == other.from &&
          to == other.to &&
          busType == other.busType &&
          stops == other.stops &&
          arrivalTime == other.arrivalTime &&
          departureTime == other.departureTime &&
          numOfSeat == other.numOfSeat &&
          availableSeat == other.availableSeat &&
          seatNumber == other.seatNumber &&
          longitude == other.longitude &&
          latitude == other.latitude);

  @override
  int get hashCode =>
      _id.hashCode ^
      busId.hashCode ^
      from.hashCode ^
      to.hashCode ^
      busType.hashCode ^
      stops.hashCode ^
      arrivalTime.hashCode ^
      departureTime.hashCode ^
      numOfSeat.hashCode ^
      availableSeat.hashCode ^
      seatNumber.hashCode ^
      longitude.hashCode ^
      latitude.hashCode;

  @override
  String toString() {
    return 'BusModel{' +
        ' _id: $_id,' +
        ' busId: $busId,' +
        ' from: $from,' +
        ' to: $to,' +
        ' busType: $busType,' +
        ' stops: $stops,' +
        ' arrivalTime: $arrivalTime,' +
        ' departureTime: $departureTime,' +
        ' numOfSeat: $numOfSeat,' +
        ' availableSeat: $availableSeat,' +
        ' seatNumber: $seatNumber,' +
        ' longitude: $longitude,' +
        ' latitude: $latitude,' +
        '}';
  }

  BusModel copyWith({
    String? id,
    String? busId,
    String? from,
    String? to,
    String? busType,
    List<String>? stops,
    double? arrivalTime,
    double? departureTime,
    int? numOfSeat,
    int? availableSeat,
    List<bool>? seatNumber,
    double? longitude,
    double? latitude,
  }) {
    return BusModel(
      id: id ?? this._id,
      busId: busId ?? this.busId,
      from: from ?? this.from,
      to: to ?? this.to,
      busType: busType ?? this.busType,
      stops: stops ?? this.stops,
      arrivalTime: arrivalTime ?? this.arrivalTime,
      departureTime: departureTime ?? this.departureTime,
      numOfSeat: numOfSeat ?? this.numOfSeat,
      availableSeat: availableSeat ?? this.availableSeat,
      seatNumber: seatNumber ?? this.seatNumber,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': this._id,
      'busId': this.busId,
      'from': this.from,
      'to': this.to,
      'busType': this.busType,
      'stops': this.stops,
      'arrivalTime': this.arrivalTime,
      'departureTime': this.departureTime,
      'numOfSeat': this.numOfSeat,
      'availableSeat': this.availableSeat,
      'seatNumber': this.seatNumber,
      'longitude': this.longitude,
      'latitude': this.latitude,
    };
  }

  factory BusModel.fromMap(Map<String, dynamic> map) {
    return BusModel(
      id: map['_id'] as String,
      busId: map['busId'] as String,
      from: map['from'] as String,
      to: map['to'] as String,
      busType: map['busType'] as String,
      stops: map['stops'] as List<String>,
      arrivalTime: map['arrivalTime'] as double,
      departureTime: map['departureTime'] as double,
      numOfSeat: map['numOfSeat'] as int,
      availableSeat: map['availableSeat'] as int,
      seatNumber: map['seatNumber'] as List<bool>,
      longitude: map['longitude'] as double,
      latitude: map['latitude'] as double,
    );
  }
}
