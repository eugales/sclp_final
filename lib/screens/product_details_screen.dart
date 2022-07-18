import 'package:flutter/material.dart';
import 'package:sclp_final/constants/app_styles.dart';
import 'package:sclp_final/models/product.dart';
import 'package:sclp_final/screens/widgets/stars_rating_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/productDetails';
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                child: Image.network(product.image ?? ''),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title ?? '',
                          style: AppStyles.s14w500,
                          overflow: TextOverflow.clip,
                        ),
                        Text(product.category ?? '', style: AppStyles.s14w200),
                        const SizedBox(height: 8),
                        StarsRatingWidget(rating: product.rating, size: 16),
                      ],
                    ),
                  ),
                  Text(
                    "\$${product.price}",
                    style: AppStyles.s20w500,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(product.description ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
