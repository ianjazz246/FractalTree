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

	int finalX = (int)(x + branchLength * Math.cos(angle));
	int finalY = (int)(y + branchLength * Math.sin(angle));

	if (branchLength < 3) {
		strokeWeight(1);
		stroke(0, 255, 0);
	}
	else {
		if (branchLength < 6) {
			strokeWeight(1);
			stroke(0, 255, 0);
			point(x, y);

			point((x + finalX) / 2, (y + finalY) / 2);
		}
		strokeWeight(1);
		stroke(101, 67, 33);
	}
	
	//System.out.println(y);
	line(x, y, finalX, finalY);
	//gradientLine(x, y, finalX, finalY, INITIAL_COLOR, FINAL_COLOR, -y / 30);
	drawBranches(finalX, finalY, branchLength - 2, angle + Math.random()*0.5);
	drawBranches(finalX, finalY, branchLength - 2, angle - Math.random()*0.5);
} 

public void gradientLine(int x1, int y1, int x2, int y2, color initial_color, color final_color, double percent) {
	int xt = x2-x1;
	int yt = y2-y1;
	for (double i = 0.0000001; i <= 1; i += 0.01) {
		stroke(lerpColor(initial_color, final_color, (float)(i+percent)));
		point((float)(x1 + i*xt), (float)(y1 + i*yt));
	}

}