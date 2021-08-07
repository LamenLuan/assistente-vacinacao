import 'package:assistente_vacinacao/models/dia_vacinacao.dart';
import 'package:assistente_vacinacao/models/posto_de_saude.dart';

class PostoDeSaudeRepository {
  static List<PostoDeSaude> postos = [
    PostoDeSaude(
      nome: 'Unidade de Saúde Luiz Conrado Mansani',
      endereco: 'Av. General Carlos Cavalcanti - Uvaranas, ' +
          'Ponta Grossa - PR, 84030-000',
      diasDisponiveis: [
        DiaVacinacao(
          data: '30/08/2021',
          horarios: {
            'Manhã (8h - 12h)': 1,
            'Tarde (13h - 16h)': 20,
            'Noite (16h - 20h)': 10,
          }
        ),
        DiaVacinacao(
          data: '01/09/2021',
          horarios: {
            'Manhã (8h - 12h)': 40,
            'Tarde (13h - 16h)': 40,
            'Noite (16h - 20h)': 30,
          }
        )
      ],
    ),
    PostoDeSaude(
      nome: 'Unidade de Saúde Silas Sallen',
      endereco: 'Rua Rodrigo Silva - Uvaranas - ' +
          ' Vila Claudionora, Ponta Grossa - PR, 84030-040',
      diasDisponiveis: [
        DiaVacinacao(
          data: '30/08/2021',
          horarios: {
            'Manhã (8h - 12h)': 20,
            'Tarde (13h - 16h)': 20,
            'Noite (16h - 20h)': 10,
          }
        ),
        DiaVacinacao(
          data: '01/09/2021',
          horarios: {
            'Manhã (8h - 12h)': 40,
            'Tarde (13h - 16h)': 40,
            'Noite (16h - 20h)': 30,
          }
        )
      ],
    ),
    PostoDeSaude(
      nome: 'Unidade de Saúde Antonio Saliba',
      endereco: 'R. Siqueira Campos, 753 - Parque Sabiá, ' +
          'Ponta Grossa - PR, 84031-030',
      diasDisponiveis: [
        DiaVacinacao(
          data: '30/08/2021',
          horarios: {
            'Manhã (8h - 12h)': 20,
            'Tarde (13h - 16h)': 20,
            'Noite (16h - 20h)': 10,
          }
        ),
        DiaVacinacao(
          data: '01/09/2021',
          horarios: {
            'Manhã (8h - 12h)': 40,
            'Tarde (13h - 16h)': 40,
            'Noite (16h - 20h)': 30,
          }
        )
      ],
    ),
    PostoDeSaude(
      nome: 'Unidade de Saúde Madre Josefa',
      endereco: 'R. Bituruna - Coronel Cláudio, Ponta Grossa - PR, 84025-490',
      diasDisponiveis: [
        DiaVacinacao(
          data: '30/08/2021',
          horarios: {
            'Manhã (8h - 12h)': 20,
            'Tarde (13h - 16h)': 20,
            'Noite (16h - 20h)': 10,
          }
        ),
        DiaVacinacao(
          data: '01/09/2021',
          horarios: {
            'Manhã (8h - 12h)': 40,
            'Tarde (13h - 16h)': 40,
            'Noite (16h - 20h)': 30,
          }
        )
      ],
    )
  ];

  static PostoDeSaude? findPosto(String nome) {
    for (var posto in postos) {
      if (posto.nome == nome) return posto;
    }
  }
}
