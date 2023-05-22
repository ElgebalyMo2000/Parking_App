// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

class ReservationsModel {
  int? duration;
  int? id;
  String? state;
  String? customer_name;

  ReservationsModel.fromJson(Map<String, dynamic> json) {
    duration = json['duration'];
    id = json['id'];
    state = json['state'];
    customer_name = json['customerName'];
  }
}
