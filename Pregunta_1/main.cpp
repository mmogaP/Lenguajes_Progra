#include <iostream>
#include "Tablero.h"
using namespace std;

int main(int argc, char** argv){
    Tablero* ob1;
    int x,y;

    cout<<"Digite la posicion inicial del objeto: "<<endl;
    cout<<"Posición X: "; cin>>x;
    cout<<"Posicion Y: "; cin>>y;

    ob1 = new Tablero(x,y);

    do{
        cout<<"\n\t.:MENU:."<<endl;
        cout<<"1. Mover Norte"<<endl;
        cout<<"2. Mover Sur"<<endl;
        cout<<"3. Mover Este"<<endl;
        cout<<"4. Mover Oeste"<<endl;
        cout<<"5. Salir"<<endl;
    }
    return 0;
}