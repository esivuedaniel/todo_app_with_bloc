import 'package:intl/intl.dart';

String dateString({required DateTime dateTime}){
  return DateFormat('dd-MM-yyyy').format(dateTime);
}