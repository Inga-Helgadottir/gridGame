int size = 40;
int[][] grid = new int[25][25];

Player player;
Enemy enemy;

void setup()
{
  size(1001, 1001);
  player = new Player(3, 4);
  enemy = new Enemy(20, 19, player);
}

void draw()
{
  clearBoard();
  updateEntities();
  drawBoard();
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
  }
  catch(ArrayIndexOutOfBoundsException e) {//player is outside the grid
    println("You can´t move that way " + e);
    if(player.x < 0){ //if the player goes outside the grid
      player.x = 0;
    }else{
      player.y = 0;
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
    c = color(127);
    break;
  case 1: 
    c = color(255, 0, 0);
    break;
  case 2: 
    c = color(0, 255, 0);
    break;
  case 3: 
    c = color(0, 0, 255);
    break;
  case 4: 
    c = color (0, 255, 255);
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
