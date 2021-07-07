class CreateCustomer {
  String id;
  Null externalId;
  String firstname;
  String lastname;
  String email;
  String phone;
  Null meta;
  int created;
  int updated;

  CreateCustomer(
      {this.id,
        this.externalId,
        this.firstname,
        this.lastname,
        this.email,
        this.phone,
        this.meta,
        this.created,
        this.updated});

  CreateCustomer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    externalId = json['external_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    phone = json['phone'];
    meta = json['meta'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['external_id'] = this.externalId;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['meta'] = this.meta;
    data['created'] = this.created;
    data['updated'] = this.updated;
    return data;
  }
}