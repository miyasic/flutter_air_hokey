class RoomIdValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Room ID is required';
    }
    if (value.length < 4 || value.length > 8) {
      return 'Room ID must be between 4 and 8 characters';
    }
    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
      return 'Room ID must contain only alphanumeric characters';
    }
    return null;
  }
}
