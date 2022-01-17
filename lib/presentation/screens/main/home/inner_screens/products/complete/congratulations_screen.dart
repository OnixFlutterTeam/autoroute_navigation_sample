import 'package:auto_route/auto_route.dart';
import 'package:auto_route_demo_flow/arch/widget/common/misk.dart';
import 'package:auto_route_demo_flow/internal/router/app_router.dart';
import 'package:auto_route_demo_flow/presentation/widgets/misk.dart';
import 'package:flutter/material.dart';

class CongratulationsScreen extends StatefulWidget {
  const CongratulationsScreen({Key? key}) : super(key: key);

  @override
  _CongratulationsScreenState createState() => _CongratulationsScreenState();
}

class _CongratulationsScreenState extends State<CongratulationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Congratulation Screen'),
          const Delimiter.height(16),
          DefaultButton(
            title: 'Navigate to products list screen',
            onTap: () {
              // context.navigateBack();
              context.navigateTo(const ProductsRouter());
            },
          ),
          const Delimiter.height(16),
          DefaultButton(
            title: 'Navigate add new item screen',
            onTap: () {
              context.replaceRoute(const AddProductRoute());
            },
          ),
        ],
      ),
    );
  }
}
