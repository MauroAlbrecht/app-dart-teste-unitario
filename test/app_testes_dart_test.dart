import 'package:app_testes_dart/calcula_desconto.dart';
import 'package:test/test.dart';

void main() {
  test('Calcula o desconto do produto sem porcenagem', () {
    expect(CalculaDesconto.calcularDesconto(1000, 150, false), 850);
  });

  test('Calcula o desconto do produto com porcenagem', () {
    expect(CalculaDesconto.calcularDesconto(1000, 15, true), 850);
  });

  test('Não permite informar valor do produto zerado', () {
    expect(() => CalculaDesconto.calcularDesconto(0, 15, true), throwsArgumentError);
  });

  test('Não permite informar valor do desconto zerado', () {
    expect(() => CalculaDesconto.calcularDesconto(1000, 0, true), throwsArgumentError);
  });
}
