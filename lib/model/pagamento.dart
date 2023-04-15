import 'package:avaliacao_psa/model/servico.dart';
import 'package:avaliacao_psa/service/pagamento_interface.dart';

class Pagamento implements InterfacePagamento {
  late double valorServico;
  late int qtdParcelas;
  late String formaPagamento;

  static const A_VISTA = 'À vista';
  static const DUAS_X = '2X';
  static const TRES_X = '3X';

  @override
  double validarPagamento({required Pagamento pagamento}) {
    if (pagamento.valorServico > 0.0) {
      return pagamento.valorServico;
    }
    return 0.0;
  }

  @override
  String validarFormaPagamento({required Pagamento pagamento}) {
    if (pagamento.formaPagamento == A_VISTA) {
      return A_VISTA;
    } else if (pagamento.formaPagamento == DUAS_X) {
      return DUAS_X;
    } else if (pagamento.formaPagamento == TRES_X) {
      return TRES_X;
    } else {
      throw Exception('Forma de pagamento inválida! Permitido somente até 3X');
    }
  }
}
