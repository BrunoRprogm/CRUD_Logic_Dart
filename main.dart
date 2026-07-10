import 'dart:io';

import 'agenda.dart';
import 'contato.dart';

Agenda agenda = Agenda([]);

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
        agenda.Cadastrar();
        break;
      case 2:
        agenda.Listar();
        break;
      case 3:
        agenda.editar();
        break;
      case 4:
        agenda.Remover();
        break;
      case 5:
        agenda.BuscarPorNome();
        break;
      case 6:
        agenda.FinalizarPrograma();
        return;
      default:
        print('Opção inválida. Por favor, tente novamente.');
    }
  }
}

//
