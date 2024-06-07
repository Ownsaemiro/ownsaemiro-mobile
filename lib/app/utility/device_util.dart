import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';

import 'log_util.dart';

abstract class DeviceUtil {
  static Future<String> getMobileId() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    String id = '';
    try {
      if (Platform.isAndroid) {
        final AndroidDeviceInfo androidData =
            await deviceInfoPlugin.androidInfo;
        id = androidData.androidId;
      } else if (Platform.isIOS) {
        final IosDeviceInfo iosData = await deviceInfoPlugin.iosInfo;
        id = iosData.identifierForVendor;
      }
    } on PlatformException {
      id = '';
    }

    LogUtil.info("Mobile ID: $id");

    return id;
  }
}
