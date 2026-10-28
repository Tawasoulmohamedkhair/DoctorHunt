import 'dart:io';

import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

enum AppImageShape { rectangle, circle }

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    this.imageUrl,
    this.imageFile,
    required this.width,
    required this.height,
    this.shape = AppImageShape.rectangle,
    this.fit = BoxFit.cover,
    this.borderRadius = 8,
    this.fallback,
    this.backgroundColor = const Color(0xFFF2F2F2),
    this.showLoadingIndicator = false,
  });

  final String? imageUrl;
  final File? imageFile;
  final double width;
  final double height;
  final AppImageShape shape;
  final BoxFit fit;
  final double borderRadius;
  final Widget? fallback;
  final Color backgroundColor;
  final bool showLoadingIndicator;

  bool get _hasValidUrl => imageUrl != null && imageUrl!.trim().isNotEmpty;

  Widget _buildFallback() {
    return Container(
      width: width,
      height: height,
      color: backgroundColor,
      alignment: Alignment.center,
      child: fallback ?? const Icon(Icons.person, color: AppColors.grey, size: 32),
    );
  }

  Widget _buildImage() {
    // الأولوية للصورة المختارة من الجهاز.
    if (imageFile != null) {
      return Image.file(
        imageFile!,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return _buildFallback();
        },
      );
    }

    // إذا لم توجد صورة محلية، نستخدم صورة الشبكة.
    if (!_hasValidUrl) {
      return _buildFallback();
    }

    return Image.network(
      imageUrl!.trim(),
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }

        if (!showLoadingIndicator) {
          return _buildFallback();
        }

        return Container(
          width: width,
          height: height,
          color: backgroundColor,
          alignment: Alignment.center,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return _buildFallback();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final image = _buildImage();

    switch (shape) {
      case AppImageShape.circle:
        final size = width < height ? width : height;

        return SizedBox(
          width: size,
          height: size,
          child: ClipOval(
            child: SizedBox(width: size, height: size, child: image),
          ),
        );

      case AppImageShape.rectangle:
        return ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: SizedBox(width: width, height: height, child: image),
        );
    }
  }
}
