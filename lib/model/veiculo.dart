import 'package:avaliacao_psa/service/veiculo_interface.dart';

class Veiculo implements InterfaceVeiculo {
  late String placa;
  late String modelo;

  @override
  bool validarInformacoesVeiculo({required Veiculo veiculo}) {
    if (veiculo.placa.isNotEmpty && veiculo.modelo.isNotEmpty) {
      return true;
    }
    throw Exception('Informações do veículo inváidas');
  }
}
