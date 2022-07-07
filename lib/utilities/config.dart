import 'package:flutter/material.dart';

class Config {
  // Define color light theme
  static const Color PRIMARY = Color(0xFF206cff);

  // Define ui rules
  static const double PARENT_MARGIN = 20.0;
  static const double SIBLING_MARGIN = 4.0;
  static const double BLUR_RADIUS = 4.0;

  // Define responsive type devices
  static const int MAX_MOBILE_SCREEN = 600;
  static const int MAX_TABLET_SCREEN = 1200;

  // Bucket
  // static const String BUCKET_TO_UPLOAD_1 = 'ember-e-dalbo';
  static const String BUCKET_TO_UPLOAD_1 = 'sl-cleanbucket';

  // api key
  static const String API_KEY = "AIzaSyBN-jri57_w9v-Ub_dZLVo1sw2l4lLvOkk";

  // regex
  static RegExp TEXT_REGEX = RegExp("[^a-zA-Z0-9 `~!@#\$%\^&*()_=+:;',.<>/?\"{}\[\\]\\\\|-]", unicode: true);
  static RegExp PHONE_REGEX = RegExp("[^0-9]", unicode: true);
  static RegExp PHONE_VALID_REGEX = RegExp("[0-9]{4,20}", unicode: true);
  static RegExp CURRENCY_REGEX = RegExp("[0-9.,]+", unicode: true);

  // date pattern
  static const VIEW_PATTERN = 'dd-MM-yyyy';
  static const FILTER_PATTERN = 'yyyy-MM-dd';
}