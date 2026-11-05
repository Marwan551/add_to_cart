// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsDataGen {
  const $AssetsDataGen();

  /// File path: assets/data/meals.json
  String get meals => 'assets/data/meals.json';

  /// List of all assets
  List<String> get values => [meals];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/addButton.svg
  SvgGenImage get addButton => const SvgGenImage('assets/images/addButton.svg');

  /// File path: assets/images/add_to_cart_icon.svg
  SvgGenImage get addToCartIcon =>
      const SvgGenImage('assets/images/add_to_cart_icon.svg');

  /// File path: assets/images/cart_icon.svg
  SvgGenImage get cartIcon => const SvgGenImage('assets/images/cart_icon.svg');

  /// File path: assets/images/category icon.svg
  SvgGenImage get categoryIcon =>
      const SvgGenImage('assets/images/category icon.svg');

  /// File path: assets/images/category_shrimp.png
  AssetGenImage get categoryShrimp =>
      const AssetGenImage('assets/images/category_shrimp.png');

  /// File path: assets/images/check_box.svg
  SvgGenImage get checkBox => const SvgGenImage('assets/images/check_box.svg');

  /// File path: assets/images/check_icon.svg
  SvgGenImage get checkIcon =>
      const SvgGenImage('assets/images/check_icon.svg');

  /// File path: assets/images/filter_icon.svg
  SvgGenImage get filterIcon =>
      const SvgGenImage('assets/images/filter_icon.svg');

  /// File path: assets/images/heart_icon.svg
  SvgGenImage get heartIcon =>
      const SvgGenImage('assets/images/heart_icon.svg');

  /// File path: assets/images/main_image.svg
  SvgGenImage get mainImage =>
      const SvgGenImage('assets/images/main_image.svg');

  /// File path: assets/images/radio_button.svg
  SvgGenImage get radioButton =>
      const SvgGenImage('assets/images/radio_button.svg');

  /// File path: assets/images/removeButton.svg
  SvgGenImage get removeButton =>
      const SvgGenImage('assets/images/removeButton.svg');

  /// File path: assets/images/return_icon.png
  AssetGenImage get returnIconPng =>
      const AssetGenImage('assets/images/return_icon.png');

  /// File path: assets/images/return_icon.svg
  SvgGenImage get returnIconSvg =>
      const SvgGenImage('assets/images/return_icon.svg');

  /// File path: assets/images/search_cancel_icon.svg
  SvgGenImage get searchCancelIcon =>
      const SvgGenImage('assets/images/search_cancel_icon.svg');

  /// File path: assets/images/search_icon.png
  AssetGenImage get searchIconPng =>
      const AssetGenImage('assets/images/search_icon.png');

  /// File path: assets/images/search_icon.svg
  SvgGenImage get searchIconSvg =>
      const SvgGenImage('assets/images/search_icon.svg');

  /// File path: assets/images/top_menu_icon.png
  AssetGenImage get topMenuIconPng =>
      const AssetGenImage('assets/images/top_menu_icon.png');

  /// File path: assets/images/top_menu_icon.svg
  SvgGenImage get topMenuIconSvg =>
      const SvgGenImage('assets/images/top_menu_icon.svg');

  /// List of all assets
  List<dynamic> get values => [
    addButton,
    addToCartIcon,
    cartIcon,
    categoryIcon,
    categoryShrimp,
    checkBox,
    checkIcon,
    filterIcon,
    heartIcon,
    mainImage,
    radioButton,
    removeButton,
    returnIconPng,
    returnIconSvg,
    searchCancelIcon,
    searchIconPng,
    searchIconSvg,
    topMenuIconPng,
    topMenuIconSvg,
  ];
}

abstract final class Assets {
  static const $AssetsDataGen data = $AssetsDataGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
