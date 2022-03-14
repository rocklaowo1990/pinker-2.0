class HttpServer {
  static final HttpServer _instance = HttpServer._internal();
  factory HttpServer() => _instance;

  HttpServer._internal() {
    print('object');
  }
}
