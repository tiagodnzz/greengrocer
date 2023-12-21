import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/pages/product/product_screen.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class ItemTile extends StatelessWidget {
  final ItemModel item;

  ItemTile({
    super.key,
    required this.item,
  });

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        // conteudo
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (c){
              return ProductScreen(item: item);
            }));
          },
          child: Card(
            elevation: 1,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //img
                  Expanded(
                    child: Hero(
                      tag: item.imgUrl,
                      child: Image.asset(
                        item.imgUrl,
                      ),
                    ),
                  ),
        
                  //name
                  Text(
                    item.itemName,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
        
                  //price - uni
                  Row(
                    children: [
                      Text(
                        utilsServices.priceToCurrency(item.price),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customSwatchColor,
                        ),
                      ),
                      Text(
                        '/${item.unit}',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),

        // Botao add to cart
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: (){

            },
            child: Container(
              height: 40,
              width: 35,
              decoration: BoxDecoration(
                color: CustomColors.customSwatchColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(20)
                )
              ),
              child: const Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}
