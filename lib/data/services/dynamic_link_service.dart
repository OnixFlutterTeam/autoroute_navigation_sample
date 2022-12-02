import 'package:auto_route_demo_flow/arch/logger.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class DynamicLinkService {
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  Future<String> createDynamicLink(bool short) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://autoroutedemo.page.link',
      link: Uri.parse('https://autoroutedemo.page.link/main/settings'),
      androidParameters: const AndroidParameters(
        packageName: 'com.demo.autoroute.auto_route_demo_flow',
        minimumVersion: 1,
      ),
    );

    Uri url;
    if (short) {
      final ShortDynamicLink shortLink =
          await dynamicLinks.buildShortLink(parameters);
      url = shortLink.shortUrl;
    } else {
      url = await dynamicLinks.buildLink(parameters);
    }
    Logger.log('dynamicLinks: $url');
    return url.toString();
  }

  Future<void> retrieveDynamicLink(BuildContext context) async {
    try {
      final PendingDynamicLinkData? data = await dynamicLinks.getInitialLink();
      if (data != null) {
        _handleDeepLink(data, context);
      }
      dynamicLinks.onLink.listen((dynamicLinkData) {
        _handleDeepLink(dynamicLinkData, context);
      }).onError((error) {
        Logger.printException(error);
      });
    } catch (e) {
      Logger.printException(e);
    }
  }

  Future<void> _handleDeepLink(
      PendingDynamicLinkData data, BuildContext context) async {
    final Uri deepLink = data.link;
    Logger.log('deepLink: $deepLink');
  }
}
