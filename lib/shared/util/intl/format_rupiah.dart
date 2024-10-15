import 'package:intl/intl.dart';

String formatRupiah(int amount) {
  final formatter = NumberFormat.currency(
    locale: 'id',
    symbol: "Rp",
    decimalDigits: 0, // Mengatur agar tidak ada angka desimal
  );
  return formatter.format(amount);
}

String getEstimatedDateRange(String etd) {
  // Define the date format for day and month
  final dateFormat = DateFormat('d');
  final monthFormat = DateFormat('MMM');

  // Remove the word "HARI" if it exists in the etd string
  etd = etd.replaceAll(RegExp(r'HARI', caseSensitive: false), '').trim();

  // Get the current date
  final now = DateTime.now();

  // Split the etd string to check if it contains a range
  final rangeParts = etd.split('-');

  int startDays;
  int endDays;

  // Check if the input has a range or just a single day
  if (rangeParts.length == 2) {
    // Parse the start and end days if a range exists
    startDays = int.parse(rangeParts[0].trim());
    endDays = int.parse(rangeParts[1].trim());
  } else if (rangeParts.length == 1) {
    // If there's only one day, set both startDays and endDays to the same value
    startDays = int.parse(rangeParts[0].trim());
    endDays = startDays;
  } else {
    throw ArgumentError('Invalid ETD format. Expected "X" or "X-Y".');
  }

  // Calculate the estimated dates
  final startDate = now.add(Duration(days: startDays));
  final endDate = now.add(Duration(days: endDays));

  // Format the dates into "d" format for the day
  final startDateString = dateFormat.format(startDate);
  final endDateString = dateFormat.format(endDate);

  // Format the month
  final monthString = monthFormat.format(endDate);

  // Check if it's a single day (no range)
  if (startDays == endDays) {
    return '$startDateString $monthString'; // Single day format
  }

  // Return the formatted date range
  return '$startDateString - $endDateString $monthString'; // Date range format
}

String removeHari(String etd) {
  // Replace all occurrences of "HARI" with an empty string and trim the result
  return etd.replaceAll(RegExp(r'HARI', caseSensitive: false), '').trim();
}
