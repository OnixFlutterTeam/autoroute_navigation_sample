import 'package:auto_route/auto_route.dart';
import 'package:auto_route_demo_flow/arch/logger.dart';
import 'package:auto_route_demo_flow/arch/widget/common/misk.dart';
import 'package:auto_route_demo_flow/internal/router/app_router.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/home/bloc/home_bloc.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/home/bloc/home_event.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/home/bloc/home_screen_state.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/home/inner_screens/products/widgets/product_list_item.dart';
import 'package:auto_route_demo_flow/presentation/widgets/misk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  HomeBloc homeBlocOf(BuildContext context) =>
      BlocProvider.of<HomeBloc>(context);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeScreenState>(builder: (
      context,
      HomeScreenState homeState,
    ) {
      Logger.log('homeState: $homeState');
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Delimiter.height(16),
          const Text('Products list Screen'),
          const Delimiter.height(16),
          DefaultButton(
            title: 'Add item',
            onTap: () {
              context.navigateTo(const AddProductRoute());
            },
          ),
          const Delimiter.height(16),
          _buildList(context, homeState),
        ],
      );
    });
  }

  Widget _buildList(BuildContext context, HomeScreenState homeState) {
    return Expanded(
      child: ListView.separated(
        itemCount: homeState.productList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final item = homeState.productList[index];
          return ProductListItem(
            entity: item,
            onDeleteSelected: (entity) {
              homeBlocOf(context).add(RemoveItemEvent(entity));
            },
            onSelected: (entity) {
              context.navigateTo(ProductItemRouter(productId: entity.id));
            },
            onSetFavourite: (entity) {
              homeBlocOf(context).add(!entity.isFavorite
                  ? RemoveFavouriteEvent(entity)
                  : AddFavouriteEvent(entity));
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFE0E0E0),
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
