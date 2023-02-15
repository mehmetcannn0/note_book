import 'dart:convert';

String searchRequestModelToJson(SearchRequestModel data) =>
    json.encode(data.toJson());

class SearchRequestModel {
  final String title;
  final String userId;

  SearchRequestModel({required this.title, required this.userId});

  Map<String, dynamic> toJson() => {"title": title, "userId": userId};
}
