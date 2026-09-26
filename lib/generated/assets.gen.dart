// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bg.png
  AssetGenImage get bg => const AssetGenImage('assets/images/bg.png');

  /// File path: assets/images/book.png
  AssetGenImage get book => const AssetGenImage('assets/images/book.png');

  /// File path: assets/images/brain.png
  AssetGenImage get brain => const AssetGenImage('assets/images/brain.png');

  /// File path: assets/images/dentist_image.png
  AssetGenImage get dentistImage =>
      const AssetGenImage('assets/images/dentist_image.png');

  /// File path: assets/images/drfind1.png
  AssetGenImage get drfind1 => const AssetGenImage('assets/images/drfind1.png');

  /// File path: assets/images/drfind2.png
  AssetGenImage get drfind2 => const AssetGenImage('assets/images/drfind2.png');

  /// File path: assets/images/ellipse.png
  AssetGenImage get ellipse => const AssetGenImage('assets/images/ellipse.png');

  /// File path: assets/images/ellipse1.png
  AssetGenImage get ellipse1 =>
      const AssetGenImage('assets/images/ellipse1.png');

  /// File path: assets/images/ellipses.png
  AssetGenImage get ellipses =>
      const AssetGenImage('assets/images/ellipses.png');

  /// File path: assets/images/facebook.png
  AssetGenImage get facebook =>
      const AssetGenImage('assets/images/facebook.png');

  /// File path: assets/images/feature1.png
  AssetGenImage get feature1 =>
      const AssetGenImage('assets/images/feature1.png');

  /// File path: assets/images/feature2.png
  AssetGenImage get feature2 =>
      const AssetGenImage('assets/images/feature2.png');

  /// File path: assets/images/google.png
  AssetGenImage get google => const AssetGenImage('assets/images/google.png');

  /// File path: assets/images/header.png
  AssetGenImage get header => const AssetGenImage('assets/images/header.png');

  /// File path: assets/images/heart.png
  AssetGenImage get heart => const AssetGenImage('assets/images/heart.png');

  /// File path: assets/images/heart_health.png
  AssetGenImage get heartHealth =>
      const AssetGenImage('assets/images/heart_health.png');

  /// File path: assets/images/home.png
  AssetGenImage get home => const AssetGenImage('assets/images/home.png');

  /// File path: assets/images/hospital.png
  AssetGenImage get hospital =>
      const AssetGenImage('assets/images/hospital.png');

  /// File path: assets/images/live.png
  AssetGenImage get live => const AssetGenImage('assets/images/live.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/map.png
  AssetGenImage get map => const AssetGenImage('assets/images/map.png');

  /// File path: assets/images/message.png
  AssetGenImage get message => const AssetGenImage('assets/images/message.png');

  /// File path: assets/images/neurolog.png
  AssetGenImage get neurolog =>
      const AssetGenImage('assets/images/neurolog.png');

  /// File path: assets/images/onboardin-bg.png
  AssetGenImage get onboardinBg =>
      const AssetGenImage('assets/images/onboardin-bg.png');

  /// File path: assets/images/onboarding1.png
  AssetGenImage get onboarding1 =>
      const AssetGenImage('assets/images/onboarding1.png');

  /// File path: assets/images/onboarding2.png
  AssetGenImage get onboarding2 =>
      const AssetGenImage('assets/images/onboarding2.png');

  /// File path: assets/images/onboarding3.png
  AssetGenImage get onboarding3 =>
      const AssetGenImage('assets/images/onboarding3.png');

  /// File path: assets/images/populare1.png
  AssetGenImage get populare1 =>
      const AssetGenImage('assets/images/populare1.png');

  /// File path: assets/images/populre2.png
  AssetGenImage get populre2 =>
      const AssetGenImage('assets/images/populre2.png');

  /// File path: assets/images/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.png');

  /// File path: assets/images/vision_image.png
  AssetGenImage get visionImage =>
      const AssetGenImage('assets/images/vision_image.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    bg,
    book,
    brain,
    dentistImage,
    drfind1,
    drfind2,
    ellipse,
    ellipse1,
    ellipses,
    facebook,
    feature1,
    feature2,
    google,
    header,
    heart,
    heartHealth,
    home,
    hospital,
    live,
    logo,
    map,
    message,
    neurolog,
    onboardinBg,
    onboarding1,
    onboarding2,
    onboarding3,
    populare1,
    populre2,
    profile,
    visionImage,
  ];
}

abstract final class Assets {
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
