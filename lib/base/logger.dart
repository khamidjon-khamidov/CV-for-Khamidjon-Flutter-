import 'package:logger/logger.dart';

import '../config.dart';

final Logger logger = Logger(
  filter: AppLogFilter(),
  printer: PrettyPrinter(
    errorMethodCount: 5,
    lineLength: 40,
  ),
);

final Logger blocLogger = Logger(
  filter: AppLogFilter(),
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 40,
  ),
);

final Logger simpleLogger = Logger(
  filter: AppLogFilter(),
  printer: SimplePrinter(),
);

class AppLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) =>
      Config.appFlavor == Flavor.development || Config.appFlavor == Flavor.staging;
}
