import 'dart:convert';

import 'package:http/http.dart' as http;
class ViaCepApi {

  Future<Map<dynamic,dynamic>> retornarCEP(String cep) async{
    var uri = Uri.parse('https://viacep.com.br/ws/$cep/json/');
    var ret = await http.get(uri);
    var json = jsonDecode(utf8.decode(ret.bodyBytes)) as Map;
    return json;
  }
}
