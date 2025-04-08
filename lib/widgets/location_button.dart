import 'package:flutter/material.dart';

class LocationButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const LocationButton({
    Key? key,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: isLoading ? null : onPressed,
      icon: isLoading 
        ? const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : const Icon(Icons.location_on),
      label: Text(isLoading ? 'Cargando...' : 'Obtener Ubicación'),
    );
  }
}