class SignInTokenIssue {
  String token;
  String customerId;
  bool revoked;
  int created;
  int expires;

  SignInTokenIssue(
      {this.token, this.customerId, this.revoked, this.created, this.expires});

  SignInTokenIssue.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    customerId = json['customer_id'];
    revoked = json['revoked'];
    created = json['created'];
    expires = json['expires'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['customer_id'] = this.customerId;
    data['revoked'] = this.revoked;
    data['created'] = this.created;
    data['expires'] = this.expires;
    return data;
  }
}