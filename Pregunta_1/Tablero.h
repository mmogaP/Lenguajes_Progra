#include<iostream>
using namespace std;
class Tablero{
    private:
        int x,y;
    
    public:
        Tablero(int x, int y){
            this->x = x;
            this->y = y;
        }

        void moverNorte(int);
        void moverSur(int);
        void moverOeste(int);
        void moverEste(int);
        int getX();
        int getY();

}; // namespace std
