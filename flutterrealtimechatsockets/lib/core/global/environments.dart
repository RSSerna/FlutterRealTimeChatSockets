import 'dart:io';

class Environments{
  static String apiUrl = Platform.isAndroid ? '10.0.2.2:3000' : 'localhost:3000';
  static String socketURL = Platform.isAndroid ? 'http://10.0.2.2:3000' : 'http://localhost:3000';
}