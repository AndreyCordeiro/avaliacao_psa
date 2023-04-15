import 'package:avaliacao_psa/model/servico.dart';

abstract class InterfaceAgendamento {
  String validarAgendamento({required Servico servico});
}
