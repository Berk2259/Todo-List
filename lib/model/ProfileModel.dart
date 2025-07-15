import 'package:flutter/material.dart';

class ProfileModel {
  final IconData icon;
  final String Name;
  final Color color;
  final Widget destination;

  const ProfileModel({
    required this.icon,
    required this.Name,
    required this.color,
    required this.destination,
  });
}
