import 'package:http/http.dart' as http;

class ApiResponse{
  final http.Response? response;
  final dynamic error;
  ApiResponse(this.response,this.error);

  ApiResponse.withError(dynamic errorValue)
    : response= null, error=errorValue;

  ApiResponse.withSuccess(http.Response responseValue)
      : response= responseValue, error=null;
}
