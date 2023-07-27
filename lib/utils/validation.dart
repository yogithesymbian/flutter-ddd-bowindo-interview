String? validationEmpty(String? value) {
  if (value!.isEmpty) {
    return 'This field is required';
  } else {
    return null;
  }
}
