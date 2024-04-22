class orghistory {
  int? count;
  dynamic next;
  dynamic previous;
  List<Results>? results;

  orghistory({this.count, this.next, this.previous, this.results});

  factory orghistory.fromJson(Map<String, dynamic> json) {
    return orghistory(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((v) => Results.fromJson(v as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? organizationName;
  String? visitingFrom;
  String? visitedAt;

  Results({this.organizationName, this.visitingFrom, this.visitedAt});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      organizationName: json['organization_name'] ?? '',
      visitingFrom: json['visiting_from'] ?? '',
      visitedAt: json['visited_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['organization_name'] = organizationName;
    data['visiting_from'] = visitingFrom;
    data['visited_at'] = visitedAt;
    return data;
  }
}