import 'package:avaliacao_psa/model/agendamento.dart';
import 'package:avaliacao_psa/model/cliente.dart';
import 'package:avaliacao_psa/model/pagamento.dart';
import 'package:avaliacao_psa/model/peca.dart';
import 'package:avaliacao_psa/model/veiculo.dart';
import 'package:avaliacao_psa/service/servico_interface.dart';
import 'package:intl/intl.dart';

class Servico implements InterfaceServico {
  late Cliente cliente;
  late Veiculo veiculo;
  late Pagamento pagamento;
  late Agendamento? agendamento;
  late List<Peca> pecas;
  late DateTime horarioChegada;
  late DateTime estimativaEntrega;
  late bool mecanicoDisponivel;
  late bool veiculoEntregue;

  @override
  String listarItens({required Servico servico}) {
    print('Itens do pedido:');

    for (var item in servico.pecas) {
      print('Nome: ${item.nome}\nQuantidade: ${item.quantidade}');
    }
    return '';
  }

  @override
  String dataHorarioEntradaVeiculo({required Servico servico}) {
    return DateFormat('yyyy-MM-dd').format(servico.horarioChegada);
  }

  double validarEntrega({required Servico servico}) {
    if (servico.pagamento.valorServico <= 0.0) {
      throw Exception(
          'O pagamento ainda não foi realizado, então o veículo não pode ser retirado');
    } else {
      servico.veiculoEntregue = false;
      return servico.pagamento.valorServico;
    }
  }

  @override
  int calcularEstimativaEntrega({required Servico servico}) {
    var estimativaEntrega = 0;

    for (var peca in servico.pecas) {
      estimativaEntrega += peca.estimativaTrocaPecaMinutos;
    }

    return estimativaEntrega;
  }
}
