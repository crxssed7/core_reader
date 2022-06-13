enum SourceType {
  comics,
  manga
}

// -----------------------------------------------------------------------------

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

// -----------------------------------------------------------------------------

class Item {
  List<ChapterResult>? chapters;
  String? cover;
  List<String>? genres;
  String? id;
  String? name;
  String? status;
  String? summary;

  Item(
      {this.chapters,
        this.cover,
        this.genres,
        this.id,
        this.name,
        this.status,
        this.summary});

  Item.fromJson(Map<String, dynamic> json) {
    if (json['chapters'] != null) {
      chapters = <ChapterResult>[];
      json['chapters'].forEach((v) {
        chapters?.add(ChapterResult.fromJson(v));
      });
    }
    cover = json['cover'];
    genres = json['genres'].cast<String>();
    id = json['id'].toString();
    name = json['name'];
    status = json['status'];
    summary = json['summary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chapters != null) {
      data['chapters'] = chapters?.map((v) => v.toJson()).toList();
    }
    data['cover'] = cover;
    data['genres'] = genres;
    data['id'] = id.toString();
    data['name'] = name;
    data['status'] = status;
    data['summary'] = summary;
    return data;
  }
}

// -----------------------------------------------------------------------------

class ChapterResult {
  String? detail;
  String? name;
  int? number;

  ChapterResult({this.detail, this.name, this.number});

  ChapterResult.fromJson(Map<String, dynamic> json) {
    detail = json['detail'];
    name = json['name'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['detail'] = detail;
    data['name'] = name;
    data['number'] = number;
    return data;
  }
}

// -----------------------------------------------------------------------------

class Chapter {
  List<String>? images;
  String? name;
  String? parent;

  Chapter({this.images, this.name, this.parent});

  Chapter.fromJson(Map<String, dynamic> json) {
    images = json['images'].cast<String>();
    name = json['name'];
    parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['images'] = images;
    data['name'] = name;
    data['parent'] = parent;
    return data;
  }
}