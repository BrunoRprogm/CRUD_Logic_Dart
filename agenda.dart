import 'dart:io';

import 'contato.dart';
import 'contato_empresarial.dart';
import 'contato_pessoal.dart';

class Agenda {
  Contato contatoPessoal = ContatoPessoal(
    'Bruno',
    '1234567890 ',
    'bruno@dominio.com',
    'Zé Mané',
  );
  Contato contatoEmpresarial = ContatoEmpresarial(
    'Empresa LTDA',
    '1234567890 ',
    'contato@empresa.com',
    'Empresa LTDA',
  );

  List<Contato> contatos = [];
  List<String> Historico = [];

  String telefonePattern = r'^\(?\d{2}\)?[\s-]?[\s9]?\d{4}-?\d{4}$';
  String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  String nomePattern = r'^[a-zA-ZÀ-ÿ\s]+$';

  // Construtor da minha classe contatos
  Agenda(this.contatos);

  void Cadastrar( Contato cadastroContato) {
    print('Deseja cadastrar um contato pessoal ou empresarial? (Digite "p" para pessoal ou "e" para empresarial)');
    String tipo = stdin.readLineSync() ?? '';

    Contato contato; //
    if (tipo == 'p') {
    contato = ContatoPessoal('', '', '', '');
    print('Digite seu nome:');
    contatoPessoal.nome = stdin.readLineSync() ?? '';

    while (contato.nome.isEmpty || RegExp(r'^\s*$').hasMatch(contato.nome)) {
      print('⚠ Não pode ficar vazio. Por favor, digite novamente:');
      contato.nome = stdin.readLineSync() ?? '';
      Historico.add('Adicinou: ${contato.nome}');

      if (contato.nome.isEmpty ||  RegExp(r'^\s*$').hasMatch(contato.nome)) {
        print('⚠ Não pode ficar vazio. Por favor, digite novamente:');
      } else if (!RegExp(nomePattern).hasMatch(contato.nome)) {
        print(
          '⚠ Nome inválido. Use apenas letras e espaços. Digite novamente:',
        );
        contato.nome = stdin.readLineSync() ?? '';
      }
    }
    //Contains serve para comparar se o nome digitado já existe na lista.
    //Que porra é essa da linha abaixo? Questionar o professor
    while (contatos.any((c) => c.nome == contato.nome)) {
      print('Já existe um contato com esse nome. Digite novamente:');
      contato.nome = stdin.readLineSync() ?? '';
    }

    contatos.add(contato);
    print('Nome cadastrado com sucesso: ${contato.nome}');
    Historico.add('Adicionou: ${contato.nome}');

    print('\n');
    print('Digite seu telefone:');
    contato.telefone = stdin.readLineSync() ?? '';

    while (contato.telefone.isEmpty || !RegExp(telefonePattern).hasMatch(contato.telefone)) {
      print(
        '⚠ telefone inválido. Digite 10 ou 11 números. Exemplo: (11) 91234-5678, digite novamente:',
      );
      contato.telefone = stdin.readLineSync() ?? '';
    }
    print('telefone cadastrado com sucesso: ${contato.telefone}');
    Historico.add('Adicionou: ${contato.telefone}');

    print('\n');
    print('Digite seu email:');
    contato.email = stdin.readLineSync() ?? '';

    while (contato.email.isEmpty ||
        !RegExp(emailPattern).hasMatch(contato.email)) {
      print(
        '⚠ E-mail inválido. Use o formato nome@dominio.com, digite novamente:',
      );
      contato.email = stdin.readLineSync() ?? '';
    }
    print('email cadastrado com sucesso: ${contato.email}');
    Historico.add('Adicionou: ${contato.email}');

    print('\n');
    print('✓ Contato adicionado.');


// || Aqui estou defindo se o contato salvo será empresarial ou pessoal


    } else if (tipo == 'e') {
      contato = ContatoEmpresarial('', '', '', '');

  
    print('Digite seu nome:');
    contatoPessoal.nome = stdin.readLineSync() ?? '';

    while (contato.nome.isEmpty || RegExp(r'^\s*$').hasMatch(contato.nome)) {
      print('⚠ Não pode ficar vazio. Por favor, digite novamente:');
      contato.nome = stdin.readLineSync() ?? '';
      Historico.add('Adicinou: ${contato.nome}');

      if (contato.nome.isEmpty ||  RegExp(r'^\s*$').hasMatch(contato.nome)) {
        print('⚠ Não pode ficar vazio. Por favor, digite novamente:');
      } else if (!RegExp(nomePattern).hasMatch(contato.nome)) {
        print(
          '⚠ Nome inválido. Use apenas letras e espaços. Digite novamente:',
        );
        contato.nome = stdin.readLineSync() ?? '';
      }
    }
    //Contains serve para comparar se o nome digitado já existe na lista.
    //Que porra é essa da linha abaixo? Questionar o professor
    while (contatos.any((c) => c.nome == contato.nome)) {
      print('Já existe um contato com esse nome. Digite novamente:');
      contato.nome = stdin.readLineSync() ?? '';
    }

    contatos.add(contato);
    print('Nome cadastrado com sucesso: ${contato.nome}');
    Historico.add('Adicionou: ${contato.nome}');

    print('\n');
    print('Digite seu telefone:');
    contato.telefone = stdin.readLineSync() ?? '';

    while (contato.telefone.isEmpty || !RegExp(telefonePattern).hasMatch(contato.telefone)) {
      print(
        '⚠ telefone inválido. Digite 10 ou 11 números. Exemplo: (11) 91234-5678, digite novamente:',
      );
      contato.telefone = stdin.readLineSync() ?? '';
    }
    print('telefone cadastrado com sucesso: ${contato.telefone}');
    Historico.add('Adicionou: ${contato.telefone}');

    print('\n');
    print('Digite seu email:');
    contato.email = stdin.readLineSync() ?? '';

    while (contato.email.isEmpty ||
        !RegExp(emailPattern).hasMatch(contato.email)) {
      print(
        '⚠ E-mail inválido. Use o formato nome@dominio.com, digite novamente:',
      );
      contato.email = stdin.readLineSync() ?? '';
    }
    print('email cadastrado com sucesso: ${contato.email}');
    Historico.add('Adicionou: ${contato.email}');

    print('\n');
    print('✓ Contato adicionado.');


    } else {
      print('Opção inválida.');
      return;
    }
  
 
  }

  //Feito
  void Listar() {
    if (contatos.isEmpty) {
      print('Nenhum contato cadastrado.');
      return;
    }
    //Se o nome  não estiver vazio será imprimido a lista para o usuário.
    if (contatos.isNotEmpty) print('Lista de Nomes:');
    print('\n');
  

//Revisar (Bruno)
  print('Contatos pessoais:');
  for (var i = 0; i < contatos.length; i++) {
    final contato = contatos[i]; //Questionar o professor 
    if (contato is ContatoPessoal) {
      print('${i + 1}. Nome: ${contato.nome}, telefone: ${contato.telefone}, email: ${contato.email}, Apelido: ${contato.apelido}');
    }
  }
//Revisar (Bruno)
  print('\nContatos empresariais:');
  for (var i = 0; i < contatos.length; i++) {
    final contato = contatos[i];
    if (contato is ContatoEmpresarial) {
      print('${i + 1}. Nome: ${contato.nome}, telefone: ${contato.telefone}, email: ${contato.email}, Empresa: ${contato.empresa}');
    }
  }
    //Listar número de contatos

    print('Total de contatos: ${contatos.length}');
    print(
      'Com e-mails preenchidos: ${contatos.where((contato) => contato.email.isNotEmpty).length}',
    );

    //Pedir para o professor explicar quando der sobre o reduce.
    print(
      'Nome mais longo: ${contatos.length > 0 ? contatos.reduce((maior, menor) => maior.().length > menor.().length ? maior : menor).() : '⚠ Lista vazia, cadastre algum contato.'}',
    );
    // Ela verifica se a lista de nomes não está vazia. Se não estiver,
    // ela usa o método reduce para comparar o comprimento de cada nome na lista e retorna o nome mais longo.
    // Se a lista estiver vazia, ela retorna 'Lista vazia'.
    print('\n');
  }

  //Feito
  void editar() {
    if (contatos.isEmpty) {
      print('\n');
      print('Nenhum contato cadastrado.');
      return;
    }

    print('Lista de Nomes:');
    for (var i = 0; i < contatos.length; i++) {
      print(
        '${i + 1}.Nome:${contatos[i].nome},telefone:${contatos[i].telefone},email:${contatos[i].email}\n',
      );
    }
    print('Qual contato deseja editar? (Digite o número correspondente)');
    int contatoIndex = (int.tryParse(stdin.readLineSync() ?? '0') ?? 0) - 1;
    // "(int.tryParse(stdin.readLineSync() ?? '0') ?? 0)" serve para tentar convertera entrada do usuário para um número
    // caso o usuário não digite nada, eu forço a conversão para 0, e caso o usuário digite algo que não seja um número,
    // eu forço a conversão para 0 também.
    if (contatoIndex < 0 || contatoIndex >= contatos.length) {
      print('\n');
      print('Contato inválido.');
      print('\n');
      return;
    } else {
      print('Digite o novo nome:');
      contatos[contatoIndex].nome = stdin.readLineSync() ?? '';
      print('Digite o novo telefone:');
      contatos[contatoIndex].telefone = stdin.readLineSync() ?? '';
      print('Digite o novo email:');
      contatos[contatoIndex].email = stdin.readLineSync() ?? '';

      print(
        'Novo contato: Nome: ${contatos[contatoIndex]}, \ntelefone: ${contatos[contatoIndex].telefone}, \n email: ${contatos[contatoIndex].email}',
      );
      print('✓ Atualizado.');
    }
  }

  //feito
  void Remover() {
    if (contatos.isEmpty) {
      print('\n');
      print('Nenhum contato cadastrado.');
      return;
    }
    print('\n');
    print('Lista de Nomes:');
    print('\n');
    for (var i = 0; i < contatos.length; i++) {
      print(
        '${i + 1}.Nome:${contatos[i]},telefone:${contatos[i].telefone},email:${contatos[i].email}\n',
      );
    }
    print('Qual contato deseja remover? (Digite o número correspondente)');
    int contatoIndex = (int.tryParse(stdin.readLineSync() ?? '0') ?? 0) - 1;

    if (contatoIndex < 0 || contatoIndex >= contatos.length) {
      print('\n');
      print('Contato inválido.');
      print('\n');
      return;
    }

    if (contatoIndex >= 0 && contatoIndex < contatos.length) {
      print(
        'Remover ? (s/n) -> Nome: ${contatos[contatoIndex].()},  telefone: ${contatos[contatoIndex].telefone()}, email: ${contatos[contatoIndex].email()}? (S/N)',
      );
      String confirmacao = stdin.readLineSync() ?? '';
      if (confirmacao.toLowerCase() == 's') {
        contatos.removeAt(contatoIndex);
        print('✓ Contato removido.');
      } else {
        print('Remoção cancelada.');
      }
    } else {
      contatos.removeAt(
        contatoIndex,
      ); // RemoveAt serve para remover o elemento do array
      print('✓ Contato removido.');
    }
    ; //e o contatoIndex é o índice do contato que o usuário deseja remover.

    Historico.add('Removeu: ${contatos[contatoIndex].()}');
    print('✓ Contato removido.');
  }

  void BuscarPorNome() {
    if (contatos.isEmpty) {
      print('\n');
      print('Nenhum contato cadastrado.');
      return;
    }
    print('\n');
    print('Digite o nome que deseja buscar:');
    String nomeBusca = stdin.readLineSync() ?? '';

    List<int> indicesEncontrados = [];
    for (var i = 0; i < contatos.length; i++) {
      if (contatos[i].().toLowerCase().contains(
        nomeBusca.toLowerCase(),
      )) {
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
          'Nome: ${contatos[index].()}, telefone: ${contatos[index].telefone()}, email: ${contatos[index].email()}',
        );
      }
    }
  }

  void FinalizarPrograma() {
    print('Saindo do programa...');
  }
}
