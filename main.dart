import 'dart:io';

List<String> nome = [];
List<String> telefone = [];
List<String> email = [];
List<String> Historico = [];

// List<Contato> contatos = [];

// class Contato {
//   String nome;
//   String telefone;
//   String email;

//   Contato(this.nome, this.telefone, this.email);

//   fromMap(Map<String, dynamic> map) {
//     nome = map['nome'] ?? '';
//     telefone = map['telefone'] ?? '';
//     email = map['email'] ?? '';
//   }

//   setName(String novoNome) {
//     nome = novoNome;
//   }

//   toMap() {
//     return {'nome': nome, 'telefone': telefone, 'email': email};
//   }
// }

String nomeDigitado = '';
String telefoneDigitado = '';
String emailDigitado = '';

String telefonePattern = r'^\(?\d{2}\)?[\s-]?[\s9]?\d{4}-?\d{4}$';
String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
String nomePattern = r'^[a-zA-ZÀ-ÿ\s]+$';

int opcao = 0;

void main() {
  while (true) {
    print('''=== AGENDA ===
1-Adicionar  2-Listar  3-Editar  4-Remover  5-Buscar Por Nome  6-Sair
-> ''');

    opcao = int.parse(stdin.readLineSync() ?? '0');
    // Opcao que o usuário escolhe, após a esoclha eu forço a conversão para int,
    // caso o usuário não digite nada, eu forço a conversão para 0.

    switch (opcao) {
      case 1:
        Cadastrar();
        break;
      case 2:
        Listar();
        break;
      case 3:
        editar();
        break;
      case 4:
        Remover();
        break;
      case 5:
        BuscarPorNome();
        break;
      case 6:
        FinalizarPrograma();
        return;
      default:
        print('Opção inválida. Por favor, tente novamente.');
    }
  }
}

//Feito
void Cadastrar() {
  print('Digite seu nome:');
  nomeDigitado = stdin.readLineSync() ?? '';

  while (nomeDigitado.isEmpty || nomeDigitado.trim().isEmpty) {
    print('⚠ Não pode ficar vazio. Por favor, digite novamente:');
    nomeDigitado = stdin.readLineSync() ?? '';
    Historico.add('Adicinou: $nomeDigitado');

    if (nomeDigitado.isEmpty || RegExp(r'^\s*$').hasMatch(nomeDigitado)) {
      print('⚠ Não pode ficar vazio. Por favor, digite novamente:');
    } else if (!RegExp(nomePattern).hasMatch(nomeDigitado)) {
      print('⚠ Nome inválido. Use apenas letras e espaços. Digite novamente:');
      nomeDigitado = stdin.readLineSync() ?? '';
    }
  }
  //Contains serve para comparar se o nome digitado já existe na lista.

  while (nome.contains(nomeDigitado)) {
    print('Já existe um contato com esse nome. Digite novamente:');
    nomeDigitado = stdin.readLineSync() ?? '';
  }

  nome.add(nomeDigitado);
  print('Nome cadastrado com sucesso: ${nome[nome.length - 1]}');
  Historico.add('Adicionou: $nomeDigitado');

  print('\n');
  print('Digite seu telefone:');
  telefoneDigitado = stdin.readLineSync() ?? '';

  while (telefoneDigitado.isEmpty ||
      !RegExp(telefonePattern).hasMatch(telefoneDigitado)) {
    print(
      '⚠ Telefone inválido. Digite 10 ou 11 números. Exemplo: (11) 91234-5678, digite novamente:',
    );
    telefoneDigitado = stdin.readLineSync() ?? '';
  }
  telefone.add(telefoneDigitado);
  print('Telefone cadastrado com sucesso: ${telefone[telefone.length - 1]}');
  Historico.add('Adicionou: $telefoneDigitado');

  print('\n');
  print('Digite seu email:');
  emailDigitado = stdin.readLineSync() ?? '';

  while (emailDigitado.isEmpty ||
      !RegExp(emailPattern).hasMatch(emailDigitado)) {
    print(
      '⚠ E-mail inválido. Use o formato nome@dominio.com, digite novamente:',
    );
    emailDigitado = stdin.readLineSync() ?? '';
  }
  email.add(emailDigitado);
  print('Email cadastrado com sucesso: ${email[email.length - 1]}');
  Historico.add('Adicionou: $emailDigitado');

  print('\n');
  print('✓ Contato adicionado.');
}

//Feito
void Listar() {
  if (nome.isEmpty) {}

  //Se o nome  não estiver vazio será imprimido a lista para o usuário.
  if (nome.isNotEmpty) print('Lista de Nomes:');
  print('\n');
  for (var i = 0; i < nome.length; i++) {
    print(
      '${i + 1}. Nome: ${nome[i]}, Telefone: ${telefone[i]}, Email: ${email[i]}',
    );
    print('\n');
  }
  //Listar número de contatos

  print('Total de contatos: ${nome.length}');
  print('Com e-mails preenchidos: ${email.length}');

  //Pedir para o professor explicar quando der sobre o reduce.
  print(
    'Nome mais longo: ${nome.length > 0 ? nome.reduce((maior, menor) => maior.length > menor.length ? maior : menor) : '⚠ Lista vazia, cadastre algum contato.'}',
  );
  // Ela verifica se a lista de nomes não está vazia. Se não estiver,
  // ela usa o método reduce para comparar o comprimento de cada nome na lista e retorna o nome mais longo.
  // Se a lista estiver vazia, ela retorna 'Lista vazia'.
  print('\n');
}

//Feito
void editar() {
  if (nome.isEmpty) {
    print('\n');
    print('Nenhum contato cadastrado.');
    return;
  }

  print('Lista de Nomes:');
  for (var i = 0; i < nome.length; i++) {
    print(
      '${i + 1}.Nome:${nome[i]},Telefone:${telefone[i]},Email:${email[i]}\n',
    );
  }
  print('Qual contato deseja editar? (Digite o número correspondente)');
  int contatoIndex = (int.tryParse(stdin.readLineSync() ?? '0') ?? 0) - 1;
  // "(int.tryParse(stdin.readLineSync() ?? '0') ?? 0)" serve para tentar convertera entrada do usuário para um número
  // caso o usuário não digite nada, eu forço a conversão para 0, e caso o usuário digite algo que não seja um número,
  // eu forço a conversão para 0 também.
  if (contatoIndex < 0 || contatoIndex >= nome.length) {
    print('\n');
    print('Contato inválido.');
    print('\n');
    return;
  } else {
    print('Digite o novo nome:');
    nome[contatoIndex] = stdin.readLineSync() ?? '';
    print('Digite o novo telefone:');
    telefone[contatoIndex] = stdin.readLineSync() ?? '';
    print('Digite o novo email:');
    email[contatoIndex] = stdin.readLineSync() ?? '';

    print(
      'Novo contato: Nome: ${nome[contatoIndex]}, \nTelefone: ${telefone[contatoIndex]}, \nEmail: ${email[contatoIndex]}',
    );
    print('✓ Atualizado.');
  }
}

//feito
void Remover() {
  if (nome.isEmpty) {
    print('\n');
    print('Nenhum contato cadastrado.');
    return;
  }
  print('\n');
  print('Lista de Nomes:');
  print('\n');
  for (var i = 0; i < nome.length; i++) {
    print(
      '${i + 1}.Nome:${nome[i]},Telefone:${telefone[i]},Email:${email[i]}\n',
    );
  }
  print('Qual contato deseja remover? (Digite o número correspondente)');
  int contatoIndex = (int.tryParse(stdin.readLineSync() ?? '0') ?? 0) - 1;

  if (contatoIndex < 0 || contatoIndex >= nome.length) {
    print('\n');
    print('Contato inválido.');
    print('\n');
    return;
  }

  if (contatoIndex >= 0 && contatoIndex < nome.length) {
    print(
      'Remover ? (s/n) -> Nome: ${nome[contatoIndex]},  Telefone: ${telefone[contatoIndex]}, Email: ${email[contatoIndex]}? (S/N)',
    );
    String confirmacao = stdin.readLineSync() ?? '';
    if (confirmacao.toLowerCase() == 's') {
      nome.removeAt(contatoIndex);
      telefone.removeAt(contatoIndex);
      email.removeAt(contatoIndex);
      print('✓ Contato removido.');
    } else {
      print('Remoção cancelada.');
    }
  } else {
    nome.removeAt(
      contatoIndex,
    ); // RemoveAt serve para remover o elemento do array
    telefone.removeAt(
      contatoIndex,
    ); //e o contatoIndex é o índice do contato que o usuário deseja remover.
    email.removeAt(contatoIndex);
    Historico.add('Removeu: ${nome[contatoIndex]}');
    print('✓ Contato removido.');
  }
}

void BuscarPorNome() {
  if (nome.isEmpty) {
    print('\n');
    print('Nenhum contato cadastrado.');
    return;
  }
  print('\n');
  print('Digite o nome que deseja buscar:');
  String nomeBusca = stdin.readLineSync() ?? '';

  List<int> indicesEncontrados = [];
  for (var i = 0; i < nome.length; i++) {
    if (nome[i].toLowerCase().contains(nomeBusca.toLowerCase())) {
      indicesEncontrados.add(i);
    }
  }

  if (indicesEncontrados.isEmpty) {
    print('Nenhum contato encontrado com o nome "$nomeBusca".');
  } else {
    print('Contatos encontrados:');

    // Tive que pesquisar para conseguir imprimir está informação, pois não sabia como fazer isso.
    for (var index in indicesEncontrados) {
      print(
        'Nome: ${nome[index]}, Telefone: ${telefone[index]}, Email: ${email[index]}',
      );
    }
  }
}

void FinalizarPrograma() {
  print('Saindo do programa...');
}
