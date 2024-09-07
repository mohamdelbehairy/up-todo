import 'package:flutter_svg/svg.dart';

import 'assets.dart';

class CachedSvg {
  static void cachedSvg() {
    const svgImages = [
      Assets.imagesAllNotes,
      Assets.imagesCircleSetting,
      Assets.imagesCreateNote,
      Assets.imagesEvent,
      Assets.imagesFavourite,
      Assets.imagesHidden,
      Assets.imagesNotes,
      Assets.imagesSearch,
      Assets.imagesSendEvent,
      Assets.imagesSplash,
      Assets.imagesSqureCreateEvent,
      Assets.imagesTrash,
    ];
    for (var element in svgImages) {
      var loader = SvgAssetLoader(element);
      svg.cache
          .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    }
  }
}
