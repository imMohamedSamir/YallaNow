String hashEmail(String email) {
  // Find the last '@' character to ensure we keep the domain part intact
  int atIndex = email.lastIndexOf('@');

  // If '@' is not found or the local part is too short to be hashed meaningfully, return the original email
  if (atIndex == -1 || atIndex <= 5) {
    return email;
  }

  // Split the email into the part to hash and the part to keep
  String partToHash = email.substring(0, atIndex);
  String partToKeep = email.substring(atIndex);

  // Define the unaltered parts
  String firstTwoChars = partToHash.substring(0, 2);
  String lastThreeChars = partToHash.substring(atIndex - 3, atIndex);

  // Replace the middle part with asterisks
  String middlePart = '*' * (partToHash.length - 5);

  // Combine the unaltered parts and the hashed middle part
  return '$firstTwoChars$middlePart$lastThreeChars$partToKeep';
}
