/// Custom exception class to handle various format-related errors
class TFormatException implements Exception {
  /// The Error code associated with the exception
  final String message;

  /// Constructor that takes an error code
  const TFormatException([this.message ='An unexpected error occurred. Please try again.']);

  /// Create a format exception from a specific error message.
  factory TFormatException.fromMessage(String message) {
    return TFormatException(message);
  }

  /// Get the corresponding error message
  String get formattedMessage => message;

  /// Create a format exception from a specific error code

  factory TFormatException.fromCode(String code) {
    switch (code) {
      case 'Invalid-email-format':
        return const TFormatException('The email address provided is invalid. Please enter a valid email.');
      case 'Invalid-phone-number-format':
        return const TFormatException('The provided phone number format is invalid. Please enter a valid number.');
      case 'Invalid-date-format':
        return const TFormatException('The date format is invalid. Please enter a valid date.');
      case 'Invalid-url-format':
        return const TFormatException('The URL format is invalid. Please enter a valid URL.');
      case 'Invalid-credit-card-format':
        return const TFormatException('The credit card format is invalid.Please enter a valid credit card number.');
      case 'Invalid-numeric-format':
        return const TFormatException('The input should be a valid numeric format.');
      default:
        return const TFormatException("An unexpected error occurred. Please try again.");
    }
  }
}
