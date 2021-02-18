import java.util.ArrayList;//fik hjælp til denne del 

int size = 40;
int[][] grid = new int[25][25];

Player player;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Food> foods = new ArrayList<Food>();
//Enemy enemy1;
//Enemy enemy2;
//Enemy enemy3;
//Enemy enemy4;
//Food food1;
//Food food2;
//Food food3;
//Food food4;

void setup()
{
  size(1001, 1001);
  player = new Player(0, 0);
  enemies.add(new Enemy(22, 23, player));
  enemies.add(new Enemy(23, 23, player));
  enemies.add(new Enemy(23, 24, player));
  enemies.add(new Enemy(24, 24, player));

  foods.add(new Food(1, 1, player));
  foods.add(new Food(int(random(0, 24)), int(random(0, 24)), player));
  foods.add(new Food(int(random(0, 24)), int(random(0, 24)), player));
  foods.add(new Food(int(random(0, 24)), int(random(0, 24)), player));

  clearBoard();
  //enemy1 = new Enemy(22, 23, player);
  //enemy2 = new Enemy(23, 23, player);
  //enemy3 = new Enemy(23, 24, player);
  //enemy4 = new Enemy(24, 24, player);
  //food1 = new Food(1, 1, player);//int(random(0, 24)), int(random(0, 24)), player);
  //food2 = new Food(int(random(0, 24)), int(random(0, 24)), player);
  //food3 = new Food(int(random(0, 24)), int(random(0, 24)), player);
  //food4 = new Food(int(random(0, 24)), int(random(0, 24)), player);
}

void draw()
{
  clearBoard(); 
  updateEntities();
  drawBoard();
  resolveCollisions();
  //updateEnemies(); 
  //keyPressed(); 
  isGameOver();
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
    for (int i = 0; i < enemies.size(); i++) {
      grid[enemies.get(i).x][enemies.get(i).y] = enemies.get(i).type;
    }
    for (int i = 0; i < foods.size(); i++) {
      grid[foods.get(i).x][foods.get(i).y] = foods.get(i).type;
    }
    
    //for(int i = 0; i < enemies.size(); i++){
    //  enemies.get(i).update();
    //}
     for(int i = 0; i < foods.size(); i++){
      foods.get(i).remove(foods.get(i));
    }
    
    resolveCollisions();
   // player.update();--------------------------------------
    //grid[enemy1.x][enemy1.y] = enemy1.type;
    //grid[enemy2.x][enemy2.y] = enemy2.type;
    //grid[enemy3.x][enemy3.y] = enemy3.type;
    //grid[enemy4.x][enemy4.y] = enemy4.type;

    //grid[food1.x][food1.y] = food1.type;
    //grid[food2.x][food2.y] = food2.type;
    //grid[food3.x][food3.y] = food3.type;
    //grid[food4.x][food4.y] = food4.type;
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
    c = color(0, 0, 255);//player
    break;
  case 3: 
    c = color(0, 255, 0);//food
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

void resolveCollisions() {
  
  for(int i = 0; i < foods.size(); i++){
    if(player.collidesWith((foods.get(i)))){
      foods.remove(i);
    }
  }
  //float pX = player.x;
  //float pY = player.y;

//  float e1X = enemy1.x;
//  float e1Y = enemy1.y;
//  float e2X = enemy2.x;
//  float e2Y = enemy2.y;
//  float e3X = enemy3.x;
//  float e3Y = enemy3.y;
//  float e4X = enemy4.x;
//  float e4Y = enemy4.y;

//  float f1X = food1.x;
//  float f1Y = food1.y;
//  float f2X = food2.x;
//  float f2Y = food2.y;
//  float f3X = food3.x;
//  float f3Y = food3.y;
//  float f4X = food4.x;
//  float f4Y = food4.y;

//  if (pX == e1X && pY == e1Y 
//    || pX == e2X && pY == e2Y 
//    || pX == e3X && pY == e3Y
//    || pX == e4X && pY == e4Y) {
//    player.takeDamage();
//  } else if (pX == f1X && pY == f1Y || pX == f2X && pY == f2Y || pX == f3X && pY == f3Y || pX == f4X && pY == f4Y) {
//    println("hihi");
//  }
  /*else if (pX == f1X && pY == f1Y){
   f1X = int(random(0, 24));
   f1Y = int(random(0, 24));
   } else if (pX == f2X && pY == f2Y){
   f2X = int(random(0, 24));
   f2Y = int(random(0, 24));
   } else if (pX == f3X && pY == f3Y){
   f3X = int(random(0, 24));
   f3Y = int(random(0, 24));
   } else if (pX == f4X && pY == f4Y){
   f4X = int(random(0, 24));
   f4Y = int(random(0, 24));
   
   } */
  //player.eat();
}

void isGameOver() {
  if (player.health <= -1) {
    background(0);
    textSize(60);
    fill(255);
    text("Game over!", 1001/3, 1001/2);
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
  if (player.health <= -1 && keyCode == ENTER) {
    player.health = 1000;
    player.score = 0;
    player.x = 0;
    player.y = 0;
    clearBoard();
    drawBoard();
  }
}
