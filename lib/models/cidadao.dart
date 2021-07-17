class Cidadao {
  String cpf, senha, nome, telefone;
  String? email;
  DateTime dataNascimento;
  bool isMasculino, comorbidade;

  Cidadao({
    required this.cpf,
    required this.senha,
    required this.nome,
    required this.dataNascimento,
    required this.isMasculino,
    required this.comorbidade,
    required this.telefone,
    this.email
  });
}