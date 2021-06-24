class RetrieveCartItem {
  String id;
  int created;
  int updated;
  int expires;
  int totalItems;
  int totalUniqueItems;
  Subtotal subtotal;
  String hostedCheckoutUrl;
  List<LineItems> lineItems;
  Currency currency;
  List<Null> discount;

  RetrieveCartItem(
      {this.id,
        this.created,
        this.updated,
        this.expires,
        this.totalItems,
        this.totalUniqueItems,
        this.subtotal,
        this.hostedCheckoutUrl,
        this.lineItems,
        this.currency,
        this.discount});

  RetrieveCartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json['created'];
    updated = json['updated'];
    expires = json['expires'];
    totalItems = json['total_items'];
    totalUniqueItems = json['total_unique_items'];
    subtotal = json['subtotal'] != null
        ? new Subtotal.fromJson(json['subtotal'])
        : null;
    hostedCheckoutUrl = json['hosted_checkout_url'];
    if (json['line_items'] != null) {
      lineItems = new List<LineItems>();
      json['line_items'].forEach((v) {
        lineItems.add(new LineItems.fromJson(v));
      });
    }
    currency = json['currency'] != null
        ? new Currency.fromJson(json['currency'])
        : null;
    /*if (json['discount'] != null) {
      discount = new List<Null>();
      json['discount'].forEach((v) {
        discount.add(new Null.fromJson(v));
      });
    }*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['expires'] = this.expires;
    data['total_items'] = this.totalItems;
    data['total_unique_items'] = this.totalUniqueItems;
    if (this.subtotal != null) {
      data['subtotal'] = this.subtotal.toJson();
    }
    data['hosted_checkout_url'] = this.hostedCheckoutUrl;
    if (this.lineItems != null) {
      data['line_items'] = this.lineItems.map((v) => v.toJson()).toList();
    }
    if (this.currency != null) {
      data['currency'] = this.currency.toJson();
    }/*
    if (this.discount != null) {
      data['discount'] = this.discount.map((v) => v.toJson()).toList();
    }*/
    return data;
  }
}

class Subtotal {
  int raw;
  String formatted;
  String formattedWithSymbol;
  String formattedWithCode;

  Subtotal(
      {this.raw,
        this.formatted,
        this.formattedWithSymbol,
        this.formattedWithCode});

  Subtotal.fromJson(Map<String, dynamic> json) {
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

class LineItems {
  String id;
  String productId;
  String name;
  String productName;
  Media media;
  Null sku;
  String permalink;
  int quantity;
  Subtotal price;
  Subtotal lineTotal;
  bool isValid;
  List<Null> productMeta;
  List<Null> selectedOptions;
  List<Null> variant;

  LineItems(
      {this.id,
        this.productId,
        this.name,
        this.productName,
        this.media,
        this.sku,
        this.permalink,
        this.quantity,
        this.price,
        this.lineTotal,
        this.isValid,
        this.productMeta,
        this.selectedOptions,
        this.variant});

  LineItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    name = json['name'];
    productName = json['product_name'];
    media = json['media'] != null ? new Media.fromJson(json['media']) : null;
    sku = json['sku'];
    permalink = json['permalink'];
    quantity = json['quantity'];
    price = json['price'] != null ? new Subtotal.fromJson(json['price']) : null;
    lineTotal = json['line_total'] != null
        ? new Subtotal.fromJson(json['line_total'])
        : null;
    isValid = json['is_valid'];
    /*if (json['product_meta'] != null) {
      productMeta = new List<Null>();
      json['product_meta'].forEach((v) {
        productMeta.add(new Null.fromJson(v));
      });
    }*/
    /*if (json['selected_options'] != null) {
      selectedOptions = new List<Null>();
      json['selected_options'].forEach((v) {
        selectedOptions.add(new Null.fromJson(v));
      });
    }*//*
    if (json['variant'] != null) {
      variant = new List<Null>();
      json['variant'].forEach((v) {
        variant.add(new Null.fromJson(v));
      });
    }*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['product_name'] = this.productName;
    if (this.media != null) {
      data['media'] = this.media.toJson();
    }
    data['sku'] = this.sku;
    data['permalink'] = this.permalink;
    data['quantity'] = this.quantity;
    if (this.price != null) {
      data['price'] = this.price.toJson();
    }
    if (this.lineTotal != null) {
      data['line_total'] = this.lineTotal.toJson();
    }
    data['is_valid'] = this.isValid;
   /* if (this.productMeta != null) {
      data['product_meta'] = this.productMeta.map((v) => v.toJson()).toList();
    }
    if (this.selectedOptions != null) {
      data['selected_options'] =
          this.selectedOptions.map((v) => v.toJson()).toList();
    }
    if (this.variant != null) {
      data['variant'] = this.variant.map((v) => v.toJson()).toList();
    }*/
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

class Currency {
  String code;
  String symbol;

  Currency({this.code, this.symbol});

  Currency.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['symbol'] = this.symbol;
    return data;
  }
}
