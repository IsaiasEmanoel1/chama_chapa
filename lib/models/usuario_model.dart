class Usuario {
  final String id;
  final String nome;
  final String email;
  final String tipo; // 'chapa' ou 'empregador'
  final String documento; // CPF ou CNPJ

  Usuario({
    required this.id,
    required this.nome,
    required this.email,
    required this.tipo,
    required this.documento,
  });

  // Isso aqui transforma os dados do Firebase em um objeto que o Flutter entende
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'tipo': tipo,
      'documento': documento,
    };
  }
}