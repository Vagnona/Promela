#define total_N 10

int x = 0

int N = 10;
int tour = 1;
int nombre_joueur = 3;
int v = 0;
int total_all_retire = 0;

proctype monitor()
    {
        (x == 0)
        assert((total_all_retire + N) == total_N);

        if
        :: (v == 1) -> assert(N == 0);
        :: (v != 1) -> skip;
        fi
        
    }

proctype joueur(int id)
{
    int all_retire = 0;

    do
        ::
        if
            ::((N - 1) > 0) -> all_retire = 1;
            ::((N - 2) > 0) -> all_retire = 2;
            ::((N - 3) > 0) -> all_retire = 3;
        fi;


        (tour == id);

        if
            :: (v == 1) -> tour = (tour + 1) % nombre_joueur;
            break;

            :: (v != 1) -> skip
        fi

        x = 1;
        total_all_retire = all_retire + total_all_retire;
        N = N - all_retire;
        x = 0;

        if
            :: (N <= 0) -> v = 1;
                tour = (tour + 1) % nombre_joueur;
                printf("%d a gagné\n", id);
                goto victoire;

            :: (N > 0) -> tour = (tour + 1) % nombre_joueur
        fi;
    od;

    if
        :: (v == 1) -> printf("%d a perdu\n", id);
    fi;

    victoire : skip;
}

init
{
    run joueur(0);
    run joueur(1);
    run joueur(2);
    run monitor();
}