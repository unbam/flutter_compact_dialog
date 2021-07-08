# flutter_compact_dialog

[![pub package](https://img.shields.io/pub/v/flutter_compact_dialog.svg)](https://pub.dev/packages/flutter_compact_dialog)

This is compact dialog package for Flutter.

## Installation & Uses

Add `flutter_compact_dialog` as a dependency in your pubspec.yaml file

```yaml
dependencies:
  flutter_compact_dialog: <current version>
```

Import `CompactDialog` in your dart file.

### For example

#### alert

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

<img src="https://user-images.githubusercontent.com/16283613/124898626-54b74300-e01a-11eb-804b-365e22222b10.png" width="320">

#### confirm

```dart
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
```

<img src="https://user-images.githubusercontent.com/16283613/124898634-57199d00-e01a-11eb-970f-dcad923e10cd.png" width="320">

#### progress

```dart
CompactDialog.progress(
  context: context,
  body: 'Loading...',
  isCenterBody: true,
);
```

<img src="https://user-images.githubusercontent.com/16283613/124898638-57b23380-e01a-11eb-9330-31dc222123c2.png" width="320">
