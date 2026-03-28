// ignore_for_file: file_names

import 'package:eden/repositories/notification_repository.dart';
import 'package:flutter/material.dart';

class UnReadNotificationCounter extends ChangeNotifier {
  int unReadNotificationCounter = 0;

  getCount() async {
    var res = await NotificationRepository().getUnreadNotification();
    unReadNotificationCounter = res.count ?? 0;
    notifyListeners();
  }
}
