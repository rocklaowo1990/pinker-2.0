import 'package:flutter/material.dart';

class HttpServer {
  static final HttpServer _instance = HttpServer._internal();
  factory HttpServer() => _instance;

  HttpServer._internal() {
    debugPrint('object');
  }
}
