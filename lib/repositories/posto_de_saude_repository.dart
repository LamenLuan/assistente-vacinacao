import 'package:assistente_vacinacao/models/posto_de_saude.dart';

class PostoDeSaudeRepository {
  static List<PostoDeSaude> postos = [
    PostoDeSaude(
      nome: 'Unidade de Saúde Luiz Conrado Mansani',
      endereco: 'Av. General Carlos Cavalcanti - Uvaranas,' +
          'Ponta Grossa - PR, 84030-000',
      diasDisponiveis: ['27/08/2021', '29/08/2021', '30/08/2021'],
    ),
    PostoDeSaude(
      nome: 'Unidade de Saúde Silas Sallen',
      endereco: 'Rua Rodrigo Silva - Uvaranas - ' +
          ' Vila Claudionora, Ponta Grossa - PR, 84030-040',
      diasDisponiveis: ['30/08/2021', '01/09/2021', '02/098/2021'],
    ),
    PostoDeSaude(
      nome: 'Unidade de Saúde Antonio Saliba',
      endereco: 'R. Siqueira Campos, 753 - Parque Sabiá, ' +
          'Ponta Grossa - PR, 84031-030',
      diasDisponiveis: ['28/08/2021', '29/08/2021', '30/08/2021'],
    ),
    PostoDeSaude(
      nome: 'Unidade de Saúde Madre Josefa',
      endereco: 'R. Bituruna - Coronel Cláudio, Ponta Grossa - PR, 84025-490',
      diasDisponiveis: ['25/08/2021', '27/08/2021', '30/08/2021'],
    )
  ];

  static PostoDeSaude? findPosto(String nome) {
    for (var posto in postos) {
      if (posto.nome == nome) return posto;
    }
  }
}
