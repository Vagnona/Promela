#define CREATE 1
#define CREATED 2

#define ARITE_ARBRE 3
#define NBR_ARBRE 7

chan pere[NBR_ARBRE] = [2] of {int};
int canal = 0;

proctype noeud(int id)
{
    int message;
    int id_fils1;
    int id_fils2;
    int feuille_cree = 0;
    
    pere[id] ? message;

    (message == CREATE);

    run noeud(canal);
    id_fils1 = canal;
    canal = canal + 1;

    run noeud(canal);
    id_fils2 = canal;
    canal = canal + 1;

    pere[id_fils1] ? message;
    (message == CREATED);
    feuille_cree = feuille_cree + 1;
    printf("%d feuille a été cree", feuille_cree);

    pere[id_fils2] ? message;
    (message == CREATED);
    feuille_cree = feuille_cree + 1;
    printf("%d feuille a été cree", feuille_cree);

    done : skip;
}

init
{

    run noeud(canal);
    canal = canal + 1;

    run noeud(canal);
    canal = canal + 1;

    pere[0] ! CREATE;
    pere[1] ! CREATE;
}