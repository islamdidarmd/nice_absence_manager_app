import 'dart:io';
import 'dart:isolate';

import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

Future<File> generateICS({
  required String eventSummary,
  required DateTime startTime,
  required DateTime endTime,
}) async {
  final icsContent =
      _createICSContent(eventSummary, startTime.toUtc(), endTime.toUtc());
  final directory = await getTemporaryDirectory();

  return Isolate.run(
    () async {
      final String filePath = '${directory.path}/event.ics';
      final File eventFile = File(filePath);
      await eventFile.writeAsString(icsContent);
      return eventFile;
    },
  );
}

String _createICSContent(String summary, DateTime start, DateTime end) {
  final DateFormat formatter = DateFormat('yyyyMMddTZ');

  return '''
BEGIN:VCALENDAR
VERSION:2.0
PRODID:-//Nice Absence Manager//EN
CALSCALE:GREGORIAN
METHOD:PUBLISH
BEGIN:VEVENT
UID:${DateTime.now().millisecondsSinceEpoch}@nice-absence-manager.com
DTSTART:${formatter.format(start)}
DTEND:${formatter.format(end)}
SUMMARY:$summary
END:VEVENT
END:VCALENDAR
''';
}
