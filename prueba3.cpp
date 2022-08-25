#include <iostream>
 
using namespace std;
 
int main()
{
    int varA, varB;
    int numEntero = -3;
    double num_real1 = 1.1;
    double num_real2 = -3.5;
    double respuesta = ((num_real1 + num_real2) / (numEntero - num_real1)) * 1;
    bool correcto = true;
    bool incorrecto = false;
    double inputUsuario;
    bool inputUsuario2, inputUsuario3;
    char inputUsuario4;
    string stringResultado = "Resultado de respuesta (0 es malo, 1 es bueno): ";
    
    

    cout << "Cuantos valores enteros desea ingresar?" << endl;
    cin >> varB;
 
    // Imprime si es positivo, negativo o igual a 0
    for(int i = 0; i < varB; i = i + 1){
        cin >> varA;
        if(varA > 0){
            cout << "El valor ingresado es positivo" << endl;
        }
        else if(varA == 0){
            cout << "El valor ingresado es igual a 0" << endl;
        }
        else{
            cout << "El valor ingresado es negativo" << endl;
        }
    }

    cout << endl;

    cout << "Escribe la respuesta de la siguiente operacion: " << endl;
    cout << "(( " << num_real1 << " + " << num_real2 << " ) / ( " << numEntero << " - " << num_real1 << " )) * 1"<< endl;
    cin >> inputUsuario;

    if(inputUsuario != respuesta){
        cout << stringResultado << incorrecto << endl;
        cout << "La respuesta correcta era: " << respuesta << endl;
    }
    else{
        cout << stringResultado << correcto << endl;
    }

    cout << endl;

    cout << "Escribe el resultado de la siguiente operacion: " << endl;
    cout << "!true " << endl;
    cin >> inputUsuario2;
    if(inputUsuario2 == (!true)){
        cout << "Correcto!" << endl;
    }
    else{
        cout << "Incorrecto!, la respuesta era: " << !true << endl;
    }

    cout << endl;

    cout << "Escribe el resultado de la siguiente operacion: " << endl;
    cout << "(true || true) && false " << endl;
    cin >> inputUsuario3;
    if(inputUsuario3 == ((true || true) && false)){
        cout << "Correcto!" << endl;
    }
    else{
        cout << "Incorrecto!, la respuesta era: " << ((true || true) && false) << endl;
    }

    cout << endl;

    cout << "Escribe un char como input: " << endl;
    cin >> inputUsuario4;

    cout << "De acuero, se termino el programa!" << endl;

    
    return 0;
}
 
