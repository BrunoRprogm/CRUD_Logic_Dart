import 'dart:io';

void main() {
  String? nome;
  int? idade;

  print('Digite seu nome:');
  nome = stdin.readLineSync();

  print('Digite sua idade:');
  String? idadeInput = stdin.readLineSync();
  if (idadeInput != null) {
    idade = int.tryParse(idadeInput);
  }

  if (nome != null && idade != null) {
    print('Olá, $nome! Você tem $idade anos.');
  } else {
    print('Nome ou idade inválidos.');
  }
}
