import 'package:assistente_vacinacao/models/cidadao.dart';

class CidadaoRepository {
  static List<Cidadao> cidadaos = [
    Cidadao(
      cpf: '111.111.111-11',
      senha: '123456',
      nome: 'Usuário',
      dataNascimento: DateTime(1,1,2001),
      isMasculino: true,
      comorbidade: false,
      telefone: '',
      email: ''
    )
  ];

  static Cidadao? findCidadao(String cpf)
  {
    for (var cidadao in cidadaos) {
      if(cidadao.cpf == cpf) return cidadao;
    }
  }
}