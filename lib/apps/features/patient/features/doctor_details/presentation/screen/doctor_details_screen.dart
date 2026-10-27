import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/helper/medical_service_localization.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widget/doctor_card.dart';
import 'package:doctor_hunt/apps/core/widget/header_appbar.dart';
import 'package:doctor_hunt/apps/features/patient/features/doctor_details/presentation/cubit/doctordetails_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/doctor_details/presentation/cubit/doctordetails_state.dart';
import 'package:doctor_hunt/apps/features/patient/features/doctor_details/presentation/widget/clinic_location_section.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/cubit/favorites_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/favourites/presentation/cubit/favorites_state.dart';
import 'package:doctor_hunt/apps/router/app_routers.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DoctorDetailsScreen extends StatefulWidget {
  final String doctorId;

  const DoctorDetailsScreen({super.key, required this.doctorId});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  @override
  void initState() {
    super.initState();

    context.read<DoctorDetailsCubit>().loadDoctorDetails(widget.doctorId);

    final patientId = Supabase.instance.client.auth.currentUser?.id;

    if (patientId != null) {
      context.read<FavoritesCubit>().loadFavorites(patientId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.images.bg.path, fit: BoxFit.cover),
          ),
          SafeArea(
            bottom: false,
            child: BlocBuilder<DoctorDetailsCubit, DoctorDetailsState>(
              builder: (context, state) {
                if (state is DoctorDetailsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is DoctorDetailsError) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(context.w(16)),
                      child: Text(state.message, textAlign: TextAlign.center),
                    ),
                  );
                }

                if (state is DoctorDetailsLoaded) {
                  final DoctorModel doctor = state.doctor;

                  return SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.w(16),
                      vertical: context.h(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: context.h(10)),

                        HeaderAppBar(
                          title: t.doctorDetails,
                          actionIcon: Icons.search,
                        ),

                        SizedBox(height: context.h(16)),

                        // Doctor information
                        BlocBuilder<FavoritesCubit, FavoritesState>(
                          builder: (context, favoritesState) {
                            final isFavorite = favoritesState.doctorIds
                                .contains(doctor.id);
                            return DoctorCard(
                              doctor: doctor,
                              isFavorite: isFavorite,
                              showFee: true,
                              showButton: true,
                              buttonLabel: 'Book Now',
                              onButtonTap: () {
                                SelectTimeRoute(
                                  doctorId: doctor.id,
                                ).push(context);
                              },
                              onFavoriteTap: () {
                                final patientId = Supabase
                                    .instance
                                    .client
                                    .auth
                                    .currentUser
                                    ?.id;

                                if (patientId == null) return;

                                context.read<FavoritesCubit>().toggleFavorite(
                                  patientId: patientId,
                                  doctorId: doctor.id,
                                );
                              },
                            );
                          },
                        ),

                        SizedBox(height: context.h(24)),

                        // Doctor services
                        Text(t.service, style: context.medium18textSecondary),

                        SizedBox(height: context.h(12)),

                        if (state.services.isEmpty)
                          Text(
                            t.noServicesAvailableForDoctor,
                            style: context.light13textSub,
                          )
                        else
                          ...state.services.map(
                            (service) => Padding(
                              padding: EdgeInsets.only(bottom: context.h(10)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.check_circle_outline,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    size: context.sp(18),
                                  ),
                                  SizedBox(width: context.w(8)),
                                  Expanded(
                                    child: Text(
                                      localizeMedicalService(context, service),
                                      style: context.light13textSub,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        SizedBox(height: context.h(20)),
                        // Patient reviews
                        _DoctorReviewsSection(
                          doctor: doctor,
                          reviews: state.reviews,
                        ),

                        SizedBox(height: context.h(20)),

                        // Clinic location
                        const ClinicLocationSection(),

                        SizedBox(height: context.h(20)),
                        SizedBox(height: context.h(20)),
                      ],
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _DoctorReviewsSection extends StatelessWidget {
  const _DoctorReviewsSection({required this.doctor, required this.reviews});

  final DoctorModel doctor;
  final List<Map<String, dynamic>> reviews;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                t.patientReviews,
                style: context.medium18textSecondary,
              ),
            ),
            Text(
              '${doctor.reviewsCount} ${t.reviews}',
              style: context.light13textSub,
            ),
          ],
        ),
        SizedBox(height: context.h(12)),
        if (reviews.isEmpty)
          Padding(
            padding: EdgeInsets.symmetric(vertical: context.h(12)),
            child: Text(t.noReviewsYet, style: context.light13textSub),
          )
        else
          ...reviews.map(
            (review) => Padding(
              padding: EdgeInsets.only(bottom: context.h(12)),
              child: _ReviewCard(review: review),
            ),
          ),
      ],
    );
  }
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({required this.review});

  final Map<String, dynamic> review;

  Map<String, dynamic> _asMap(dynamic value) {
    if (value is Map<String, dynamic>) {
      return value;
    }

    if (value is Map) {
      return Map<String, dynamic>.from(value);
    }

    if (value is List && value.isNotEmpty && value.first is Map) {
      return Map<String, dynamic>.from(value.first as Map);
    }

    return {};
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final patient = _asMap(review['patients']);
    final user = _asMap(patient['users']);

    final name = user['full_name']?.toString().trim().isNotEmpty == true
        ? user['full_name'].toString()
        : t.patient;

    final comment = review['comment']?.toString().trim() ?? '';

    final rawRating = review['rating'];
    final rating =
        (rawRating is num
                ? rawRating.toInt()
                : int.tryParse(rawRating?.toString() ?? '') ?? 0)
            .clamp(0, 5)
            .toInt();

    final createdAt = review['created_at']?.toString();
    final parsedDate = createdAt == null
        ? null
        : DateTime.tryParse(createdAt)?.toLocal();

    final dateLabel = parsedDate == null
        ? ''
        : MaterialLocalizations.of(context).formatMediumDate(parsedDate);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.w(14)),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(context.r(12)),
        border: Border.all(color: AppColors.darkgray.withValues(alpha: 0.15)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: context.r(20),
                backgroundColor: AppColors.surfaceMint,
                child: Text(
                  name.isEmpty ? 'P' : name[0].toUpperCase(),
                  style: context.semiBold.copyWith(color: AppColors.primary),
                ),
              ),
              SizedBox(width: context.w(10)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.mediumPx13.copyWith(color: AppColors.textSecondary),
                    ),
                    if (dateLabel.isNotEmpty) ...[
                      const SizedBox(height: 3),
                      Text(
                        dateLabel,
                        style: context.light13textSub.copyWith(fontSize: 11),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: context.h(8)),
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < rating ? Icons.star : Icons.star_border,
                size: context.sp(17),
                color: const Color(0xFFFFB400),
              ),
            ),
          ),
          if (comment.isNotEmpty) ...[
            SizedBox(height: context.h(8)),
            Text(comment, style: context.light13textSub),
          ] else ...[
            SizedBox(height: context.h(8)),
            Text(
              t.noWrittenComment,
              style: context.light13textSub.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ],
      ),
    );
  }
}


