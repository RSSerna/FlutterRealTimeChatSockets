import 'package:flutterrealtimechatsockets/core/di/injection_container.dart';
import 'package:flutterrealtimechatsockets/l10n/l10n.dart';

class ErrorMessage {
  // static final l10n = L10n.current;
  static final l10n = InjectionContainerImpl().sl<L10n>();
}