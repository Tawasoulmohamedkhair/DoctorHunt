import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class ClinicLocationPickerScreen extends StatefulWidget {
  final double? initialLatitude;
  final double? initialLongitude;

  const ClinicLocationPickerScreen({
    super.key,
    this.initialLatitude,
    this.initialLongitude,
  });

  @override
  State<ClinicLocationPickerScreen> createState() =>
      _ClinicLocationPickerScreenState();
}

class _ClinicLocationPickerScreenState
    extends State<ClinicLocationPickerScreen> {
  static const LatLng _defaultLocation = LatLng(24.3420, 56.7290);

  final MapController _mapController = MapController();
  final Geocoding _geocoding = Geocoding();

  late LatLng _selectedLocation;

  String? _selectedAddress;
  bool _isLoadingAddress = false;
  bool _hasAddressError = false;
  int _addressRequestId = 0;

  @override
  void initState() {
    super.initState();

    final latitude = widget.initialLatitude;
    final longitude = widget.initialLongitude;

    _selectedLocation = latitude != null && longitude != null
        ? LatLng(latitude, longitude)
        : _defaultLocation;

    if (latitude != null && longitude != null) {
      _getAddress(_selectedLocation);
    }
  }

  Future<void> _getAddress(LatLng point) async {
    final requestId = ++_addressRequestId;

    setState(() {
      _selectedLocation = point;
      _isLoadingAddress = true;
      _selectedAddress = null;
      _hasAddressError = false;
    });

    try {
      final placemarks = await _geocoding.placemarkFromCoordinates(
        point.latitude,
        point.longitude,
      );

      if (!mounted || requestId != _addressRequestId) return;

      if (placemarks.isEmpty) {
        setState(() {
          _hasAddressError = true;
        });
        return;
      }

      final place = placemarks.first;

      final addressParts =
          [
                place.name,
                place.subLocality,
                place.locality,
                place.subAdministrativeArea,
                place.administrativeArea,
                place.country,
              ]
              .whereType<String>()
              .map((value) => value.trim())
              .where((value) => value.isNotEmpty)
              .toSet()
              .toList();

      setState(() {
        _selectedAddress = addressParts.isEmpty
            ? null
            : addressParts.join(', ');
        _hasAddressError = _selectedAddress == null;
      });
    } catch (e) {
      if (!mounted || requestId != _addressRequestId) return;

      setState(() {
        _hasAddressError = true;
      });
    } finally {
      if (mounted && requestId == _addressRequestId) {
        setState(() {
          _isLoadingAddress = false;
        });
      }
    }
  }

  void _onMapTap(TapPosition tapPosition, LatLng point) {
    // Move the map center to the newly selected point.
    _mapController.move(point, _mapController.camera.zoom);

    _getAddress(point);
  }

  void _confirmLocation() {
    if (_isLoadingAddress) return;

    Navigator.of(context).pop<LatLng>(_selectedLocation);
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(t.chooseClinicLocation)),
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: _selectedLocation,
                initialZoom: 15,
                onTap: _onMapTap,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.doctor_hunt',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _selectedLocation,
                      width: 48,
                      height: 48,
                      child: const Icon(
                        Icons.location_pin,
                        color: AppColors.red,
                        size: 44,
                      ),
                    ),
                  ],
                ),
                RichAttributionWidget(
                  attributions: [
                    TextSourceAttribution('OpenStreetMap contributors'),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (_isLoadingAddress)
                  Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 12),
                      Text(
                        t.gettingLocationAddress,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                else if (_selectedAddress != null)
                  Text(
                    _selectedAddress!,
                    textAlign: TextAlign.center,
                    style: context.mediumPx15,
                  )
                else
                  Text(
                    _hasAddressError
                        ? t.addressUnavailable
                        : t.tapMapToSelectLocation,
                    textAlign: TextAlign.center,
                    style: context.regular.copyWith(color: _hasAddressError ? AppColors.red : AppColors.grey),
                  ),
                const SizedBox(height: 12),
                Text(
                  '${t.latitude}: '
                  '${_selectedLocation.latitude.toStringAsFixed(6)}'
                  '\n${t.longitude}: '
                  '${_selectedLocation.longitude.toStringAsFixed(6)}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoadingAddress ? null : _confirmLocation,
                    child: Text(t.confirmLocation),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
