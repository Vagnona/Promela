
int tab[5] = {1,2,33,4,5};

proctype max_tab()
{
    int i = 1;
    int max = tab[0];

    do
        :: ( i < 5 );
            if
            :: (max < tab[i]); 
                max = tab[i];
                i = i + 1; 
            :: (max >= tab[i]) -> i = i + 1;
            fi
        :: (i >= 5) -> goto done;
    od

    done : printf("max : %u\n", max);
}

init {
    run max_tab();
}
