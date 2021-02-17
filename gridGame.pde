int size = 40;
int[][] grid = new int[25][25];

Player player;
Enemy enemy1;
Enemy enemy2;
Enemy enemy3;
Enemy enemy4;
Food food1;
Food food2;
Food food3;
Food food4;

void setup()
{
  size(1001, 1001);
  player = new Player(0, 0);
  enemy1 = new Enemy(22, 23, player);
  enemy2 = new Enemy(23, 23, player);
  enemy3 = new Enemy(23, 24, player);
  enemy4 = new Enemy(24, 24, player);
  food1 = new Food(int(random(0, 24)), int(random(0, 24)));
  food2 = new Food(int(random(0, 24)), int(random(0, 24)));
  food3 = new Food(int(random(0, 24)), int(random(0, 24)));
  food4 = new Food(int(random(0, 24)), int(random(0, 24)));
}

void draw()
{
  clearBoard(); 
  updateEntities();
  drawBoard();
  //resolveCollisions();
  //updateEnemies(); 
  //keyPressed(); 
  //isGameOver();
}

void clearBoard()
{
  for (int x = 0; x < grid.length; x++)
  {
    for (int y = 0; y < grid[0].length; y++)
    {
      grid[x][y] = 0;
    }
  }
}

void drawBoard()
{
  for (int x = 0; x < grid.length; x++)
  {
    for (int y = 0; y < grid[0].length; y++)
    {
      fill(getColorFromType(grid[x][y]));
      rect(x * size, y * size, size, size);
    }
  }
}

void updateEntities()
{
  try {
    grid[player.x][player.y] = player.type;
    grid[enemy1.x][enemy1.y] = enemy1.type;
    grid[enemy2.x][enemy2.y] = enemy2.type;
    grid[enemy3.x][enemy3.y] = enemy3.type;
    grid[enemy4.x][enemy4.y] = enemy4.type;
    grid[food1.x][food1.y] = food1.type;
    grid[food2.x][food2.y] = food2.type;
    grid[food3.x][food3.y] = food3.type;
    grid[food4.x][food4.y] = food4.type;
  }
  catch(ArrayIndexOutOfBoundsException e) {//player is outside the grid
    println("You can´t move that way " + e);
    if (player.x < 0) { //if the player goes outside the grid
      player.x = 0;
    } else if (player.x > 24) {
      player.x = 24;
    } else if (player.y < 0) {
      player.y = 0;
    } else if (player.y > 24) {
      player.y = 24;
    }
  }
  player.takeDamage();
}


color getColorFromType(int type) 
{
  color c = color(255);

  switch(type)
  {
  case 0: 
    c = color(127);//background
    break;
  case 1: 
    c = color(255, 0, 0);//enemy
    break;
  case 2: 
    c = color(0, 255, 0);//food
    break;
  case 3: 
    c = color(0, 0, 255);//player
    break;
  case 4: 
    c = color (0, 255, 255);
    break;
  default:
    c = color(127);
    break;
  }    

  return c;
}

void printIntArray(int[][] arr) 
{
  for (int x = 0; x < arr.length; x++)
  {
    for (int y = 0; y < arr[0].length; y++) 
    {
      System.out.print(arr[x][y] + ", ");
    }
  }
}
//void updateEnemies() {
//  enemy1.MoveTowardsPlayer();
//}

void isGameOver() {
  if (player.health == 0) {
    background(0);
    textSize(60);
    fill(255);
    text("Game over!", 1001/3, 1001/2);
  }
} 

void resolveCollisions() {
}

void keyPressed()
{
  if (keyCode == UP)
  {
    player.y--;
  }
  if (keyCode == LEFT)
  {
    player.x--;
  }
  if (keyCode == DOWN)
  {
    player.y++;
  }
  if (keyCode == RIGHT)
  {
    player.x++;
  }
}
