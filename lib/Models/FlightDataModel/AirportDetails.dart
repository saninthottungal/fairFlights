class AirportDetails {
  String? name;
  String? city;
  String? cityCode;
  String? countryCode;

  AirportDetails({
    this.city,
    this.cityCode,
    this.countryCode,
    this.name,
  });

  factory AirportDetails.fromJson(Map<String, dynamic> json) {
    return AirportDetails(
      name: json['name'] as String?,
      city: json['city'] as String?,
      cityCode: json['city_code'] as String?,
      countryCode: json['country_code'] as String?,
    );
  }
}
