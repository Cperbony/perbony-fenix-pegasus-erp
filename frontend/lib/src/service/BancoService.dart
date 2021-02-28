import 'package:mvc_application/model.dart';
import 'package:perboni_erp_fenix/src/model/Banco.dart';
import 'package:sqflite/sqflite.dart';

class BancoService extends DBInterface {
  factory BancoService() {
    _this ??= BancoService._();
    return _this;
  }

  BancoService._() : super();

  static BancoService _this;

// Retorna apenas uma instância de Banco Service caso não tenha sido instanciada
  static BancoService get bancoService => _this ?? BancoService();

  @override
  // TODO: implement name of DataBase
  String get name => 't2ti_erp_fenix';

  @override
  Future<void> onCreate(Database db, int version) async {
    await db.execute("""
    CREATE TABLE BANCO(
      id INTEGER PRIMARY KEY,
      codigo TEXT,
      nome TEXT,
      url TEXT
      )
    """);
  }

  @override
  // TODO: implement version
  int get version => 1;

  static Future<bool> initState() => BancoService().init();

  // Para eliminar o objeto no fim da aplicação
  static void dispose() {
    BancoService().disposed();
  }

  // CRUD
  //Sempre utilizamos o async, utilizamos o await
  static Future<List<Banco>> consultarLista() async {
    return tratarRetornoQuery(await _this.rawQuery('SELECT * FROM BANCO'));
  }

  // Converter uma lista de map para uma lista de banco
  static Future<List<Banco>> tratarRetornoQuery(
      List<Map<String, dynamic>> consulta) async {
    List<Banco> bancoList = [];
    for (Map bancoMap in consulta) {
      Map<String, dynamic> map = bancoMap.map((key, value) {
        return MapEntry(key, value is int ? value?.toString() : value);
      });
      Banco banco = Banco.fromMap(map);
      bancoList.add(banco);
    }
    return bancoList;
  }

  consultarObjeto() {}

  static Future<bool> salvar(Map<String, dynamic> banco) async {
    Map<String, dynamic> bancoSalvo = await _this.saveMap('BANCO', banco);
    return bancoSalvo.isNotEmpty;
  }

  static Future excluir(Map<String, dynamic> banco) async {
    var id = banco['id'];
    if (id == null) return Future.value(false);
    List<Map<String, dynamic>> retorno =
        await _this.rawQuery('DELETE FROM BANCO WHERE ID = $id');
    return retorno.length > 0;
  }
}
