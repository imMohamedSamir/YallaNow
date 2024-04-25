String? phoneOrMailValidation(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your Email or phone number';
  }
  if (value.startsWith("0")) {
    if (value.length > 11 || value.length < 11) {
      return 'Please enter correct mobile number ';
    }
  } else if (!value.contains("@")) {
    return 'Please enter correct email ';
  }
  return null;
}

bool? phoneOrMailCheck(String? value) {
  if (value!.startsWith("0")) {
    if (value.length > 11 || value.length < 11) {
      return true;
    }
    return true;
  } else if (!value.contains("@")) {
    return false;
  }
  return false;
}
