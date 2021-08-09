class PostoDeSaude {
  String nome;
  String endereco;
  Map<String, dynamic> diasDisponiveis;

  PostoDeSaude({
    required this.nome,
    required this.endereco,
    required this.diasDisponiveis,
  });

  cancelaAgendamento(String data) {
    diasDisponiveis.update(data, (value) => ++value);
  }
}
