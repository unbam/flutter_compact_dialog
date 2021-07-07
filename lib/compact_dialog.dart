import 'package:flutter/material.dart';

import 'animation_icon.dart';

class CompactDialog {
  ///
  /// _contentPadding
  ///
  static final _contentPadding = const EdgeInsets.symmetric(
    vertical: 10,
    horizontal: 20.0,
  );

  ///
  /// _dialog
  /// [contents] contents
  /// [width] width
  /// [height] height
  /// [radius] dialog Radius
  /// [hasInsetPaddingHorizontal] hasInsetPaddingHorizontal
  /// [insetPaddingHorizontal] insetPaddingHorizontal
  ///
  static AlertDialog _dialog({
    required List<Widget> contents,
    double? width,
    double? height,
    double? radius,
    bool hasInsetPaddingHorizontal = false,
    double insetPaddingHorizontal = 320,
  }) {
    final radiusCircular = Radius.circular(radius ?? 15.0);

    return AlertDialog(
      backgroundColor: ThemeData().dialogBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          radiusCircular,
        ),
      ),
      contentPadding: EdgeInsets.all(0),
      insetPadding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal:
            hasInsetPaddingHorizontal ? insetPaddingHorizontal * 0.3 : 30,
      ),
      content: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: radiusCircular,
            bottomRight: radiusCircular,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: contents,
          ),
        ),
      ),
    );
  }

  ///
  /// _contents
  /// [title] title
  /// [body] body
  /// [isCenterBody] isCenterBody
  /// [primaryButtonText] primaryButtonText
  /// [primaryButtonColor] primaryButtonColor
  /// [primaryButtonRadius] primaryButtonRadius
  /// [primaryFunction] primaryFunction
  /// [secondaryButtonText] secondaryButtonText
  /// [secondaryFunction] secondaryFunction
  /// [iconData] iconData
  /// [iconSize] iconSize
  /// [iconColor] iconColor
  /// [iconDurationMilliseconds] iconDurationMilliseconds
  /// [hasProgress] hasProgress
  /// [progressColor] progressColor
  /// [progressSize] progressSize
  /// [orientation] orientation
  ///
  static List<Widget> _contents({
    String? title,
    String? body,
    bool isCenterBody = false,
    String? primaryButtonText,
    Color? primaryButtonColor,
    double primaryButtonRadius = 5,
    Function? primaryFunction,
    String? secondaryButtonText,
    Function? secondaryFunction,
    IconData? iconData,
    double iconSize = 80,
    Color? iconColor,
    int? iconDurationMilliseconds,
    bool hasProgress = false,
    Color? progressColor,
    double progressSize = 50,
    Orientation orientation = Orientation.portrait,
  }) {
    final contentPadding = orientation == Orientation.portrait
        ? _contentPadding
        : _contentPadding.copyWith(top: 5.0, bottom: 5.0);
    return [
      SizedBox(
        height: 5.0,
      ),
      hasProgress
          ?
          // CircularProgressIndicator
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox.shrink(),
                  SizedBox(
                    height: progressSize,
                    width: progressSize,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          progressColor ?? Colors.blue),
                      backgroundColor: progressColor != null
                          ? progressColor.withOpacity(0.5)
                          : null,
                      strokeWidth: 5.0,
                    ),
                  ),
                  SizedBox.shrink(),
                ],
              ),
            )
          :
          // Icon
          iconData != null
              ? Padding(
                  padding: contentPadding,
                  child: AnimationIcon(
                    iconData: iconData,
                    iconSize: iconSize,
                    iconColor: iconColor ?? Colors.blue,
                    durationMilliseconds: iconDurationMilliseconds,
                  ),
                )
              : SizedBox.shrink(),
      // Title
      title != null
          ? Padding(
              padding: contentPadding,
              child: Center(
                child: Text(
                  title,
                  style: ThemeData().textTheme.subtitle1!.copyWith(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            )
          : SizedBox.shrink(),
      // Body
      body != null
          ? Padding(
              padding: contentPadding,
              child: isCenterBody
                  ? Center(
                      child: Text(
                        body,
                        style: ThemeData().textTheme.bodyText2,
                      ),
                    )
                  : Text(
                      body,
                      style: ThemeData().textTheme.bodyText2,
                    ),
            )
          : SizedBox.shrink(),
      // Primary Button
      primaryButtonText != null
          ? Padding(
              padding: contentPadding,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(primaryButtonRadius),
                  ),
                  primary: primaryButtonColor,
                ),
                onPressed: () =>
                    primaryFunction != null ? primaryFunction() : null,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    primaryButtonText,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          : SizedBox.shrink(),
      // Secondary Button
      secondaryButtonText != null
          ? Padding(
              padding: contentPadding.copyWith(top: 10.0),
              child: InkWell(
                onTap: () =>
                    secondaryFunction != null ? secondaryFunction() : null,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Text(
                  secondaryButtonText,
                  style: ThemeData().textTheme.button!.copyWith(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : SizedBox.shrink(),
      SizedBox(
        height: 5.0,
      ),
    ];
  }

  ///
  /// alert
  /// [context] BuildContext
  /// []
  ///
  static alert({
    required BuildContext context,
    String title = 'Alert',
    String? body,
    bool isCenterBody = false,
    String primaryButtonText = 'Close',
    Color? primaryButtonColor,
    double primaryButtonRadius = 5,
    required Function primaryFunction,
    IconData? iconData,
    double iconSize = 80,
    Color? iconColor,
    int? iconDurationMilliseconds,
    double radius = 15.0,
    double width = 300,
    bool barrierDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return _dialog(
          contents: _contents(
            title: title,
            body: body,
            isCenterBody: isCenterBody,
            primaryButtonText: primaryButtonText,
            primaryButtonRadius: primaryButtonRadius,
            primaryFunction: primaryFunction,
            iconData: iconData,
            iconColor: iconColor,
            orientation: MediaQuery.of(context).orientation,
          ),
          radius: radius,
          width: width,
          insetPaddingHorizontal: MediaQuery.of(context).size.width,
        );
      },
    );
  }

  ///
  /// confirm
  /// [context] BuildContext
  /// [title] title
  /// [body] body
  /// [isCenterBody] isCenterBody
  /// [primaryButtonText] primaryButtonText
  /// [primaryButtonColor] primaryButtonColor
  /// [primaryButtonRadius] primaryButtonRadius
  /// [primaryFunction] primaryFunction
  /// [secondaryButtonText] secondaryButtonText
  /// [secondaryFunction] secondaryFunction
  /// [iconData] iconData
  /// [iconColor] iconColor
  /// [iconDurationMilliseconds] iconDurationMilliseconds
  /// [radius] radius
  /// [width] width
  /// [barrierDismissible] barrierDismissible
  ///
  static confirm({
    required BuildContext context,
    String? title,
    String? body,
    bool isCenterBody = false,
    String primaryButtonText = 'OK',
    Color? primaryButtonColor,
    double primaryButtonRadius = 5,
    required Function primaryFunction,
    String secondaryButtonText = 'Cancel',
    required Function secondaryFunction,
    IconData? iconData,
    double iconSize = 80,
    Color? iconColor,
    int? iconDurationMilliseconds,
    double radius = 15.0,
    double width = 300,
    bool barrierDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return _dialog(
          contents: _contents(
            title: title,
            body: body,
            isCenterBody: isCenterBody,
            primaryButtonText: primaryButtonText,
            primaryButtonColor: primaryButtonColor,
            primaryButtonRadius: primaryButtonRadius,
            primaryFunction: primaryFunction,
            secondaryButtonText: secondaryButtonText,
            secondaryFunction: secondaryFunction,
            iconData: iconData,
            iconColor: iconColor,
            iconDurationMilliseconds: iconDurationMilliseconds,
            orientation: MediaQuery.of(context).orientation,
          ),
          radius: radius,
          width: width,
          insetPaddingHorizontal: MediaQuery.of(context).size.width,
        );
      },
    );
  }

  ///
  /// progress
  /// [context] BuildContext
  /// [title] title
  /// [body] body
  /// [isCenterBody] isCenterBody
  /// [progressSize] progressSize
  /// [radius] radius
  /// [barrierDismissible] barrierDismissible
  ///
  static void progress({
    required BuildContext context,
    String? title,
    String? body,
    bool isCenterBody = false,
    double progressSize = 50,
    double radius = 15.0,
    bool barrierDismissible = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return _dialog(
          contents: _contents(
            title: title,
            body: body,
            isCenterBody: isCenterBody,
            hasProgress: true,
            progressColor: Theme.of(context).primaryColor,
            progressSize: progressSize,
          ),
          radius: radius,
          hasInsetPaddingHorizontal: true,
          insetPaddingHorizontal: MediaQuery.of(context).size.width,
        );
      },
    );
  }
}
