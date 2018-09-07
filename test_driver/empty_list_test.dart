// Imports the Flutter Driver API
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutterdriver_test_list/utils/strings.dart';
import 'package:test/test.dart';

void main() {
  group("tests", () {
    final int start = DateTime.now().millisecondsSinceEpoch;
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) driver.close();
    });

    test("Checking if ListView is not empty", () async {
      await driver.waitForAbsent(find.text(EMPTY));
    });

    test("Checking if my ListView shows the items in my List?", () async {
      for (var i = 0; i < NAMESLIST.length; i++) {
        SerializableFinder item = find.byValueKey("ITEM_$i");
        print("Searching for ${NAMESLIST[i]} in index $i");
        await driver.tap(item);
        await driver.waitFor(item);

        await driver.scrollUntilVisible(item, find.text(NAMESLIST[i]));
      }

      final int end = DateTime.now().millisecondsSinceEpoch;
      final int duration = end - start;
      print('time: ${(duration).toStringAsFixed(2)} ms');
    }, timeout: Timeout(Duration(minutes: 1)));
  });
}
