String? validateRequiredEmail(String? email) {
  // Check if email is empty
  if (email == null || email.isEmpty) {
    return emailIsRequired;
  }
  // Regular expression for email validation
  final RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9+_.'’‘’-]+@[a-zA-Z0-9.'’‘’-]+$",
  );
  // Check if email matches the regex pattern
  if (!emailRegex.hasMatch(email)) {
    return emailIsRequired;
  }
  return null;
}
const emailIsRequired="Email is required";

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return  "Please enter your password";
  }
  // Regular expression to check for at least one number, one symbol, one lowercase and one uppercase letter
  String pattern = r'^(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>])(?=.*[a-z])(?=.*[A-Z]).{8,}$';
  RegExp regex = RegExp(pattern);

  if (!regex.hasMatch(value)) {
    return 'Password must contain at least one number, one symbol, one lowercase and one uppercase letter';
  }

  if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  }
  return null; // Return null if the password is valid
}