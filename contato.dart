class Contato {
  String _nome;
  String _telefone;
  String email;

  Contato(this._nome, this._telefone, this.email);

  getNome() {
    return _nome;
  }

  getTelefone() {
    return _telefone;
  }

  getEmail() {
    return email;
  }

  setNome(String nome) {
    this._nome = nome;
  }

  setTelefone(String telefone) {
    this._telefone = telefone;
  }

  setEmail(String email) {
    this.email = email;
  }

  contatoToString() {
    return 'Nome: $_nome, Telefone: $_telefone, Email: $email';
  }
}
