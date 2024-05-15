#include "mtype.h"

byte n = 8;  /* nombre de bits */
byte rand_num;  /* nombre aléatoire généré */

proctype generateur()
{
    do
    :: true -> 
        rand_num = 0;
        byte i = 0;
        do
            :: (i < n) ->
                rand_num = rand_num | (1 << i) * (nondet(2)-1);
                i = i + 1;
            :: else -> break;
        od;
        printf("Nombre aléatoire: %u\n", rand_num);
    od
}

init
{
    run generateur();
}
