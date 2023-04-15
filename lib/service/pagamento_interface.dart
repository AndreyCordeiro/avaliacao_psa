import 'package:avaliacao_psa/model/pagamento.dart';

abstract class InterfacePagamento {
  double validarPagamento({required Pagamento pagamento});

  String validarFormaPagamento({required Pagamento pagamento});
}
