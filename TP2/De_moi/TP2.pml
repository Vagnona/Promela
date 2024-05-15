mtype = {nack, ack, err, next, accept}

proctype transfer (chan inc, out, chin, chout)
{
    
    byte i;
    byte o;

    inc ? next(o);

    do        
    :: chin?err(i)  ->  chout!nack(o);
    :: chin?nack(i) -> chout!ack(o);
    :: chin?ack(i)  -> atomic {
                inc?next(o);
                chout!ack(o);
                }
                if
                    ::(len(inc) == 0) -> break
                    :: else -> skip
                fi
    od

}

init 
{
    byte i;
    byte o;

    chan AtoB  = [2] of {byte, byte};
    chan BtoA  = [2] of {byte, byte};
    chan AtoUp = [2] of {byte, byte};
    chan BtoUp = [2] of {byte, byte};
    chan UptoA = [2] of {byte, byte};
    chan UptoB = [2] of {byte, byte};

    run transfer(UptoA, AtoUp, BtoA, AtoB);
    run transfer(UptoB, BtoUp, AtoB, BtoA);
    BtoA!err(0);    

    UptoA ! next(1);
    UptoA ! next(2);
    UptoB ! next(3);
    UptoB ! next(4);
    
}
