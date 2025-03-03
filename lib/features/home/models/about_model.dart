import 'package:flutter/material.dart';

class AboutModel {
  final String subTitle;
  final IconData iconData;

  AboutModel({required this.subTitle, required this.iconData});
}

Map<String, AboutModel> aboutServices = {
  'Skilled Instructors': AboutModel(
    subTitle:
        'Diam elitr kasd sed at elitr sed ipsum justo dolor sed clita amet diam',
    iconData: Icons.school,
  ),
  'Online Classes': AboutModel(
    subTitle:
        'Diam elitr kasd sed at elitr sed ipsum justo dolor sed clita amet diam',
    iconData: Icons.language_rounded,
  ),
  'Home Projects': AboutModel(
    subTitle:
        'Diam elitr kasd sed at elitr sed ipsum justo dolor sed clita amet diam',
    iconData: Icons.home_rounded,
  ),
  'Book Library': AboutModel(
    subTitle:
        'Diam elitr kasd sed at elitr sed ipsum justo dolor sed clita amet diam',
    iconData: Icons.menu_book_outlined,
  ),
};

List<String> skills = [
  'Skilled Instructors',
  'Online Classes',
  'International Certificate',
];
