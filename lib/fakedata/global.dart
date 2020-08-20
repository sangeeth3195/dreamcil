import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color darkBg = Color(0xff000030),
    lighterBg = Color(0xff05053b),
    accent = Color(0xffff785a),
    green = Color(0xFF388E3C),
    beige = Color(0xffe0dac8);
List<Color> productColors = [
  Color(0xffd9e3e4),
  Color(0xffe0dac8),
  Color(0xffffffff),
];
List icons = [
  Icon(
    FontAwesomeIcons.plug,
    color: accent,
  ),
  Icon(
    FontAwesomeIcons.lightbulb,
    color: accent,
  ),
  Icon(
    FontAwesomeIcons.expand,
    color: accent,
  ),
  Icon(
    FontAwesomeIcons.list,
    color: accent,
  ),
];
List<Map<String, dynamic>> productSpecifications = [
  {
    "type": "Kwh",
    "value": "35",
  },
  {
    "type": "Watt",
    "value": "11",
  },
  {
    "type": "Sizes",
    "value": "9",
  },
  {
    "type": "Colors",
    "value": "15",
  },
];
List<String> categories = ["Electrical", "Furniture", "Plumbing"];
List<Map<String, dynamic>> products = [
  {
    "productName": "Seed Pencil",
    "price": "\₹35.00",
    "pictureLink":
        "https://icon2.cleanpng.com/20180202/beq/kisspng-colored-pencil-color-pencils-5a74d16319c8b2.6109197715176052191056.jpg",
  },
  {
    "productName": "Paper Pencil",
    "price": "\₹55.00",
    "pictureLink":
        "https://i.pinimg.com/originals/10/bd/f7/10bdf78031352956b3bf2ac04fdd864c.png",
  },
  {
    "productName": "Rainbow Pencil",
    "price": "\₹161.00",
    "pictureLink":
        "https://www.stickpng.com/assets/images/580b585b2edbce24c47b2858.png",
  },
  {
    "productName": "Velvet Pencil",
    "price": "\₹161.00",
    "pictureLink":
        "https://www.stickpng.com/assets/images/580b585b2edbce24c47b2858.png",
  },
];
