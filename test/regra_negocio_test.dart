import 'package:avaliacao_psa/model/agendamento.dart';
import 'package:avaliacao_psa/model/cliente.dart';
import 'package:avaliacao_psa/model/pagamento.dart';
import 'package:avaliacao_psa/model/peca.dart';
import 'package:avaliacao_psa/model/servico.dart';
import 'package:avaliacao_psa/model/veiculo.dart';
import 'package:flutter_test/flutter_test.dart';

/*
Oficina de motos
1 - Para realizar o serviço, deverá ter cpf válido
2 - Para realizar o serviço, a moto deve conter placa e modelo
3 - O serviço deve possuir o valor da mão de obra válido
4 - Deve apresentar lista de itens feitos substituição na moto
5 - Apresentar para o usuário do sistema a data e horário de entrada da moto
6 - Agendamento do serviço não poderá ser realizado sem mão de obra disponível
7 - A cada 10 trocas de óleo a próxima será gratuita
8 - O serviço deve constar estimativa de prazo de entrega de acordo com a lista de itens
9 - Moto entregue apenas com pagamento do serviço
10 - Pagamento do serviço poderá ser avista ou parcelado apenas em 3x
*/

void main() {
  var itens = <Peca>[];
  var agendamento = Agendamento();

  var cliente = Cliente();
  cliente.nome = 'Andrey';
  cliente.cpf = '728.319.480-02';
  cliente.qtdTrocaOleo = 5;

  var veiculo = Veiculo();
  veiculo.placa = 'BAE-1175';
  veiculo.modelo = 'MT-09';

  var pagamento = Pagamento();
  pagamento.valorServico = 150.55;
  pagamento.qtdParcelas = 1;
  pagamento.formaPagamento = 'À vista';

  var peca1 = Peca();
  peca1.nome = 'Pneu dianteiro';
  peca1.quantidade = 1;
  peca1.estimativaTrocaPecaMinutos = 25;

  var peca2 = Peca();
  peca2.nome = 'Pneu traseiro';
  peca2.quantidade = 1;
  peca2.estimativaTrocaPecaMinutos = 40;

  itens.add(peca1);
  itens.add(peca2);

  var servico = Servico();
  servico.veiculo = veiculo;
  servico.cliente = cliente;
  servico.pagamento = pagamento;
  servico.pecas = itens;
  servico.horarioChegada = DateTime(2023, DateTime.march, 31, 09, 15);
  servico.estimativaEntrega = DateTime(2023, DateTime.april, 02, 12);
  servico.mecanicoDisponivel = true;

  test('Para realizar o serviço, deverá ter cpf válido', () {
    expect(cliente.validarCpf(cliente.cpf), true);
  });

  test('Para realizar o serviço, a moto deve conter placa e modelo', () {
    expect(veiculo.validarInformacoesVeiculo(veiculo: veiculo), true);
  });

  test('O serviço deve possuir o valor da mão de obra válido', () {
    expect(pagamento.validarPagamento(pagamento: pagamento), 150.55);
  });

  test('Deve apresentar lista de itens feitos substituição na moto', () {
    expect(servico.listarItens(servico: servico), '');
  });

  test(
      'Apresentar para o usuário do sistema a data e horário de entrada da moto',
      () {
    expect(servico.dataHorarioEntradaVeiculo(servico: servico), '2023-03-31');
  });

  test(
      'Agendamento do serviço não poderá ser realizado sem mão de obra disponível',
      () {
    expect(agendamento.validarAgendamento(servico: servico),
        'Agendamento concluído');
  });

  test('A cada 10 trocas de óleo a próxima será gratuita', () {
    expect(() => cliente.validarFidelidade(cliente: cliente), throwsException);
  });

  test(
      'O serviço deve constar estimativa de prazo de entrega de acordo com a lista de itens',
      () {
    expect(
        servico.calcularEstimativaEntrega(servico: servico), 65); // 65 minutos
  });

  test('Moto entregue apenas com pagamento do serviço', () {
    servico.pagamento.valorServico = 0.0;
    servico.veiculoEntregue = false;
    expect(() => servico.validarEntrega(servico: servico), throwsException);
  });

  test('Pagamento do serviço poderá ser avista ou parcelado apenas em 3x', () {
    expect(pagamento.validarFormaPagamento(pagamento: pagamento), 'À vista');

    pagamento.formaPagamento = '2X';
    expect(pagamento.validarFormaPagamento(pagamento: pagamento), '2X');

    pagamento.formaPagamento = '3X';
    expect(pagamento.validarFormaPagamento(pagamento: pagamento), '3X');

    pagamento.formaPagamento = '5X';
    expect(() => pagamento.validarFormaPagamento(pagamento: pagamento),
        throwsException);
  });
}
