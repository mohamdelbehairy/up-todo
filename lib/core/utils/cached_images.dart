import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'assets.dart';

abstract class CachedImages {
  static const _svgImages = [
    Assets.imagesAllNotes,
    Assets.imagesCircleSetting,
    Assets.imagesCreateNote,
    Assets.imagesEvent,
    Assets.imagesFavourite,
    Assets.imagesHidden,
    Assets.imagesNotes,
    Assets.imagesSearch,
    Assets.imagesSendEvent,
    Assets.imagesSqureCreateEvent,
    Assets.imagesTrash,
    Assets.imagesSplashAs
  ];

  static const _pngImages = [
    Assets.imagesLogo,
    Assets.imagesOnBoardingOne,
    Assets.imagesOnBoardingTwo,
    Assets.imagesOnBoardingThree,
    Assets.imagesSplash,
    Assets.imagesStickyNote
  ];

  static Future<void> _loadSvgImages() async {
    for (var element in _svgImages) {
      var loader = SvgAssetLoader(element);
      await svg.cache
          .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    }
  }

  static Future<void> _loadPngImages(BuildContext context) async {
    for (var image in _pngImages) {
      await precacheImage(AssetImage(image), context);
    }
  }

  static Future<void> loadImages(BuildContext context) async {
    await Future.wait([
      _loadSvgImages(),
      _loadPngImages(context),
    ]);
    log("Images loaded successfully!");
  }
}
