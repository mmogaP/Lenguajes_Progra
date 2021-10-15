#include <iostream>
#include "Tablero.h"
using namespace std;

int main(int argc, char** argv){
    Tablero* ob1;
    int x,y, opcion, n;

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
        cout<<"Digite una opción: "<<endl;
        cin>>opcion;

        if(opcion >=1 && opcion <= 4){
            cout<<"Digite cuantas posiciones desea mover: ";
            cin>>n;
        }

        switch(opcion){
            case 1: ob1->moverNorte(n); break;
            case 2: ob1->moverSur(n); break;
            case 3: ob1->moverEste(n); break;
            case 4: ob1->moverOeste(n); break;
            case 5: break;
            default: cout<<"\nSe equivoco de opcion de menu"<<endl;
        }

        cout<<"Posicion actual (X,Y): ("<<ob1->getX()<<","<<ob1->getY()<<")"<<endl;

    }while(opcion != 5);

    return 0;
}