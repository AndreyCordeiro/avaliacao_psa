import 'package:avaliacao_psa/model/cliente.dart';
import 'package:avaliacao_psa/model/servico.dart';
import 'package:avaliacao_psa/service/agendamento_interface.dart';

class Agendamento implements InterfaceAgendamento {
  late DateTime dataAgendamentoServico;
  late Cliente cliente;

  @override
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
}
