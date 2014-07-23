int[] arr = new int [30];
int min = 0;
int iter = 28; // Begin from bottom
boolean running = true;


// consts
int BS_NORMAL =	0,
	BS_HOVER =	1,
	BS_PRESS =	2;

int button_alpha[] =	{128, 255, 192};

// Class decl.
class Button
{
	String Text;
	int state;
	int x, y, w, h;
	color tint;
	Button()
	{}
	Button(String title, int x_pos, int y_pos, int width, int height, color tintColor)
	{
		Text = title;
		state = BS_NORMAL;
		x = x_pos;
		y = y_pos;
		w = width;
		h = height;
		tint = tintColor;
	}
	void draw()
	{
		noStroke();
		fill(tint, button_alpha[state]);
		rect(x,y,w,h);
		fill(#000000);
		text(Text,x+5,y+20);
	}
	boolean hitTest()
	{
		if (mouseX>=x&&mouseX-x<=w)
		{
			if(mouseY>=y&&mouseY-y<=h)
			{
				// Mouse in area
				if(mousePressed)
				{
					if(state != BS_PRESS)
					{
						state = BS_PRESS;
						return true;
					}
					return false;		
				}
				state = BS_HOVER;
				return false;
			}
		}
		state = BS_NORMAL;
		return false;
	}
}
// Main

// Define buttons

Button reset_button = new Button("RESET", 310,50,80,30,#ff0000);
Button pause_button = new Button("PAUSE", 310,100,80,30, #66ccff);

void setup()
{
	size(400,30*20+5); // Make sure borders are visible
	for(int i = 0; i!= 30; i++)
	{
		arr[i]=(int)random(0,300);
	}
	min = 0;
	iter = 28;
	running = true;
}


void drawNums()
{
	background(255);
	stroke(#000000);
	fill(192);
	for (int i = 0; i != 30; i++)
	{
		rect(0,i*20,arr[i],20);
	}
	if (min != 28 && iter >= 0){
		// Highlight the swaping items
		fill(#66ccff);
		rect(0,iter*20,arr[iter],20);
		rect(0,iter*20+20,arr[iter+1],20);
	}
}

void sort_next()
{
	if (min==28)
	{
		// Sorting finished, do nothing
		return;
	}
	if(iter==min-1)
	{
		min++;
		iter=28;
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


void processInput()
{	
	if(reset_button.hitTest())
	{
		setup();
	}
	if(pause_button.hitTest())
	{
		running = !running;
	}
}

void draw()
{
	processInput();
	drawNums();
	reset_button.draw();
	pause_button.draw();
	if(running)
	{
		sort_next();
	}
}


