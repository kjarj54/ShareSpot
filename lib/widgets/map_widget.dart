import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../models/location_model.dart';

class MapWidget extends StatefulWidget {
  final LocationModel? location;
  
  const MapWidget({Key? key, this.location}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  MapController? _mapController;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  @override
  void didUpdateWidget(MapWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.location != null && 
        oldWidget.location != widget.location && 
        _mapController != null) {
      _animateToLocation();
    }
  }

  Future<void> _animateToLocation() async {
    try {
      if (_isAnimating || widget.location == null || _mapController == null) return;

      _isAnimating = true;
      _mapController!.move(
        LatLng(widget.location!.latitude, widget.location!.longitude),
        _mapController!.zoom,
      );
      _isAnimating = false;
    } catch (e) {
      _isAnimating = false;
      debugPrint('Error al animar el mapa: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.location == null) {
      return Container(
        color: Colors.grey[200],
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_off,
                size: 64,
                color: Colors.grey,
              ),
              SizedBox(height: 16),
              Text(
                'Ubicación no disponible',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            center: LatLng(widget.location!.latitude, widget.location!.longitude),
            zoom: 15,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.sharespot',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(widget.location!.latitude, widget.location!.longitude),
                  width: 40,
                  height: 40,
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          bottom: 120,
          right: 16,
          child: FloatingActionButton(
            onPressed: _animateToLocation,
            child: const Icon(Icons.center_focus_strong),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }
}