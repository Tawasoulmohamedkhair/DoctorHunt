import 'package:doctor_hunt/apps/core/di/injection.dart';
import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/models/clinic_location_model.dart';
import 'package:doctor_hunt/apps/core/repository/doctor_repository.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ClinicLocationSection extends StatefulWidget {
  const ClinicLocationSection({super.key});

  @override
  State<ClinicLocationSection> createState() => _ClinicLocationSectionState();
}

class _ClinicLocationSectionState extends State<ClinicLocationSection> {
  late final Future<ClinicLocationModel?> _locationFuture;

  @override
  void initState() {
    super.initState();
    _locationFuture = getIt<DoctorRepository>().getClinicLocation();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(t.clinicLocation, style: context.medium18textSecondary),
        SizedBox(height: context.h(12)),
        FutureBuilder<ClinicLocationModel?>(
          future: _locationFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              debugPrint('Clinic location error: ${snapshot.error}');

              return Text(
                t.unableToLoadClinicLocation,
              );
            }

            final data = snapshot.data;

            if (data == null) {
              return Text(t.clinicLocationUnavailable);
            }

            final address = data.location?.trim() ?? '';
            final latitude = data.latitude;
            final longitude = data.longitude;

            final hasCoordinates =
                latitude != null &&
                longitude != null &&
                latitude >= -90 &&
                latitude <= 90 &&
                longitude >= -180 &&
                longitude <= 180;

            return Container(
              width: double.infinity,
              padding: EdgeInsets.all(context.w(12)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(context.r(16)),
                border: Border.all(
                  color: AppColors.darkgray.withValues(alpha: 0.15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: AppColors.primary,
                        size: context.sp(24),
                      ),
                      SizedBox(width: context.w(8)),
                      Expanded(
                        child: Text(
                          address.isEmpty
                              ? 'Clinic address not provided.'
                              : address,
                          style: context.light13textSub,
                        ),
                      ),
                    ],
                  ),
                  if (hasCoordinates) ...[
                    SizedBox(height: context.h(12)),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(context.r(12)),
                      child: SizedBox(
                        height: context.h(200),
                        child: FlutterMap(
                          options: MapOptions(
                            initialCenter: LatLng(latitude, longitude),
                            initialZoom: 15,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              userAgentPackageName: 'com.example.doctor_hunt',
                              tileProvider: NetworkTileProvider(),
                              maxZoom: 19,
                              keepBuffer: 2,
                              errorTileCallback: (tile, error, stackTrace) {
                                debugPrint('Map tile error: $error');
                              },
                            ),

                            MarkerLayer(
                              markers: [
                                Marker(
                                  point: LatLng(latitude, longitude),
                                  width: 44,
                                  height: 44,
                                  child: const Icon(
                                    Icons.location_pin,
                                    color: AppColors.primary,
                                    size: 44,
                                  ),
                                ),
                              ],
                            ),
                            const RichAttributionWidget(
                              attributions: [
                                TextSourceAttribution(
                                  '© OpenStreetMap contributors',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ] else
                    Padding(
                      padding: EdgeInsets.only(top: context.h(8)),
                      child: Text(
                        'Map coordinates are not available.',
                        style: context.light13textSub,
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

