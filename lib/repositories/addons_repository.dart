import 'package:eden/app_config.dart';
import 'package:eden/data_model/addons_response.dart';
import 'package:eden/repositories/api-request.dart';

class AddonsRepository {
  Future<List<AddonsListResponse>> getAddonsListResponse() async {

    String url = ('${AppConfig.BASE_URL}/addon-list');
    final response = await ApiRequest.get(url: url);

    return addonsListResponseFromJson(response.body);
  }
}

