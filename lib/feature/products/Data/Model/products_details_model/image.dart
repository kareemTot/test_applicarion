import 'package:equatable/equatable.dart';

class Image extends Equatable {
  final String? id;
  final String? name;
  final String? group;
  final String? url;
  final String? relativeUrl;
  final int? sortOrder;
  final dynamic cultureName;

  const Image({
    this.id,
    this.name,
    this.group,
    this.url,
    this.relativeUrl,
    this.sortOrder,
    this.cultureName,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json['id'] as String?,
    name: json['name'] as String?,
    group: json['group'] as String?,
    url: json['url'] as String?,
    relativeUrl: json['relativeUrl'] as String?,
    sortOrder: json['sortOrder'] as int?,
    cultureName: json['cultureName'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'group': group,
    'url': url,
    'relativeUrl': relativeUrl,
    'sortOrder': sortOrder,
    'cultureName': cultureName,
  };

  @override
  List<Object?> get props {
    return [id, name, group, url, relativeUrl, sortOrder, cultureName];
  }
}
