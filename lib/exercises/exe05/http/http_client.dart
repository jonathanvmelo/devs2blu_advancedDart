import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future get({required String url});
}

class HttpClient implements IHttpClient {
  @override
  Future get({required String url}) async {
    final client = http.Client();
    return await client.get(Uri.parse(url));
  }
}
