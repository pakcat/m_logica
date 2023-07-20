import 'package:intl/intl.dart';

class AppUtils {
  static String getFormattedTimer(int value) {
    if (value < 10) {
      return '0:0$value';
    }
    return '0:$value';
  }

  static String getFormattedDate(DateTime? dateTime) {
    if (dateTime == null) {
      return '-';
    }
    return DateFormat("EEEE, dd MMMM yyyy", 'id_ID').format(dateTime);
  }

  static String getFormattedTime(DateTime? dateTime) {
    if (dateTime == null) {
      return '-';
    }
    return DateFormat('hh:mm:ss a').format(dateTime);
  }

  static String getFormattedDateTime(DateTime? dateTime) {
    if (dateTime == null) {
      return '-';
    }
    return DateFormat("EEEE, dd MMMM yyyy, HH:mm", 'id_ID').format(dateTime);
  }

  static getFormattedDateTimeUTC(DateTime dateTime) {
    return dateTime.toIso8601String();
  }

  static bool isSameDay(DateTime? date1, DateTime? date2) {
    bool isSameDay = date1?.year == date2?.year &&
        date1?.month == date2?.month &&
        date1?.day == date2?.day;
    return isSameDay;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long.';
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    } else if (!value.contains(RegExp(r'[a-z]'))) {
      return ' Password must contain at least one lowercase letter';
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return ' Password must contain at least one number';
    } else {
      return null;
    }
  }
}

class DateUtil {
  static String getDateFormat(DateTime? date) {
    if (date == null) {
      return '';
    }
    final f = DateFormat('dd/MM/yyyy');
    return f.format(date);
  }

  static String getDateTimeFormat(DateTime date) {
    final f = DateFormat('HH:mm | dd MMMM yyyy');
    return f.format(date);
  }

  static String getDateByFormat(DateTime date, String format) {
    final f = DateFormat(format);
    return f.format(date);
  }
}
