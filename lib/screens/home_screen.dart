import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location_service.dart';
import '../widgets/map_widget.dart';
import '../widgets/location_button.dart';
import '../widgets/share_button.dart';
import '../models/location_model.dart';
import '../widgets/error_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LocationService _locationService = LocationService();
  LocationModel? _currentLocation;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    setState(() => _isLoading = true);
    try {
      final Position? position = await _locationService.getCurrentLocation();
      if (position != null) {
        setState(() {
          _currentLocation = LocationModel(
            latitude: position.latitude,
            longitude: position.longitude,
          );
        });
      } else {
        _showErrorDialog('No se pudo obtener la ubicación');
      }
    } catch (e) {
      _showErrorDialog('Error al obtener la ubicación');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder:
          (context) =>
              ErrorDialog(message: message, onRetry: _getCurrentLocation),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ShareSpot'), elevation: 2),
      body: Column(
        children: [
          Expanded(child: MapWidget(location: _currentLocation)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: LocationButton(
              onPressed: _getCurrentLocation,
              isLoading: _isLoading,
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 80.0,
        ), // Ajusta este valor para mover el botón más arriba o abajo
        child: ShareButton(location: _currentLocation),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
