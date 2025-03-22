// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class MovieModel {
  final int id;
  final String name;
  final String permalink;
  final String start_date;
  final String end_date;
  final String country;
  final String network;
  final String status;
  final String image_thumbnail_path;

  const MovieModel({
    required this.id,
    required this.name,
    required this.permalink,
    required this.start_date,
    required this.end_date,
    required this.country,
    required this.network,
    required this.status,
    required this.image_thumbnail_path,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'permalink': permalink,
      'start_date': start_date,
      'end_date': end_date,
      'country': country,
      'network': network,
      'status': status,
      'image_thumbnail_path': image_thumbnail_path,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: (map["id"] ?? 0) as int,
      name: (map["name"] ?? '') as String,
      permalink: (map["permalink"] ?? '') as String,
      start_date: (map["start_date"] ?? '') as String,
      end_date: (map["end_date"] ?? '') as String,
      country: (map["country"] ?? '') as String,
      network: (map["network"] ?? '') as String,
      status: (map["status"] ?? '') as String,
      image_thumbnail_path: (map["image_thumbnail_path"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MovieModel(id: $id, name: $name, permalink: $permalink, start_date: $start_date, end_date: $end_date, country: $country, network: $network, status: $status, image_thumbnail_path: $image_thumbnail_path)';
  }
}
