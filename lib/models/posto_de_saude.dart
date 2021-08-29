class PostoDeSaude {
  String nome;
  String endereco;
  double latitude;
  double longitude;
  Map<String, dynamic> diasDisponiveis;

  PostoDeSaude({
    required this.nome,
    required this.endereco,
    required this.diasDisponiveis,
    required this.latitude,
    required this.longitude
  });
}
