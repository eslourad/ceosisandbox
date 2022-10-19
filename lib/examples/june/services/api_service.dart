import 'package:sandbox/examples/june/constants/api_config.dart';

class ApiService {
  static Uri url({
    required String endpoint,
    String query = "",
  }) {
    String fullString;
    String endpointString = '${ApiConfig.baseServerUrl}$endpoint';
    String queryString = query.trim().isNotEmpty ? '/${query.trim()}' : '';
    fullString = '$endpointString$queryString';
    return Uri.parse(fullString);
  }
}
