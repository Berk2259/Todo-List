import 'package:flutter/material.dart';
import 'package:todolist/Screen/DescriptionScreen.dart';
import 'package:todolist/Screen/SettingsScreen.dart';
import 'package:todolist/model/ProfileModel.dart';

const List<ProfileModel> profileItems = [
  ProfileModel(
    icon: Icons.settings,
    Name: 'Ayarlar',
    color: Colors.orange,
    destination: SettingsScreen(),
  ),
  ProfileModel(
    icon: Icons.description,
    Name: 'Açıklama',
    color: Colors.red,
    destination: DescriptionScreen(),
  ),
];
