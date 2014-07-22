int[] arr = new int [30];
int min = 0;
int iter = 28; // Begin from bottom

void setup()
{
	size(305,30*20+5); // Make sure borders are visible
	for(int i = 0; i!= 30; i++)
	{
		arr[i]=(int)random(0,300);
	}
}

void drawNums()
{
	background(255);
	fill(192);
	for (int i = 0; i != 30; i++)
	{
		rect(0,i*20,arr[i],20);
	}
	if (min != 29){
		// Highlight the swaping items
		fill(#66ccff);
		rect(0,iter*20,arr[iter],20);
		rect(0,iter*20+20,arr[iter+1],20);
	}
}

void sort_next()
{
	if (min==29)
	{
		// Sorting finished, do nothing
		return;
	}
	if(iter==min-1)
	{
		min++;
		iter=29;
	}
	if(arr[iter]>arr[iter+1])
	{
		// swap
		int temp = arr[iter];
		arr[iter]=arr[iter+1];
		arr[iter+1] = temp;
	}
	iter--;
	// Make it really look like a bubble going up
}

void draw()
{
	drawNums();
	sort_next();
}
