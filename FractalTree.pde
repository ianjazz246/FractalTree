private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;
private color INITIAL_COLOR = color(101, 67, 33);
private color FINAL_COLOR = color(0, 255, 0);
public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	//stroke(0,255,0);   
	line(320,480,320,380);   
	drawBranches(320, 380, 30, -Math.PI/2);
	//drawBranches(??,??,??,??);  //will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{
	if (branchLength < 1) {
		return;
	}
	if (branchLength < 3) {
		stroke(0, 255, 0);
	}
	else {
		stroke(101, 67, 33);
	}
	int finalX = (int)(x + branchLength * Math.cos(angle));
	int finalY = (int)(y + branchLength * Math.sin(angle));
	//System.out.println(y);
	line(x, y, finalX, finalY);
	drawBranches(finalX, finalY, branchLength - 2, angle + 0.2);
	drawBranches(finalX, finalY, branchLength - 2, angle - 0.2);
} 
