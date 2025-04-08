import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../models/location_model.dart';

class ShareButton extends StatelessWidget {
  final LocationModel? location;

  const ShareButton({Key? key, this.location}) : super(key: key);

  void _shareLocation() {
    if (location != null) {
      Share.share(
        'Mi ubicación actual: ${location.toString()}',
        subject: 'Compartir Ubicación',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: location != null ? _shareLocation : null,
      child: const Icon(Icons.share),
    );
  }
}