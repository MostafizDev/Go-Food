class Url {
  static var cartId = "cart_NwAA9GZ1WkgLgw";
  static var categoryAPIURL = "https://api.chec.io/v1/categories";
  static var productsAPIURL = "https://api.chec.io/v1/products?limit=25";
  static var retrieveCartAPIURL = "https://api.chec.io/v1/carts/$cartId";
  static var addToCartAPIURL = "https://api.chec.io/v1/carts/$cartId";
  static var updateCartItemAPIURL =
      "https://api.chec.io/v1/carts/$cartId/items/"; // Need to concat itemId
  static var deleteCartItemAPIURL =
      "https://api.chec.io/v1/carts/$cartId/items/"; // Need to concat itemId
  static var customerAPIURL = "https://api.chec.io/v1/customers/";
  static var customerTokenGenerateAPIURL =
      "https://api.chec.io/v1/customers/email-token";
  static var customerTokenIssueAPIURL =
      "https://api.chec.io/v1/customers/issue-token";
}
