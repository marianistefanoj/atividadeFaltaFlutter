import '../../infra/http/cliente_http.dart';
import '../../constantes.dart';
import '../../models/models.dart';

class EmissoraRemote{
  final _link = '${linkApiEmissoras}Emissoras/GetEmissora';
  final  _clienteHttp = ClienteHttp();

  Future<List<Emissora>> get() async {
    final lista = await _clienteHttp.getJson(_link);
    return lista.map((e) => Emissora.fromMap(e)).toList();
  }

}