bool isValidPassword(String password) {
  if (password.length < 8) {
    return false;
  }
  return true;
}

bool isValidEmail(String email) {
  if (email.isEmpty) return false;
  final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
  return emailRegex.hasMatch(email);
}
