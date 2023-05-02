class CategoryResponse {
  int? code;
  List<Categories>? categories;
  Settings? settings;

  CategoryResponse({this.code, this.categories, this.settings});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    settings = json['settings'] != null
        ? Settings.fromJson(json['settings'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = code;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (settings != null) {
      data['settings'] = settings!.toJson();
    }
    return data;
  }
}

class Categories {
  int? id;
  int? parentId;
  String? slug;
  String? image;
  String? bannerImage;
  int? star;
  int? sortOrder;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  List<CategoryTranslations>? categoryTranslations;

  Categories(
      {this.id,
        this.parentId,
        this.slug,
        this.image,
        this.bannerImage,
        this.star,
        this.sortOrder,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.categoryTranslations});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    slug = json['slug'];
    image = json['image'];
    bannerImage = json['banner_image'];
    star = json['star'];
    sortOrder = json['sort_order'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['category_translations'] != null) {
      categoryTranslations = <CategoryTranslations>[];
      json['category_translations'].forEach((v) {
        categoryTranslations!.add(CategoryTranslations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['parent_id'] = parentId;
    data['slug'] = slug;
    data['image'] = image;
    data['banner_image'] = bannerImage;
    data['star'] = star;
    data['sort_order'] = sortOrder;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (categoryTranslations != null) {
      data['category_translations'] =
          categoryTranslations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryTranslations {
  int? id;
  int? categoryId;
  String? locale;
  String? name;
  String? description;
  String? metaTitle;
  String? metaKeywords;
  String? metaDescription;

  CategoryTranslations(
      {this.id,
        this.categoryId,
        this.locale,
        this.name,
        this.description,
        this.metaTitle,
        this.metaKeywords,
        this.metaDescription});

  CategoryTranslations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    locale = json['locale'];
    name = json['name'];
    description = json['description'];
    metaTitle = json['meta_title'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['category_id'] = categoryId;
    data['locale'] = locale;
    data['name'] = name;
    data['description'] = description;
    data['meta_title'] = metaTitle;
    data['meta_keywords'] = metaKeywords;
    data['meta_description'] = metaDescription;
    return data;
  }
}

class Settings {
  String? siteName;
  String? siteEmail;
  String? sitePhone;
  String? address;
  String? countryId;
  String? stateId;
  String? cityId;
  String? zipcode;
  String? favicon;
  String? logo;
  String? authLogo;
  String? siteTagLine;
  String? metaTitle;
  String? metaDescription;
  City? city;

  Settings(
      {this.siteName,
        this.siteEmail,
        this.sitePhone,
        this.address,
        this.countryId,
        this.stateId,
        this.cityId,
        this.zipcode,
        this.favicon,
        this.logo,
        this.authLogo,
        this.siteTagLine,
        this.metaTitle,
        this.metaDescription,
        this.city});

  Settings.fromJson(Map<String, dynamic> json) {
    siteName = json['site_name'];
    siteEmail = json['site_email'];
    sitePhone = json['site_phone'];
    address = json['address'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    zipcode = json['zipcode'];
    favicon = json['favicon'];
    logo = json['logo'];
    authLogo = json['auth_logo'];
    siteTagLine = json['site_tag_line'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['site_name'] = siteName;
    data['site_email'] = siteEmail;
    data['site_phone'] = sitePhone;
    data['address'] = address;
    data['country_id'] = countryId;
    data['state_id'] = stateId;
    data['city_id'] = cityId;
    data['zipcode'] = zipcode;
    data['favicon'] = favicon;
    data['logo'] = logo;
    data['auth_logo'] = authLogo;
    data['site_tag_line'] = siteTagLine;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    if (city != null) {
      data['city'] = city!.toJson();
    }
    return data;
  }
}

class City {
  int? id;
  String? name;
  int? stateId;
  dynamic sortOrder;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  State? state;

  City(
      {this.id,
        this.name,
        this.stateId,
        this.sortOrder,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.state});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stateId = json['state_id'];
    sortOrder = json['sort_order'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    state = json['state'] != null ? State.fromJson(json['state']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['state_id'] = stateId;
    data['sort_order'] = sortOrder;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (state != null) {
      data['state'] = state!.toJson();
    }
    return data;
  }
}

class State {
  int? id;
  String? name;
  int? countryId;
  dynamic sortOrder;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  Country? country;

  State(
      {this.id,
        this.name,
        this.countryId,
        this.sortOrder,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.country});

  State.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    sortOrder = json['sort_order'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    country =
    json['country'] != null ? Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['country_id'] = countryId;
    data['sort_order'] = sortOrder;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    return data;
  }
}

class Country {
  int? id;
  String? name;
  String? phonecode;
  String? code;
  String? flag;
  int? sortOrder;
  dynamic status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Country(
      {this.id,
        this.name,
        this.phonecode,
        this.code,
        this.flag,
        this.sortOrder,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phonecode = json['phonecode'];
    code = json['code'];
    flag = json['flag'];
    sortOrder = json['sort_order'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['phonecode'] = phonecode;
    data['code'] = code;
    data['flag'] = flag;
    data['sort_order'] = sortOrder;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
