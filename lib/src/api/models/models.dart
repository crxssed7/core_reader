class Source {
  String? endpoint;
  String? logo;
  String? name;
  String? searchEndpoint;
  String? type;
  String? url;

  Source(
      {this.endpoint,
        this.logo,
        this.name,
        this.searchEndpoint,
        this.type,
        this.url});

  Source.fromJson(Map<String, dynamic> json) {
    endpoint = json['endpoint'];
    logo = json['logo'];
    name = json['name'];
    searchEndpoint = json['search_endpoint'];
    type = json['type'];
    url = json['url'];
  }

  static List<Source> fromJsonList(List<dynamic> json) {
    var sources = <Source>[];
    for (var j in json) {
      var s = Source.fromJson(j);
      sources.add(s);
    }
    return sources;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['endpoint'] = endpoint;
    data['logo'] = logo;
    data['name'] = name;
    data['search_endpoint'] = searchEndpoint;
    data['type'] = type;
    data['url'] = url;
    return data;
  }
}

// -----------------------------------------------------------------------------

class Result {
  String? cover;
  String? detail;
  String? id;
  String? name;

  Result({this.cover, this.detail, this.id, this.name});

  Result.fromJson(Map<String, dynamic> json) {
    cover = json['cover'];
    detail = json['detail'];
    id = json['id'];
    name = json['name'];
  }

  static List<Result> fromJsonList(List<dynamic> json) {
    var results = <Result>[];
    for (var j in json) {
      var r = Result.fromJson(j);
      results.add(r);
    }
    return results;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cover'] = cover;
    data['detail'] = detail;
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

// -----------------------------------------------------------------------------

class Information {
  List<Result>? items;
  String? logo;
  String? name;
  String? type;
  String? url;

  Information({this.items, this.logo, this.name, this.type, this.url});

  Information.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Result>[];
      json['items'].forEach((v) {
        items?.add(Result.fromJson(v));
      });
    }
    logo = json['logo'];
    name = json['name'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items?.map((v) => v.toJson()).toList();
    }
    data['logo'] = logo;
    data['name'] = name;
    data['type'] = type;
    data['url'] = url;
    return data;
  }
}