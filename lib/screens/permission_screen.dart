import 'package:flutter/material.dart';
import '../services/permission_service.dart';

class PermissionScreen extends StatelessWidget {
  const PermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on,
                size: 100,
                color: Colors.blue,
              ),
              const SizedBox(height: 24),
              const Text(
                '¡Bienvenido a ShareSpot!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Para poder mostrar tu ubicación en el mapa, necesitamos tu permiso para acceder a la ubicación del dispositivo.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  final permissionService = PermissionService();
                  final hasPermission = await permissionService.handleLocationPermission();
                  if (hasPermission && context.mounted) {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('No se otorgaron los permisos de ubicación'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text('Continuar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}