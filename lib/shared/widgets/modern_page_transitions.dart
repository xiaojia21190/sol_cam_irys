import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';

class ModernPageTransitions {
  // 滑动转场
  static PageRouteBuilder<T> slideTransition<T>({required Widget page, required RouteSettings settings, SlideDirection direction = SlideDirection.fromRight, Duration duration = AppConstants.defaultAnimationDuration}) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        Offset begin;
        switch (direction) {
          case SlideDirection.fromRight:
            begin = const Offset(1.0, 0.0);
            break;
          case SlideDirection.fromLeft:
            begin = const Offset(-1.0, 0.0);
            break;
          case SlideDirection.fromTop:
            begin = const Offset(0.0, -1.0);
            break;
          case SlideDirection.fromBottom:
            begin = const Offset(0.0, 1.0);
            break;
        }

        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  // 淡入转场
  static PageRouteBuilder<T> fadeTransition<T>({required Widget page, required RouteSettings settings, Duration duration = AppConstants.defaultAnimationDuration}) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  // 缩放转场
  static PageRouteBuilder<T> scaleTransition<T>({required Widget page, required RouteSettings settings, Duration duration = AppConstants.defaultAnimationDuration, Alignment alignment = Alignment.center}) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.easeInOutCubic;
        var tween = Tween(begin: 0.8, end: 1.0).chain(CurveTween(curve: curve));

        return ScaleTransition(
          alignment: alignment,
          scale: animation.drive(tween),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
    );
  }

  // 旋转转场
  static PageRouteBuilder<T> rotationTransition<T>({required Widget page, required RouteSettings settings, Duration duration = AppConstants.defaultAnimationDuration}) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.easeInOutCubic;
        var tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));

        return RotationTransition(
          turns: animation.drive(tween),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
    );
  }

  // 现代化混合转场（推荐用于主要页面）
  static PageRouteBuilder<T> modernTransition<T>({required Widget page, required RouteSettings settings, Duration duration = AppConstants.defaultAnimationDuration}) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 0.1);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;

        var slideTween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        var scaleTween = Tween(begin: 0.95, end: 1.0).chain(CurveTween(curve: curve));

        var fadeTween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(slideTween),
          child: ScaleTransition(
            scale: animation.drive(scaleTween),
            child: FadeTransition(opacity: animation.drive(fadeTween), child: child),
          ),
        );
      },
    );
  }

  // 相机专用转场（从底部滑入）
  static PageRouteBuilder<T> cameraTransition<T>({required Widget page, required RouteSettings settings}) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 400),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutQuart;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  // NFT详情转场（缩放+淡入）
  static PageRouteBuilder<T> nftDetailTransition<T>({required Widget page, required RouteSettings settings, Offset? heroPosition}) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 500),
      reverseTransitionDuration: const Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.easeInOutCubic;

        var scaleTween = Tween(begin: 0.8, end: 1.0).chain(CurveTween(curve: curve));

        var fadeTween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));

        return ScaleTransition(
          alignment: heroPosition != null ? Alignment((heroPosition.dx / MediaQuery.of(context).size.width) * 2 - 1, (heroPosition.dy / MediaQuery.of(context).size.height) * 2 - 1) : Alignment.center,
          scale: animation.drive(scaleTween),
          child: FadeTransition(opacity: animation.drive(fadeTween), child: child),
        );
      },
    );
  }
}

enum SlideDirection { fromRight, fromLeft, fromTop, fromBottom }

// 扩展Navigator以便于使用
extension ModernNavigator on NavigatorState {
  Future<T?> pushWithSlide<T extends Object?>(Widget page, {SlideDirection direction = SlideDirection.fromRight, Duration? duration}) {
    return push<T>(
      ModernPageTransitions.slideTransition<T>(
        page: page,
        settings: RouteSettings(name: page.runtimeType.toString()),
        direction: direction,
        duration: duration ?? AppConstants.defaultAnimationDuration,
      ),
    );
  }

  Future<T?> pushWithFade<T extends Object?>(Widget page, {Duration? duration}) {
    return push<T>(
      ModernPageTransitions.fadeTransition<T>(
        page: page,
        settings: RouteSettings(name: page.runtimeType.toString()),
        duration: duration ?? AppConstants.defaultAnimationDuration,
      ),
    );
  }

  Future<T?> pushWithScale<T extends Object?>(Widget page, {Duration? duration, Alignment alignment = Alignment.center}) {
    return push<T>(
      ModernPageTransitions.scaleTransition<T>(
        page: page,
        settings: RouteSettings(name: page.runtimeType.toString()),
        duration: duration ?? AppConstants.defaultAnimationDuration,
        alignment: alignment,
      ),
    );
  }

  Future<T?> pushWithModern<T extends Object?>(Widget page) {
    return push<T>(
      ModernPageTransitions.modernTransition<T>(
        page: page,
        settings: RouteSettings(name: page.runtimeType.toString()),
      ),
    );
  }

  Future<T?> pushCamera<T extends Object?>(Widget page) {
    return push<T>(
      ModernPageTransitions.cameraTransition<T>(
        page: page,
        settings: RouteSettings(name: page.runtimeType.toString()),
      ),
    );
  }

  Future<T?> pushNFTDetail<T extends Object?>(Widget page, {Offset? heroPosition}) {
    return push<T>(
      ModernPageTransitions.nftDetailTransition<T>(
        page: page,
        settings: RouteSettings(name: page.runtimeType.toString()),
        heroPosition: heroPosition,
      ),
    );
  }
}
