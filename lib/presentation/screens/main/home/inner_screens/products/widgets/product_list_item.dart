import 'package:auto_route_demo_flow/arch/widget/common/misk.dart';
import 'package:auto_route_demo_flow/domain/entities/product_entity.dart';
import 'package:auto_route_demo_flow/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    Key? key,
    required this.entity,
    this.showRemoveBtn = true,
    required this.onDeleteSelected,
    required this.onSelected,
    required this.onSetFavourite,
  }) : super(key: key);

  final ProductEntity entity;
  final bool showRemoveBtn;
  final Function(ProductEntity) onDeleteSelected;
  final Function(ProductEntity) onSelected;
  final Function(ProductEntity) onSetFavourite;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: UiUtil.screenWidth(context),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(entity.description),
          ),
          const Delimiter.width(30),
          ClickableWidget(
            onTap: () {
              onSelected(entity);
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.info_outline),
            ),
          ),
          const Delimiter.width(8),
          showRemoveBtn
              ? ClickableWidget(
                  onTap: () {
                    onDeleteSelected(entity);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.delete),
                  ),
                )
              : const SizedBox(),
          const Delimiter.width(8),
          ClickableWidget(
            onTap: () {
              entity.isFavorite = !entity.isFavorite;
              onSetFavourite(entity);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: entity.isFavorite
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_outline),
            ),
          ),
        ],
      ),
    );
  }
}
