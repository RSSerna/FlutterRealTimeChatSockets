import 'package:flutter/material.dart';
import 'package:flutterrealtimechatsockets/core/usecase/usecase.dart';
import 'package:flutterrealtimechatsockets/features/loading/domain/usecases/try_renew_token.dart';

class LoadingService with ChangeNotifier {
  final TryRenewToken tryRenewToken;

  LoadingService({required this.tryRenewToken});

  Future<bool> isLoggedIn() async {
    final failureOrRenew = await tryRenewToken(NoParams());

    bool ok = true;
    failureOrRenew.fold((failure) {
      ok = false;
    }, (_) {});
    return ok;
  }
}
