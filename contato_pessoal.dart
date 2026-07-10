import 'contato.dart'; // Add this import if Contato is in a separate file

class ContatoPessoal extends Contato {
  String apelido;

  ContatoPessoal(String nome, String telefone, String email, this.apelido)
    : super(nome, telefone, email);
}
