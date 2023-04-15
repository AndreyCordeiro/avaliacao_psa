import 'package:avaliacao_psa/model/servico.dart';

abstract class InterfaceServico {
  String listarItens({required Servico servico});

  String dataHorarioEntradaVeiculo({required Servico servico});

  int calcularEstimativaEntrega({required Servico servico});
}
