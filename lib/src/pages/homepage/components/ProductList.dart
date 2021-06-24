import 'package:flutter/material.dart';
import 'package:go_food/src/Services/APIClient.dart';
import 'package:go_food/src/models/ProductsModel.dart';
import 'package:go_food/src/pages/homepage/components/productListCard.dart';

class ProductList extends StatefulWidget {
  @override
  ProductListState createState() => ProductListState();
}

class ProductListState extends State<ProductList> {
  ProductModel productModel;

  _callProduct() async {
    try {
      productModel = (await APIManager().getProducts()) as ProductModel;
      //print("Nameeeeeeeeeeeeeeeeeeeeeeeeeeeeeee :::::::   ${_productModel.data[0].name}");

      setState(() {});
    } catch (e) {
      print("Errroooooooooorrr : $e");
    }
  }

  @override
  void initState() {
    _callProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*.75,
      width: 150.0,
      child: GridView.builder(
        //physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          //padding: const EdgeInsets.all(10),
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemCount: productModel == null ? 0 : productModel.data.length,
        itemBuilder: (BuildContext context, int index) {

          return ProductListCard(
            productID: productModel.data[index].id,
            productName: productModel.data[index].name,
            productPriceWithSymbol: productModel.data[index].price.formattedWithSymbol,
            productPriceWithCode: productModel.data[index].price.formattedWithCode,
            productCategory: productModel.data[index].categories.map((e) => e.name).toList().toString().replaceAll('[', '').replaceAll(']', ''),
            relatedProducts: productModel.data[index].relatedProducts,
            variantGroups: productModel.data[index].variantGroups,
            productImage: productModel.data[index].media.source,
            productDescription: productModel.data[index].description,
          );
        },
      ),
    );
  }
}
