// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'es';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "createOneNow": MessageLookupByLibrary.simpleMessage("Crea una ahora!"),
        "dontHaveAccount":
            MessageLookupByLibrary.simpleMessage("No tienes una cuenta?"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "error400": MessageLookupByLibrary.simpleMessage(
            "Oops, algo salió mal. Parece que la solicitud no pudo entenderse o hacen falta parámetros requeridos"),
        "error401": MessageLookupByLibrary.simpleMessage(
            "Error de autenticación! Por favor, inicia sesión nuevamente o verifica tus permisos"),
        "error403": MessageLookupByLibrary.simpleMessage(
            "Acceso denegado! No tienes permisos para acceder a este recurso"),
        "error404": MessageLookupByLibrary.simpleMessage(
            "Recurso no encontrado! No pudimos encontrar lo que estabas buscando"),
        "error405": MessageLookupByLibrary.simpleMessage(
            "El método de solicitud no es compatible con el recurso solicitado"),
        "error429": MessageLookupByLibrary.simpleMessage(
            "Exceso de solicitudes. Por favor, espera un momento y vuelve a intentarlo"),
        "error500": MessageLookupByLibrary.simpleMessage(
            "Oops, algo salió mal en nuestro servidor. Estamos trabajando para solucionarlo"),
        "error502": MessageLookupByLibrary.simpleMessage(
            "Error en la puerta de enlace! Se recibió una respuesta no válida desde el servidor"),
        "error503": MessageLookupByLibrary.simpleMessage(
            "Servicio no disponible! El no se pudo procesar la solicitud en este momento"),
        "error504": MessageLookupByLibrary.simpleMessage(
            "Tiempo de espera agotado! No pudimos recibir una respuesta oportuna del servidor"),
        "errorDefault": MessageLookupByLibrary.simpleMessage(
            "Lo sentimos. Algo salió mal y no pudimos procesar tu solicitud"),
        "haveAccount":
            MessageLookupByLibrary.simpleMessage("Ya tienes una cuenta?"),
        "login": MessageLookupByLibrary.simpleMessage("Accede"),
        "loginNow": MessageLookupByLibrary.simpleMessage("Accede ahora!"),
        "password": MessageLookupByLibrary.simpleMessage("Contraseña"),
        "register": MessageLookupByLibrary.simpleMessage("Registrar"),
        "termsAndConditions":
            MessageLookupByLibrary.simpleMessage("Terminos y condiciones")
      };
}
