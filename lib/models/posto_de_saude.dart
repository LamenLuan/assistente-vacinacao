class PostoDeSaude {
  String nome;
  String endereco;
  List<String> diasDisponiveis;
  List<String> horarios = [
    'Manhã - 8h ~ 12h',
    'Tarde - 12h ~ 16h',
    'Noite - 16h ~ 20h',
  ];

  List<String>? get horariosAgendamento {
    return horarios;
  }

  PostoDeSaude({
    required this.nome,
    required this.endereco,
    required this.diasDisponiveis,
  });
}
