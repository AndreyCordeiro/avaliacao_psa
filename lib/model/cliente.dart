import 'package:avaliacao_psa/model/pessoa.dart';
import 'package:avaliacao_psa/service/cliente_interface.dart';

class Cliente extends Pessoa implements InterfaceCliente {
  late int qtdTrocaOleo;
  late bool proxTrocaOleoGratuita;

  @override
  bool validarFidelidade({required Cliente cliente}) {
    if (cliente.qtdTrocaOleo == 10) {
      return cliente.proxTrocaOleoGratuita = true;
    }
    throw Exception(
        'Ainda faltam ${10 - cliente.qtdTrocaOleo} troca(s) de óleo');
  }
}
