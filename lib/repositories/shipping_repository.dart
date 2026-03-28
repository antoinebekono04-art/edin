
import 'dart:convert';

import 'package:eden/app_config.dart';
import 'package:eden/data_model/delivery_info_response.dart';
import 'package:eden/helpers/shared_value_helper.dart';
import 'package:eden/repositories/api-request.dart';

class ShippingRepository {
  Future<dynamic> getDeliveryInfo({String? guestAddress}) async {
    String url = ("${AppConfig.BASE_URL}/delivery-info");
    Map<String, dynamic> postBodyMap = {};
    if (guest_checkout_status.$ && !is_logged_in.$) {
      postBodyMap['temp_user_id'] = temp_user_id.$;
      if (guestAddress != null) {
        postBodyMap['address'] = jsonDecode(guestAddress);
      }
    } else {
      postBodyMap['user_id'] = user_id.$;
    }

    String postBody = jsonEncode(postBodyMap);

    final response = await ApiRequest.post(
      url: url,
      body: postBody,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${access_token.$}",
        "App-Language": app_language.$!,
      },
    );
    return deliveryInfoResponseFromJson(response.body);
  }
}
