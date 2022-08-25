#include <iostream>
using namespace std;

int main() {

  int num_1, num_2, suma;
    
  cout << "Ingresa dos numeros: ";
  cin >> num_1 >> num_2;

  // Se guarda la suma en la variable "suma"
  suma = num_1 + num_2;

  // Se imprime el resultado
  cout << num_1 << " + " <<  num_2 << " = " << suma;     

  return 0;
}