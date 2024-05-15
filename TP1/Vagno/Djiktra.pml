#define p 0
#define v 1

chan sema = [0] of {bit};
int count = 0;


proctype dijkstra()
{
    do
    :: sema!p -> sema?v;
    od
}

proctype user()
{
    do
    :: sema?p -> skip;

    /* critical section */
    count = count + 1;

    count = count - 1;
    sema!v;
    skip;
    /* non critical section */
    od
}

proctype monitor()
{
    assert(count <= 1 || count >= 0)
}

init{
    atomic { 
        run dijkstra();
        run user();
        run user();
        run user();
        run monitor()
    } 
}