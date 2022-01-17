import 'package:auto_route/auto_route.dart';
import 'package:auto_route_demo_flow/arch/widget/common/misk.dart';
import 'package:auto_route_demo_flow/dependency/service_locator.dart';
import 'package:auto_route_demo_flow/internal/router/app_router.dart';
import 'package:auto_route_demo_flow/presentation/widgets/misk.dart';
import 'package:auto_route_demo_flow/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    Key? key,
    @PathParam('productId') required this.productId,
    @PathParam('showRemoveBtn') this.showRemoveBtn = true,
  }) : super(key: key);

  final int productId;
  final bool showRemoveBtn;

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final entity = productSource().findProductById(widget.productId);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Product item Screen'),
            const Delimiter.height(16),
            DefaultButton(
              title: 'Navigate to favourite screen',
              onTap: () {
                context.navigateTo(const HomeRoute(
                  children: [FavouritesRoute()],
                ));
              },
            ),
            const Delimiter.height(16),
            DefaultButton(
              title: 'Navigate to products list screen',
              onTap: () {
                context.navigateTo(const HomeRoute(
                  children: [ProductsRouter()],
                ));
              },
            ),
            Container(
              width: UiUtil.screenWidth(context),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(entity.description),
                  ),
                  const Delimiter.width(38),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: entity.isFavorite
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_outline),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
