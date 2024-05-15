int count = 0;

proctype A(int n)
{
    do
        :: (count == n) -> break;
        :: (count != n) -> count = count + 1;
    printf("\n%u\n\n", count)
    od
}

init{
    run A(10)
}