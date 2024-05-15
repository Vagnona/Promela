#define true 1
#define false 0
#define Aturn false
#define Bturn true

bool x, y, t;
int test;

proctype A()
{ 
	x = true;
	t = Bturn;
	(y == false || t == Aturn);
	test = test + 1;
	/* critical section */
	test = test - 1;
	x = false;
}

proctype B()
{ 
	y = true;
	t = Aturn;
	(x == false || t == Bturn);
	test = test + 1;
	/* critical section */
	test = test - 1;
	y = false;
}

proctype monitor()
{
	assert(test == 1 || test == 0)
}

init {
	test = 0;
	run A(); 
	run B();
	run monitor()
	}