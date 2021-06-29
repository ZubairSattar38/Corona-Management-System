import 'dart:convert';

import 'package:flutter/material.dart';

class Dose {
  final int id;
  final String name;
  final int no_of_dozes;
  Dose({
    required this.id,
    required this.name,
    required this.no_of_dozes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'no_of_dozes': no_of_dozes,
    };
  }

  factory Dose.fromMap(Map<String, dynamic> map) {
    return Dose(
      id: map['id'],
      name: map['name'],
      no_of_dozes: map['no_of_dozes']!,
    );
  }

  String toJson() => json.encode(toMap());

  factory Dose.fromJson(String source) => Dose.fromMap(json.decode(source));
}
