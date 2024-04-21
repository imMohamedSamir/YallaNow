String? validatePassword(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your password';
  }

  // Check for at least one non-alphanumeric character
  if (!value.contains(RegExp(r'[^\w\s]'))) {
    return 'Password must contain at least one non-alphanumeric character';
  }

  // Check for at least one digit
  if (!value.contains(RegExp(r'\d'))) {
    return 'Password must contain at least one digit (0-9)';
  }

  // Check for at least one uppercase letter
  if (!value.contains(RegExp(r'[A-Z]'))) {
    return 'Password must contain at least one uppercase letter (A-Z)';
  }

  // Check if password meets length requirement (e.g., at least 8 characters)
  if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  }

  // Password is valid
  return null;
}
