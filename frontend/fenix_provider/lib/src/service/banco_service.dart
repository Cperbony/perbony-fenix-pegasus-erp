import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' show Client;
import 'package:fenix_provider/src/model/banco.dart';

class BancoService extends ServiceBase {
  var client = Client();

  Future<List<Banco>> consultarLista() async {
    var listaBanco = List<Banco>();

    final response = await client.get('$endpoint/banco/');

    if (response.statusCode == 200) {
      // Converte o response de Json para um List<Dynamic>
      var responseConvertido = json.decode(response.body) as List<dynamic>;

      // Loop na lista Convertida para inserir os objetos Banco na lista de Bancos
      for (var bancoJson in responseConvertido) {
        listaBanco.add(Banco.fromJson(bancoJson));
      }

      return listaBanco;
    } else {
      return null;
    }
  }

  Future<Banco> consultarObjeto(int idBanco) async {
    final response = await client.get('$endpoint/banco/$idBanco');

    if (response.statusCode == 200) {
      // Converte o response de Json para um Objeto
      var bancoJson = json.decode(response.body);

      return Banco.fromJson(bancoJson);
    } else {
      return null;
    }
  }

  Future<Banco> inserir(Banco banco) async {
    final response = await client.post('$endpoint/banco/',
        headers: {"content-type": "application/json"},
        body: bancoEncodeJson(banco));

    if (response.statusCode == 200) {
      // Converte o response de Json para um Objeto
      var bancoJson = json.decode(response.body);

      return Banco.fromJson(bancoJson);
    } else {
      return null;
    }
  }

  Future<Banco> alterar(Banco banco) async {
    final response = await client.put('$endpoint/banco/',
        headers: {"content-type": "application/json"},
        body: bancoEncodeJson(banco));

    if (response.statusCode == 200) {
      // Converte o response de Json para um Objeto
      var bancoJson = json.decode(response.body);

      return Banco.fromJson(bancoJson);
    } else {
      return null;
    }
  }

  Future<bool> excluir(int idBanco) async {
    final response = await client.delete('$endpoint/banco/$idBanco',
        headers: {"content-type": "application/json"});

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}

class ServiceBase {}
