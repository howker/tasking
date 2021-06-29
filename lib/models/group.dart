import 'dart:convert';

import 'package:http/http.dart' as http;

class Group {
  final int id;
  final String groupName;
  final bool isSystem;
  final int creator;
  final List<dynamic> groupMembers;

  const Group({
    required this.id,
    required this.groupName,
    required this.isSystem,
    required this.creator,
    required this.groupMembers,
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json['id'] as int,
        groupName: json['group_name'] as String,
        isSystem: json['is_system'] as bool,
        creator: json['creator'] as int,
        groupMembers: json['group_members'] as List,
      );

  factory Group.fromResponse(http.Response response) => Group.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>,
      );
}
