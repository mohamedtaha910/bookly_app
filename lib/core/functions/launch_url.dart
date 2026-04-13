import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('No preview available for this book.')),
    );
    return;
  } else {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Could not launch the preview. Please try again later.',
          ),
        ),
      );
    }
  }
}
