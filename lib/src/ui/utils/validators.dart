import 'package:flutter/material.dart';

///For all form validators
abstract class Validators {
  static String? emptyFieldValidator(
    String? value, {
    ValueChanged<bool>? onValidated,
  }) {
    if (value?.isEmpty ?? true) {
      onValidated?.call(false);
      return 'Field cannot be empty!';
    }
    onValidated?.call(true);
    return null;
  }

  static String? lengthLimitValidator(
    String? value,
    int limit, {
    ValueChanged<bool>? onValidated,
  }) {
    if (value?.isEmpty ?? true) {
      onValidated?.call(false);
      return 'Field cannot be empty!';
    }
    if ((value?.length ?? 0) < limit) {
      onValidated?.call(false);
      return 'input must be greater than $limit characters';
    }
    onValidated?.call(true);
    return null;
  }

  static String? confirmPasswordValidator(
    String? value,
    String password, {
    ValueChanged<bool>? onValidated,
  }) {
    if (value?.isEmpty ?? true) {
      onValidated?.call(false);
      return 'Field cannot be empty!';
    }
    if (value != password) {
      onValidated?.call(false);
      return 'must be equal with above password!';
    }
    onValidated?.call(true);
    return null;
  }

  static String? emailValidator(value, {ValueChanged<bool>? onValidated}) {
    if (value?.isEmpty ?? true) {
      onValidated?.call(false);
      return 'Field cannot be empty!';
    }
    final RegExp regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    bool hasMatch = regExp.hasMatch('$value');
    if (value == null || !hasMatch) {
      onValidated?.call(false);
      return 'Please enter a valid email';
    }
    onValidated?.call(true);
    return null;
  }
}
