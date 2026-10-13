import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Page<dynamic> buildPlatformPage({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  if (!kIsWeb && (Platform.isIOS || Platform.isMacOS)) {
    return CupertinoPage(key: state.pageKey, child: child);
  }

  return MaterialPage(key: state.pageKey, child: child);
}
