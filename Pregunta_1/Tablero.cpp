#include<iostream>
#include "Tablero.h"
using namespace std;

void Tablero::moverNorte(int n){
    y += n;
}

void Tablero::moverSur(int n){
    y -= n;
}

void Tablero::moverEste(int n){
    x += n;
}

void Tablero::moverOeste(int n){
    x -= n;
}

int Tablero::getX(){
    return x;
}

int Tablero::getY(){
    return y;
}