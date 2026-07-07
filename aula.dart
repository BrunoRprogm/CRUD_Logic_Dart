void main() {
  dizerOla();
  dizerOlapara('Alice');
  int resultado = somar(5, 3);
  print('O resultado da soma é: $resultado');
  double media = calcularMedia(8.5, 9.0);
  print('A média é: $media');
}

//metodo que nada retornar void.
void dizerOla() {
  print('Olá, mundooo!');
}

//metodo com parametro
void dizerOlapara(String nome) {
  print('Olá, $nome!');
}

//metodo com parâmetro e retorno
int somar(int a, int b) {
  return a + b;
}

//metodo com parâmetro opcional
//se quissemos que eles fossem obrigatórios, poderíamos usar o operador "required" antes do tipo do parâmetro.
double calcularMedia(double? nota1, double? nota2) {
  if (nota1 == null || nota2 == null) {
    throw ArgumentError('As notas não podem ser nulas.');
  }
  return (nota1 + nota2) / 2;
}
