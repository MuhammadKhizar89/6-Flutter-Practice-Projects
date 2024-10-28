import 'package:intl/intl.dart';

final dateFormatter = DateFormat.yMd();
String formattedDate(DateTime date) => dateFormatter.format(date);
