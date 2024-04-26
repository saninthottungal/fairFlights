//signin exceptions

class InvalidEmailException implements Exception {}

class UserDisabledException implements Exception {}

class UserNotFoundException implements Exception {}

class WrongPasswordException implements Exception {}

class InvalidCredentialsException implements Exception {}

//signup exception

class EmailAlreadyInUseException implements Exception {}

class WeakPasswordException implements Exception {}

class OperationNotAllowedException implements Exception {}

class TooManyRequestsException implements Exception {}
