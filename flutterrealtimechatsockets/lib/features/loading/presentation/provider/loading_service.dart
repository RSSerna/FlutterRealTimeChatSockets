import 'package:flutter/material.dart';
import 'package:flutterrealtimechatsockets/core/usecase/usecase.dart';
import 'package:flutterrealtimechatsockets/features/loading/domain/entities/internal_token.dart';
import 'package:flutterrealtimechatsockets/features/loading/domain/usecases/try_get_token.dart';
import 'package:flutterrealtimechatsockets/features/loading/domain/usecases/try_renew_token..dart';

class LoadingService with ChangeNotifier {
  final TryGetToken tryGetToken;
  final TryRenewToken tryRenewToken;

  LoadingService({required this.tryGetToken, required this.tryRenewToken});

  Future<bool> isLoggedIn() async {
    final failureOrToken = await tryGetToken(NoParams());

    bool ok = true;
    failureOrToken.fold((failure) {
      print('Failure getting token');
      ok = false;
    }, (internalToken) async {
      final failureOrRenew =
          await tryRenewToken(InternalToken(token: internalToken.token));

      failureOrRenew.fold((failure) {
        ok = false;
        print('Failure renewing token');
        //TODO: Borrar Token, preguntar a Luis si se debe hacer un UseCase
      }, (tokenResponse) {
        //TODO: Guardar UserDB
      });
    });
    return ok;
  }
}
