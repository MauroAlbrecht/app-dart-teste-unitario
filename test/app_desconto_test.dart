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

  group("Calcula o valor do produto com desconto", () {
    var valuesToTest = {
      {'valor': 1000, 'desconto': 150, 'percentual': false}: 850,
      {'valor': 1000, 'desconto': 15, 'percentual': true}: 850,
    };
    valuesToTest.forEach((values, expected) {
      test('$values: $expected', () {
        expect(CalculaDesconto.calcularDesconto(double.parse(values['valor'].toString()),
            double.parse(values['desconto'].toString()), values['percentual'] == true), equals(expected));
      });
    });
  });
}
