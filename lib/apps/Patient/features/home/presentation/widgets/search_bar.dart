import 'package:doctor_hunt/apps/Patient/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/Patient/core/router/app_routers.dart';
import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _controller = TextEditingController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final hasText = _controller.text.isNotEmpty;
      if (hasText != _hasText) {
        setState(() => _hasText = hasText);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.h(52),
      child: TextField(
        onTap: () => const FindDoctorsRoute(query: '').push(context),
        controller: _controller,
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          final query = value.trim();
          if (query.isEmpty) return;
          FindDoctorsRoute(query: query).push(context);
        },
        decoration: InputDecoration(
          hintText: t.search,
          hintStyle: context.regular15textSub,
          prefixIcon: const Icon(Icons.search, color: AppColors.textSub),
          suffixIcon: _hasText
              ? IconButton(
                  icon: const Icon(Icons.close, color: AppColors.textSub),
                  onPressed: () {
                    _controller.clear();
                    setState(() => _hasText = false);
                  },
                )
              : null,
          filled: true,
          fillColor: AppColors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(context.r(8)),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(context.r(8)),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(context.r(8)),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: context.w(12),
            vertical: context.h(14),
          ),
        ),
      ),
    );
  }
}
