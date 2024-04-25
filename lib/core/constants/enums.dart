enum TripType {
  oneWay,
  roundTrip,
}

enum ClassType {
  economy,
  premiumEconomy,
  buissness,
  firstClass,
}

enum SelectedField {
  fromField,
  toField,
}

enum TripWay {
  departureWay,
  returnWay,
}

enum SortValues {
  none,
  cheapestFirst,
  tripDuration,
  rating,
  departureTime,
  arrivalTime,
}

enum AuthMode {
  signin,
  signup,
}

enum UserState {
  loggedIn,
  loggedOut,
  loggedInEmailNotVerified,
}
