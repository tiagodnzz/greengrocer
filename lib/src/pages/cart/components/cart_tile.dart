import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/pages/common/quantity_widget.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cardItem;
  final Function(CartItemModel) remove;

  const CartTile({
    super.key,
    required this.cardItem,
    required this.remove,
  });

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        //img
        leading: Image.asset(
          widget.cardItem.item.imgUrl,
          height: 60,
          width: 60,
        ),

        //titulo
        title: Text(
          widget.cardItem.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),

        //total
        subtitle: Text(
          utilsServices.priceToCurrency(widget.cardItem.totalPrice()),
          style: TextStyle(
            color: CustomColors.customSwatchColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        //quantity
        trailing: QuantityWidget(
          value: widget.cardItem.quantity,
          suffixText: widget.cardItem.item.unit,
          result: (quantity) {
            setState(() {
              widget.cardItem.quantity = quantity;

              //remove items
              if (quantity == 0) {
                widget.remove(widget.cardItem);
              }
            });
          },
          isRemovable: true,
        ),
      ),
    );
  }
}
