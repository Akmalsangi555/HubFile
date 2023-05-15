
import 'package:hub_file_flutter/utils/api_urls.dart';
import 'package:hub_file_flutter/data/network/network_api_services.dart';

class LoginRepository{

  final _apiServices = NetworkApiServices();

  Future<dynamic> loginApiWidget(var data) async {
    dynamic response = await _apiServices.postApi(data, signInApiUrl);
    return response;
  }
}
