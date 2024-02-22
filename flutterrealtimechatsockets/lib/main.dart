import 'package:flutter/material.dart';
import 'package:flutterrealtimechatsockets/core/di/injection_container.dart';
import 'package:flutterrealtimechatsockets/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final injectionContainerImpl = InjectionContainerImpl();
  await injectionContainerImpl.init();
  runApp(AppState(injectionContainerImpl: injectionContainerImpl));
}
