# flutter_compact_dialog

This is compact dialog package for Flutter.

## Installation & Uses

Add `flutter_compact_dialog` as a dependency in your pubspec.yaml file

```yaml
dependencies:
  flutter_compact_dialog: <current version>
```

Import `CompactDialog` in your dart file.

### For example

```dart
CompactDialog.alert(
    context: context,
    title: 'Info',
    body: 'This is a sample.',
    iconData: Icons.info,
    iconColor: Colors.blue,
    primaryFunction: () {
        Navigator.of(context).pop();
    },
);
```
