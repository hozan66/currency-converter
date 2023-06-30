import 'package:flutter/material.dart';

import 'navigation/navigation_service.dart';

extension ResponsiveDouble on double {
  double get h {
    return MediaQuery.of(NavigationService.navigatorKey.currentState!.context)
            .size
            .height /
        100 *
        this;
  }

  double get w {
    return MediaQuery.of(NavigationService.navigatorKey.currentState!.context)
            .size
            .width /
        100 *
        this;
  }

  double get sp {
    return ((MediaQuery.of(NavigationService.navigatorKey.currentState!.context)
                    .size
                    .width /
                100) /
            3) *
        this;
  }
}

extension ResponsiveInt on int {
  double get h {
    return MediaQuery.of(NavigationService.navigatorKey.currentState!.context)
            .size
            .height /
        100 *
        this;
  }

  double get w {
    return MediaQuery.of(NavigationService.navigatorKey.currentState!.context)
            .size
            .width /
        100 *
        this;
  }

  double get sp {
    return ((MediaQuery.of(NavigationService.navigatorKey.currentState!.context)
                    .size
                    .width /
                100) /
            3) *
        this;
  }
}

final media = MediaQueryData.fromWindow(WidgetsBinding.instance.window);

extension Responsive on num {
  double get w => media.size.width / 100;
  double get h => media.size.height / 100;
  double get sp => media.size.height / 100 / 3;
}

// Partially obscured UIs:
// These are status bars, bottom indicators. We should account for
// these UIs in our app to create an immersive experience.
//
// Completely obscured UIs:
// These usually are keyboards. We should adjust our layout to avoid these UIs when they show up.

// viewInsets → the space needed for completely obscured UIs.
//
// viewPadding → the space needed for partially obscured UIs.

// Extension methods are a way to add functionality to existing libraries.
extension AppMediaQuery on BuildContext {
  // this => is the value of variable
  // which it is => context
  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenViewPaddingTop => MediaQuery.of(this).viewPadding.top;

  // ViewInsets is for the keyboard
  // You can get the keyboard height
  double get screenSpaceKeyboardHeight => MediaQuery.of(this).viewInsets.bottom;

  // Status Bar Height
  double get statusBarHeight => MediaQuery.of(this).padding.top;

  // ============================================================

  bool get isTablet => MediaQuery.of(this).size.width >= 481;
}

// Usage
// width: context.screenWidth,
// We will use the name of the extension when we have more than one extension
// width: AppMediaQuery(context).screenWidth,
