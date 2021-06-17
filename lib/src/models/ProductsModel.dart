class ProductModel {
  List<Data> data;
  Meta meta;

  ProductModel({this.data, this.meta});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    return data;
  }
}

class Data {
  String id;
  int created;
  int updated;
  bool active;
  String permalink;
  String name;
  String description;
  Price price;
  Inventory inventory;
  Media media;
  Null sku;
  int sortOrder;
  Seo seo;
  Null thankYouUrl;
  Null meta;
  Conditionals conditionals;
  Is ok;
  Has has;
  Collects collects;
  CheckoutUrl checkoutUrl;
  List<Null> extraFields;
  List<VariantGroups> variantGroups;
  List<Categories> categories;
  List<Assets> assets;
  List<RelatedProducts> relatedProducts;

  Data(
      {this.id,
      this.created,
      this.updated,
      this.active,
      this.permalink,
      this.name,
      this.description,
      this.price,
      this.inventory,
      this.media,
      this.sku,
      this.sortOrder,
      this.seo,
      this.thankYouUrl,
      this.meta,
      this.conditionals,
      this.ok,
      this.has,
      this.collects,
      this.checkoutUrl,
      this.extraFields,
      this.variantGroups,
      this.categories,
      this.assets,
      this.relatedProducts});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json['created'];
    updated = json['updated'];
    active = json['active'];
    permalink = json['permalink'];
    name = json['name'];
    description = json['description'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    inventory = json['inventory'] != null
        ? new Inventory.fromJson(json['inventory'])
        : null;
    media = json['media'] != null ? new Media.fromJson(json['media']) : null;
    sku = json['sku'];
    sortOrder = json['sort_order'];
    seo = json['seo'] != null ? new Seo.fromJson(json['seo']) : null;
    thankYouUrl = json['thank_you_url'];
    meta = json['meta'];
    conditionals = json['conditionals'] != null
        ? new Conditionals.fromJson(json['conditionals'])
        : null;
    ok = json['is'] != null ? new Is.fromJson(json['is']) : null;
    has = json['has'] != null ? new Has.fromJson(json['has']) : null;
    collects = json['collects'] != null
        ? new Collects.fromJson(json['collects'])
        : null;
    checkoutUrl = json['checkout_url'] != null
        ? new CheckoutUrl.fromJson(json['checkout_url'])
        : null;

    if (json['variant_groups'] != null) {
      variantGroups = new List<VariantGroups>();
      json['variant_groups'].forEach((v) {
        variantGroups.add(new VariantGroups.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
    if (json['assets'] != null) {
      assets = new List<Assets>();
      json['assets'].forEach((v) {
        assets.add(new Assets.fromJson(v));
      });
    }
    if (json['related_products'] != null) {
      relatedProducts = new List<RelatedProducts>();
      json['related_products'].forEach((v) {
        relatedProducts.add(new RelatedProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['active'] = this.active;
    data['permalink'] = this.permalink;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.price != null) {
      data['price'] = this.price.toJson();
    }
    if (this.inventory != null) {
      data['inventory'] = this.inventory.toJson();
    }
    if (this.media != null) {
      data['media'] = this.media.toJson();
    }
    data['sku'] = this.sku;
    data['sort_order'] = this.sortOrder;
    if (this.seo != null) {
      data['seo'] = this.seo.toJson();
    }
    data['thank_you_url'] = this.thankYouUrl;
    data['meta'] = this.meta;
    if (this.conditionals != null) {
      data['conditionals'] = this.conditionals.toJson();
    }
    if (this.ok != null) {
      data['is'] = this.ok.toJson();
    }
    if (this.has != null) {
      data['has'] = this.has.toJson();
    }
    if (this.collects != null) {
      data['collects'] = this.collects.toJson();
    }
    if (this.checkoutUrl != null) {
      data['checkout_url'] = this.checkoutUrl.toJson();
    }
    if (this.variantGroups != null) {
      data['variant_groups'] =
          this.variantGroups.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    if (this.assets != null) {
      data['assets'] = this.assets.map((v) => v.toJson()).toList();
    }
    if (this.relatedProducts != null) {
      data['related_products'] =
          this.relatedProducts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Price {
  int raw;
  String formatted;
  String formattedWithSymbol;
  String formattedWithCode;

  Price(
      {this.raw,
      this.formatted,
      this.formattedWithSymbol,
      this.formattedWithCode});

  Price.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    formatted = json['formatted'];
    formattedWithSymbol = json['formatted_with_symbol'];
    formattedWithCode = json['formatted_with_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw'] = this.raw;
    data['formatted'] = this.formatted;
    data['formatted_with_symbol'] = this.formattedWithSymbol;
    data['formatted_with_code'] = this.formattedWithCode;
    return data;
  }
}

class Inventory {
  bool managed;
  int available;

  Inventory({this.managed, this.available});

  Inventory.fromJson(Map<String, dynamic> json) {
    managed = json['managed'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['managed'] = this.managed;
    data['available'] = this.available;
    return data;
  }
}

class Media {
  String type;
  String source;

  Media({this.type, this.source});

  Media.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['source'] = this.source;
    return data;
  }
}

class Seo {
  Null title;
  Null description;

  Seo({this.title, this.description});

  Seo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}

class Conditionals {
  bool isActive;
  bool isTaxExempt;
  bool isPayWhatYouWant;
  bool isInventoryManaged;
  bool isSoldOut;
  bool hasDigitalDelivery;
  bool hasPhysicalDelivery;
  bool hasImages;
  bool hasVideo;
  bool hasRichEmbed;
  bool collectsFullname;
  bool collectsShippingAddress;
  bool collectsBillingAddress;
  bool collectsExtraFields;
  bool isFree;

  Conditionals(
      {this.isActive,
      this.isTaxExempt,
      this.isPayWhatYouWant,
      this.isInventoryManaged,
      this.isSoldOut,
      this.hasDigitalDelivery,
      this.hasPhysicalDelivery,
      this.hasImages,
      this.hasVideo,
      this.hasRichEmbed,
      this.collectsFullname,
      this.collectsShippingAddress,
      this.collectsBillingAddress,
      this.collectsExtraFields,
      this.isFree});

  Conditionals.fromJson(Map<String, dynamic> json) {
    isActive = json['is_active'];
    isTaxExempt = json['is_tax_exempt'];
    isPayWhatYouWant = json['is_pay_what_you_want'];
    isInventoryManaged = json['is_inventory_managed'];
    isSoldOut = json['is_sold_out'];
    hasDigitalDelivery = json['has_digital_delivery'];
    hasPhysicalDelivery = json['has_physical_delivery'];
    hasImages = json['has_images'];
    hasVideo = json['has_video'];
    hasRichEmbed = json['has_rich_embed'];
    collectsFullname = json['collects_fullname'];
    collectsShippingAddress = json['collects_shipping_address'];
    collectsBillingAddress = json['collects_billing_address'];
    collectsExtraFields = json['collects_extra_fields'];
    isFree = json['is_free'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_active'] = this.isActive;
    data['is_tax_exempt'] = this.isTaxExempt;
    data['is_pay_what_you_want'] = this.isPayWhatYouWant;
    data['is_inventory_managed'] = this.isInventoryManaged;
    data['is_sold_out'] = this.isSoldOut;
    data['has_digital_delivery'] = this.hasDigitalDelivery;
    data['has_physical_delivery'] = this.hasPhysicalDelivery;
    data['has_images'] = this.hasImages;
    data['has_video'] = this.hasVideo;
    data['has_rich_embed'] = this.hasRichEmbed;
    data['collects_fullname'] = this.collectsFullname;
    data['collects_shipping_address'] = this.collectsShippingAddress;
    data['collects_billing_address'] = this.collectsBillingAddress;
    data['collects_extra_fields'] = this.collectsExtraFields;
    data['is_free'] = this.isFree;
    return data;
  }
}

class Is {
  bool active;
  bool taxExempt;
  bool payWhatYouWant;
  bool inventoryManaged;
  bool soldOut;
  bool free;

  Is(
      {this.active,
      this.taxExempt,
      this.payWhatYouWant,
      this.inventoryManaged,
      this.soldOut,
      this.free});

  Is.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    taxExempt = json['tax_exempt'];
    payWhatYouWant = json['pay_what_you_want'];
    inventoryManaged = json['inventory_managed'];
    soldOut = json['sold_out'];
    free = json['free'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['tax_exempt'] = this.taxExempt;
    data['pay_what_you_want'] = this.payWhatYouWant;
    data['inventory_managed'] = this.inventoryManaged;
    data['sold_out'] = this.soldOut;
    data['free'] = this.free;
    return data;
  }
}

class Has {
  bool digitalDelivery;
  bool physicalDelivery;
  bool images;
  bool video;
  bool richEmbed;

  Has(
      {this.digitalDelivery,
      this.physicalDelivery,
      this.images,
      this.video,
      this.richEmbed});

  Has.fromJson(Map<String, dynamic> json) {
    digitalDelivery = json['digital_delivery'];
    physicalDelivery = json['physical_delivery'];
    images = json['images'];
    video = json['video'];
    richEmbed = json['rich_embed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['digital_delivery'] = this.digitalDelivery;
    data['physical_delivery'] = this.physicalDelivery;
    data['images'] = this.images;
    data['video'] = this.video;
    data['rich_embed'] = this.richEmbed;
    return data;
  }
}

class Collects {
  bool fullname;
  bool shippingAddress;
  bool billingAddress;
  bool extraFields;

  Collects(
      {this.fullname,
      this.shippingAddress,
      this.billingAddress,
      this.extraFields});

  Collects.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    shippingAddress = json['shipping_address'];
    billingAddress = json['billing_address'];
    extraFields = json['extra_fields'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['shipping_address'] = this.shippingAddress;
    data['billing_address'] = this.billingAddress;
    data['extra_fields'] = this.extraFields;
    return data;
  }
}

class CheckoutUrl {
  String checkout;
  String display;

  CheckoutUrl({this.checkout, this.display});

  CheckoutUrl.fromJson(Map<String, dynamic> json) {
    checkout = json['checkout'];
    display = json['display'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['checkout'] = this.checkout;
    data['display'] = this.display;
    return data;
  }
}

class VariantGroups {
  String id;
  String name;
  Null meta;
  int created;
  int updated;
  List<Options> options;

  VariantGroups(
      {this.id,
      this.name,
      this.meta,
      this.created,
      this.updated,
      this.options});

  VariantGroups.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    meta = json['meta'];
    created = json['created'];
    updated = json['updated'];
    if (json['options'] != null) {
      options = new List<Options>();
      json['options'].forEach((v) {
        options.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['meta'] = this.meta;
    data['created'] = this.created;
    data['updated'] = this.updated;
    if (this.options != null) {
      data['options'] = this.options.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Options {
  String id;
  String name;
  Price price;
  List<String> assets;
  Null meta;
  int created;
  int updated;

  Options(
      {this.id,
      this.name,
      this.price,
      this.assets,
      this.meta,
      this.created,
      this.updated});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    assets = json['assets'].cast<String>();
    meta = json['meta'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.price != null) {
      data['price'] = this.price.toJson();
    }
    data['assets'] = this.assets;
    data['meta'] = this.meta;
    data['created'] = this.created;
    data['updated'] = this.updated;
    return data;
  }
}

class Categories {
  String id;
  String slug;
  String name;

  Categories({this.id, this.slug, this.name});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['name'] = this.name;
    return data;
  }
}

class Assets {
  String id;
  String url;
  Null description;
  bool isImage;
  String filename;
  int fileSize;
  String fileExtension;
  ImageDimensions imageDimensions;
  List<Null> meta;
  int createdAt;
  int updatedAt;

  Assets(
      {this.id,
      this.url,
      this.description,
      this.isImage,
      this.filename,
      this.fileSize,
      this.fileExtension,
      this.imageDimensions,
      this.meta,
      this.createdAt,
      this.updatedAt});

  Assets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    description = json['description'];
    isImage = json['is_image'];
    filename = json['filename'];
    fileSize = json['file_size'];
    fileExtension = json['file_extension'];
    imageDimensions = json['image_dimensions'] != null
        ? new ImageDimensions.fromJson(json['image_dimensions'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['description'] = this.description;
    data['is_image'] = this.isImage;
    data['filename'] = this.filename;
    data['file_size'] = this.fileSize;
    data['file_extension'] = this.fileExtension;
    if (this.imageDimensions != null) {
      data['image_dimensions'] = this.imageDimensions.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ImageDimensions {
  int width;
  int height;

  ImageDimensions({this.width, this.height});

  ImageDimensions.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}

class RelatedProducts {
  String id;
  String name;
  Null sku;
  String permalink;
  String description;
  Price price;
  int quantity;
  Media media;

  RelatedProducts(
      {this.id,
      this.name,
      this.sku,
      this.permalink,
      this.description,
      this.price,
      this.quantity,
      this.media});

  RelatedProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sku = json['sku'];
    permalink = json['permalink'];
    description = json['description'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    quantity = json['quantity'];
    media = json['media'] != null ? new Media.fromJson(json['media']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sku'] = this.sku;
    data['permalink'] = this.permalink;
    data['description'] = this.description;
    if (this.price != null) {
      data['price'] = this.price.toJson();
    }
    data['quantity'] = this.quantity;
    if (this.media != null) {
      data['media'] = this.media.toJson();
    }
    return data;
  }
}

class Meta {
  Pagination pagination;

  Meta({this.pagination});

  Meta.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pagination != null) {
      data['pagination'] = this.pagination.toJson();
    }
    return data;
  }
}

class Pagination {
  int total;
  int count;
  int perPage;
  int currentPage;
  int totalPages;
  Links links;

  Pagination(
      {this.total,
      this.count,
      this.perPage,
      this.currentPage,
      this.totalPages,
      this.links});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['count'] = this.count;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['total_pages'] = this.totalPages;
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    return data;
  }
}

class Links {
  Links.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
