import 'package:flutter/material.dart';
import 'package:flutter_compact_dialog/compact_dialog.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compact Dialog Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                CompactDialog.alert(
                  context: context,
                  title: 'Info',
                  body: 'This is a sample.',
                  iconData: Icons.info,
                  iconColor: Colors.blue,
                  barrierDismissible: false,
                  primaryFunction: () {
                    Navigator.of(context).pop();
                  },
                );
              },
              child: Text('DialogBox.alert'),
            ),
            ElevatedButton(
              onPressed: () {
                CompactDialog.alert(
                  context: context,
                  title: 'Info',
                  body: 'This is a sample.',
                  iconData: Icons.info,
                  iconColor: Colors.blue,
                  barrierDismissible: false,
                  primaryButtonText: 'OK',
                  primaryButtonRadius: 20,
                  primaryFunction: () {
                    Navigator.of(context).pop();
                  },
                  radius: 40,
                );
              },
              child: Text('DialogBox.alert 2'),
            ),
            ElevatedButton(
              onPressed: () {
                CompactDialog.confirm(
                  context: context,
                  title: 'Warning',
                  body: 'This is a sample. Do you want to run it?',
                  iconData: Icons.warning,
                  iconColor: Colors.yellow,
                  barrierDismissible: false,
                  primaryFunction: () {
                    Navigator.of(context).pop();
                  },
                  secondaryFunction: () {
                    Navigator.of(context).pop();
                  },
                );
              },
              child: Text('DialogBox.confirm'),
            ),
            ElevatedButton(
              onPressed: () {
                CompactDialog.confirm(
                  context: context,
                  title: 'Delete',
                  body: 'Are you sure you want to delete?',
                  iconData: Icons.close,
                  iconColor: Colors.red,
                  barrierDismissible: false,
                  primaryButtonText: 'Delete',
                  primaryButtonColor: Colors.red,
                  primaryFunction: () {
                    Navigator.of(context).pop();
                  },
                  secondaryFunction: () {
                    Navigator.of(context).pop();
                  },
                );
              },
              child: Text('DialogBox.confirm 2'),
            ),
            ElevatedButton(
              onPressed: () {
                CompactDialog.progress(
                  context: context,
                  body: 'Loading...',
                  isCenterBody: true,
                );

                Future.delayed(Duration(milliseconds: 3000)).then(
                  (_) => Navigator.of(context).pop(),
                );
              },
              child: Text('DialogBox.progress'),
            ),
          ],
        ),
      ),
    );
  }
}
