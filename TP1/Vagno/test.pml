int N = 10;

inline int all() 
{
    if
        :: return 1;
        :: return 2;
        :: return 3;
    fi;
}

proctype joueur(int id)
{
    printf("test = %d\n", all());
}

init
{
    run joueur(1);
    run joueur(2);
    run joueur(3);
}
