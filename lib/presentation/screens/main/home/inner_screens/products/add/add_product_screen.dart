import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:auto_route_demo_flow/domain/entities/product_entity.dart';
import 'package:auto_route_demo_flow/internal/router/app_router.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/home/bloc/home_bloc.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/home/bloc/home_event.dart';
import 'package:auto_route_demo_flow/presentation/screens/main/home/bloc/home_screen_state.dart';
import 'package:auto_route_demo_flow/presentation/widgets/common/toast.dart';
import 'package:auto_route_demo_flow/presentation/widgets/misk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  HomeBloc homeBlocOf(BuildContext context) =>
      BlocProvider.of<HomeBloc>(context);
  final Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeScreenState>(builder: (
      context,
      HomeScreenState homeState,
    ) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Add product Screen'),
            const Delimiter.height(16),
            DefaultButton(
              title: 'nav to congratulations screen',
              onTap: () {
                context.replaceRoute(const CongratulationsRoute());
              },
            ),
            const Delimiter.height(16),
            DefaultButton(
              title: 'nav back',
              onTap: () {
                context.navigateBack();
              },
            ),
            DefaultButton(
              title: 'Add new item',
              onTap: () {
                final entity = ProductEntity(
                  id: _random.nextInt(100),
                  price: _random.nextInt(1000),
                  description:
                      '${_random.nextInt(10)}_description_${_random.nextInt(10000)}',
                );
                CustomToast.showToast('Item ${entity.id} added');
                homeBlocOf(context).add(AddItemEvent(entity));
                context.replaceRoute(const CongratulationsRoute());
              },
            ),
          ],
        ),
      );
    });
  }
}
