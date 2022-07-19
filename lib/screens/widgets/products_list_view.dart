import 'package:flutter/material.dart';
import 'package:sclp_final/constants/app_styles.dart';
import 'package:sclp_final/models/product.dart';
import 'package:sclp_final/screens/product_details_screen.dart';
import 'package:sclp_final/screens/widgets/stars_rating_widget.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({Key? key, required this.products}) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          final product = products[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                ProductDetailsScreen.routeName,
                arguments: product,
              );
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    blurStyle: BlurStyle.outer,
                  )
                ],
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    width: 90,
                    height: 90,
                    child: ClipRRect(
                      child: Image.network(product.image!),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                            StarsRatingWidget(
                              rating: product.rating,
                              size: 16,
                              isTextVisible: false,
                            ),
                            Text(
                              "\$${product.price}",
                              style: AppStyles.s16w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
        itemCount: products.length);
  }
}
