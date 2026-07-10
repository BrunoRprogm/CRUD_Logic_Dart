import 'contato.dart'; // Add this import if Contato is in a separate file

class ContatoEmpresarial extends Contato {
  String empresa;

  ContatoEmpresarial(String nome, String telefone, String email, this.empresa) : super(nome, telefone, email);
 
}