import 'package:app_testes_dart/via_cep_api.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'api_cep_test.mocks.dart';

@GenerateMocks([MockViaCep])
void main() {

  test('Retorna CEP', () async {
    var body = await ViaCepApi().retornarCEP("85770000");
    print(body);
    expect(body['localidade'], equalsIgnoringCase("Realeza"));
    expect(body['ibge'], equalsIgnoringCase("4121406"));
    expect(body['cep'], equalsIgnoringCase("85770-000"));
  });

  test('Retorna CEP com MOCK', () async {

    MockMockViaCep mockMockViaCep = MockMockViaCep();

    when(mockMockViaCep.retornarCEP("85770000")).thenAnswer((realInvocation) =>
        Future.value(
            {
              "cep": "85770-000",
              "logradouro": "",
              "complemento": "",
              "bairro": "",
              "localidade": "Realeza",
              "uf": "PR",
              "ibge": "4121406",
              "gia": "",
              "ddd": "46",
              "siafi": "7805"
            }
        ));

    var body = await mockMockViaCep.retornarCEP("85770000");
    print(body);
    expect(body['localidade'], equalsIgnoringCase("Realeza"));
    expect(body['ibge'], equalsIgnoringCase("4121406"));
    expect(body['cep'], equalsIgnoringCase("85770-000"));
  });
}

class MockViaCep extends Mock implements ViaCepApi {

}
