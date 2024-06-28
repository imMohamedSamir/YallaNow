import 'dart:developer';

import 'package:logging/logging.dart';

void configureLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    log('${record.level.name}: ${record.time}: ${record.message}');
  });
}
