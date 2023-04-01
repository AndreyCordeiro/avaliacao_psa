import 'package:avaliacao_psa/core/validar_cpf.dart';
import 'package:avaliacao_psa/model/agendamento.dart';
import 'package:avaliacao_psa/model/cliente.dart';
import 'package:avaliacao_psa/model/servico.dart';
import 'package:avaliacao_psa/model/veiculo.dart';
import 'package:intl/intl.dart';

class RegrasNegocio {
  bool validarCpf({required Cliente cliente}) {
    return ValidadorCpf.validarCpf(cliente.cpf);
  }

  bool validarInformacoesVeiculo({required Veiculo veiculo}) {
    if (veiculo.placa.isNotEmpty && veiculo.modelo.isNotEmpty) {
      return true;
    }
    throw Exception('Informações do veículo inváidas');
  }

  double validarPagamento({required Servico servico}) {
    if (servico.pagamento.valorServico > 0.0) {
      return servico.pagamento.valorServico;
    }
    return 0.0;
  }

  String listarItens({required Servico servico}) {
    print('Itens do pedido:');

    for (var item in servico.pecas) {
      print('Nome: ${item.nome}\nQuantidade: ${item.quantidade}');
    }
    return '';
  }

  String dataHorarioEntradaVeiculo({required Servico servico}) {
    return DateFormat('yyyy-MM-dd').format(servico.horarioChegada);
  }

  String validarAgendamento({required Servico servico}) {
    if (servico.mecanicoDisponivel) {
      var agendamento = Agendamento();
      agendamento.dataAgendamentoServico =
          DateTime(2023, DateTime.march, 31, 09, 15);
      agendamento.cliente = servico.cliente;

      servico.agendamento = agendamento;
      return 'Agendamento concluído';
    } else {
      servico.agendamento = null;
      throw Exception('Não há mão de obra disponível.');
    }
  }

  bool validarFidelidade({required Cliente cliente}) {
    if (cliente.qtdTrocaOleo == 10) {
      return cliente.proxTrocaOleoGratuita = true;
    }
    throw Exception(
        'Ainda faltam ${10 - cliente.qtdTrocaOleo} troca(s) de óleo');
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
}
