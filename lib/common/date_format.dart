import 'package:intl/intl.dart';

String? formatDate(DateTime? dateTime) {
  DateFormat dateFormat = DateFormat('dd/MM, H:mm');
  return dateTime != null ? dateFormat.format(dateTime) : "";
}
