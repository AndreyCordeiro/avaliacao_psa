import 'package:avaliacao_psa/model/agendamento.dart';
import 'package:avaliacao_psa/model/cliente.dart';
import 'package:avaliacao_psa/model/pagamento.dart';
import 'package:avaliacao_psa/model/peca.dart';
import 'package:avaliacao_psa/model/veiculo.dart';

class Servico {
  late Cliente cliente;
  late Veiculo veiculo;
  late Pagamento pagamento;
  late Agendamento? agendamento;
  late List<Peca> pecas;
  late DateTime horarioChegada;
  late DateTime estimativaEntrega;
  late bool mecanicoDisponivel;
  late bool veiculoEntregue;
}
