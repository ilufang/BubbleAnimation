int[] arr = new int [30];
int iter = 0;
int max = 30;
void setup()
{
  size(30*20,300);
  for(int i = 0; i!= 30; i++)
  {
    arr[i]=(int)random(0,300);
  }
}

void drawNums()
{
  background(255);
  fill(128);
  for (int i = 0; i != 30; i++)
  {
    rect(i*20,0,20,arr[i]);
  }
}

void sort_next()
{
  if (max==1)
  {
    return;
  }
  if(iter==max-1)
  {
    iter=0;
    max--;
  }
  if(arr[iter]>arr[iter+1])
  {
    // swap
    int temp = arr[iter];
    arr[iter]=arr[iter+1];
    arr[iter+1] = temp;
  }
  iter++;
}

void draw()
{
  drawNums();
  sort_next();
}
