import 'package:intl/intl.dart';

class UtilsServices {

  //convert price
  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
    
    return numberFormat.format(price);
  }

}