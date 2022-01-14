import 'package:auto_route/auto_route.dart';
import 'package:auto_route_demo_flow/arch/widget/base/base_block_state.dart';
import 'package:auto_route_demo_flow/internal/router/app_router.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/home/bloc/home_bloc.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/home/bloc/home_event.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/home/bloc/home_screen_state.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/home/inner_screens/products/widgets/product_list_item.dart';
import 'package:auto_route_demo_flow/presentation/widgets/misk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/fav_bloc.dart';
import 'bloc/fav_screen_state.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState
    extends BaseState<FavouriteScreenState, FavouriteBloc, FavouritesScreen> {
  HomeBloc homeBlocOf(BuildContext context) =>
      BlocProvider.of<HomeBloc>(context);

  @override
  Widget buildWidget(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeScreenState>(builder: (
      context,
      HomeScreenState homeState,
    ) {
      return stateObserver(
        context,
        (FavouriteScreenState favState) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('Favourites Screen'),
              // const Delimiter.height(16),
              DefaultButton(
                title: 'nav to products list',
                onTap: () {
                  context.navigateTo(const ProductsRouter());
                },
              ),
              _buildList(context, homeState),
            ],
          );
        },
        listenDelegate: (context, state) async {},
      );
    });
  }

  Widget _buildList(BuildContext context, HomeScreenState homeState) {
    return Expanded(
      child: ListView.separated(
        itemCount: homeState.favProductList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final item = homeState.favProductList[index];
          return ProductListItem(
            entity: item,
            showRemoveBtn: false,
            onDeleteSelected: (entity) {},
            onSelected: (entity) {
              context.navigateTo(ProductItemRouter(
                productId: entity.id,
                showRemoveBtn: false,
              ));
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
