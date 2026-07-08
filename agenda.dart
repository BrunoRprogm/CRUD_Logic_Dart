import 'dart:io';

import 'contato.dart';

class Agenda {
  Contato contato = Contato('', '', '');

  List<Contato> _contatos = [];
  List<String> Historico = [];

  String telefonePattern = r'^\(?\d{2}\)?[\s-]?[\s9]?\d{4}-?\d{4}$';
  String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  String nomePattern = r'^[a-zA-ZÀ-ÿ\s]+$';

  Agenda(this._contatos);

  void Cadastrar() {
    print('Digite seu nome:');
    contato.setNome(stdin.readLineSync() ?? '');

    while (contato.getNome().isEmpty || contato.getNome().trim().isEmpty) {
      print('⚠ Não pode ficar vazio. Por favor, digite novamente:');
      contato.setNome(stdin.readLineSync() ?? '');
      Historico.add('Adicinou: ${contato.getNome()}');

      if (contato.getNome().isEmpty ||
          RegExp(r'^\s*$').hasMatch(contato.getNome())) {
        print('⚠ Não pode ficar vazio. Por favor, digite novamente:');
      } else if (!RegExp(nomePattern).hasMatch(contato.getNome())) {
        print(
          '⚠ Nome inválido. Use apenas letras e espaços. Digite novamente:',
        );
        contato.setNome(stdin.readLineSync() ?? '');
      }
    }
    //Contains serve para comparar se o nome digitado já existe na lista.

    while (agenda.contatos.contains(contato.getNome())) {
      print('Já existe um contato com esse nome. Digite novamente:');
      contato.setNome(stdin.readLineSync() ?? '');
    }

    Agenda.add(contato);
    print('Nome cadastrado com sucesso: ${contato.getNome()}');
    Historico.add('Adicionou: ${contato.getNome()}');

    print('\n');
    print('Digite seu telefone:');
    contato.setTelefone(stdin.readLineSync() ?? '');

    while (contato.getTelefone().isEmpty ||
        !RegExp(telefonePattern).hasMatch(contato.getTelefone())) {
      print(
        '⚠ Telefone inválido. Digite 10 ou 11 números. Exemplo: (11) 91234-5678, digite novamente:',
      );
      contato.setTelefone(stdin.readLineSync() ?? '');
    }
    print('Telefone cadastrado com sucesso: ${contato.getTelefone()}');
    Historico.add('Adicionou: ${contato.getTelefone()}');

    print('\n');
    print('Digite seu email:');
    contato.setEmail(stdin.readLineSync() ?? '');

    while (contato.getEmail().isEmpty ||
        !RegExp(emailPattern).hasMatch(contato.getEmail())) {
      print(
        '⚠ E-mail inválido. Use o formato nome@dominio.com, digite novamente:',
      );
      contato.setEmail(stdin.readLineSync() ?? '');
    }
    print('Email cadastrado com sucesso: ${contato.getEmail()}');
    Historico.add('Adicionou: ${contato.getEmail()}');

    print('\n');
    print('✓ Contato adicionado.');
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
    for (var i = 0; i < contatos.length; i++) {
      print(
        '${i + 1}. Nome: ${contatos[i].getNome()}, Telefone: ${contatos[i].getTelefone()}, Email: ${contatos[i].getEmail()}',
      );
      print('\n');
    }
    //Listar número de contatos

    print('Total de contatos: ${contatos.length}');
    print(
      'Com e-mails preenchidos: ${contatos.where((contato) => contato.getEmail().isNotEmpty).length}',
    );

    //Pedir para o professor explicar quando der sobre o reduce.
    print(
      'Nome mais longo: ${contatos.length > 0 ? contatos.reduce((maior, menor) => maior.getNome().length > menor.getNome().length ? maior : menor).getNome() : '⚠ Lista vazia, cadastre algum contato.'}',
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
        '${i + 1}.Nome:${contatos[i].getNome()},Telefone:${contatos[i].getTelefone()},Email:${contatos[i].getEmail()}\n',
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
      contatos[contatoIndex].setNome(stdin.readLineSync() ?? '');
      print('Digite o novo telefone:');
      contatos[contatoIndex].setTelefone(stdin.readLineSync() ?? '');
      print('Digite o novo email:');
      contatos[contatoIndex].setEmail(stdin.readLineSync() ?? '');

      print(
        'Novo contato: Nome: ${contatos[contatoIndex].getNome()}, \nTelefone: ${contatos[contatoIndex].getTelefone()}, \nEmail: ${contatos[contatoIndex].getEmail()}',
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
        '${i + 1}.Nome:${contatos[i].getNome()},Telefone:${contatos[i].getTelefone()},Email:${contatos[i].getEmail()}\n',
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
        'Remover ? (s/n) -> Nome: ${contatos[contatoIndex].getNome()},  Telefone: ${contatos[contatoIndex].getTelefone()}, Email: ${contatos[contatoIndex].getEmail()}? (S/N)',
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

    Historico.add('Removeu: ${contatos[contatoIndex].getNome()}');
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
      if (contatos[i].getNome().toLowerCase().contains(
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
          'Nome: ${contatos[index].getNome()}, Telefone: ${contatos[index].getTelefone()}, Email: ${contatos[index].getEmail()}',
        );
      }
    }
  }

  void FinalizarPrograma() {
    print('Saindo do programa...');
  }
}
