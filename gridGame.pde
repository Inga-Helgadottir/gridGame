/*
To do:
 make food run away 
 fix score
 check if i can make it a 25% chance that enemy and food moves
 */
//enemies rykker sig kun efter at du har klikket på en af pilerne 
//jeg ændrede keyPressed til at kigge på piler fordi det er nemmere for mig

import java.util.ArrayList;

int size = 40;
int[][] grid = new int[25][25];

Player player;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Food> foods = new ArrayList<Food>();
boolean gameOver = false;

void settings() {
  size(1001, 1001);
}

void setup() {
  player = new Player(0, 0);
  enemies.add(new Enemy(22, 23, player));
  enemies.add(new Enemy(23, 23, player));
  enemies.add(new Enemy(23, 24, player));
  enemies.add(new Enemy(24, 24, player));

  foods.add(new Food(int(random(0, 24)), int(random(0, 24)), player)); 
  foods.add(new Food(int(random(0, 24)), int(random(0, 24)), player));
  foods.add(new Food(int(random(0, 24)), int(random(0, 24)), player));
  foods.add(new Food(int(random(0, 24)), int(random(0, 24)), player));

  clearBoard();
}

void draw()
{
  if (!gameOver) {//checking if the game is over
    clearBoard(); 
    updateEntities();
    drawBoard();
    //resolveCollisions();
    //updateEnemies();
  } else {//if the game is over
    background(0);
    textSize(60);
    fill(255);
    text("   Game over! \nYour score is: " + player.score, 200, 1001/2);
  }
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
      updateEnemies();
      if (grid[player.x][player.y] == grid[enemies.get(i).x][enemies.get(i).y]) {
        resolveCollisions();
      }
    }
    for (int i = 0; i < foods.size(); i++) {
      grid[foods.get(i).x][foods.get(i).y] = foods.get(i).type;
      if (grid[player.x][player.y] == grid[foods.get(i).x][foods.get(i).y]) {
        resolveCollisions();
      }
    }
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

    for (int i = 0; i < enemies.size(); i++) {//if the enemy goes outside the grid
      if (enemies.get(i).x < 0) {
        enemies.get(i).x = 0;
      } else if (enemies.get(i).x > 24) {
        enemies.get(i).x = 24;
      } else if (enemies.get(i).y < 0) {
        enemies.get(i).y = 0;
      } else if (enemies.get(i).y > 24) {
        enemies.get(i).y = 24;
      }
      updateEnemies();
    }
  }
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

void updateEnemies() {
  for (int i = 0; i < enemies.size(); i++) {
    enemies.get(i).MoveTowardsPlayer();
  }
}

void resolveCollisions() {      
  for (int i = 0; i < foods.size(); i++) {
    if (grid[foods.get(i).x][foods.get(i).y] == grid[player.x][player.y]) {
      //hvis player går ind i food, rykker alle foods sig, fix if theres time
      foods.get(i).x = int(random(0, 24));
      foods.get(i).y = int(random(0, 24));
      player.eat();//increase score
    }
  }

  for (int i = 0; i < enemies.size(); i++) {
    if (grid[enemies.get(i).x][enemies.get(i).y] == grid[player.x][player.y]) {
      player.takeDamage();//decrease health
      isGameOver();
    }
  }
}

void isGameOver() {
  if (player.health <= 0) {
    gameOver = true;
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
  if (player.health <= 0 && keyCode == ENTER) {//restart game
    clearBoard();
    drawBoard();
    player.health = 100;
    player.score = 0;
    player.x = 0;
    player.y = 0;
    gameOver = false;
  }
}
