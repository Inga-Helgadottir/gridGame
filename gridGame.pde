//før du kan rykke playeren skal du klikke på vinduet
//enemies rykker sig kun efter at du har klikket på en af pilerne 
//jeg ændrede keyPressed til at kigge på piler fordi det er nemmere for mig

//makes it possible to make an array from classes
import java.util.ArrayList;

//background grid
int[][] grid = new int[25][25];
int size = 40;//size of boxes

//calling all classes
Player player;
//making an array from classes
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Food> foods = new ArrayList<Food>();

//if health is >= 0 turns true
boolean gameOver = false;

void settings() {
  //processing threw an error because the size object was in setup
  size(1001, 1001);
}

void setup() {
  //calling player, enemies and food to the grid
  player = new Player(0, 0);

  //the enemies start on the other end making the game easier
  enemies.add(new Enemy(22, 23, player));
  enemies.add(new Enemy(23, 23, player));
  enemies.add(new Enemy(23, 24, player));
  enemies.add(new Enemy(24, 24, player));

  //food is placed randomly in a group
  foods.add(new Food(int(random(0, 24)), int(random(0, 24)), player)); 
  foods.add(new Food(int(random(0, 24)), int(random(0, 24)), player));
  foods.add(new Food(int(random(0, 24)), int(random(0, 24)), player));
  foods.add(new Food(int(random(0, 24)), int(random(0, 24)), player));

  //makes the grid
  clearBoard();
}

void draw() {
  //checking if the game is over, using my gameOver boolean
  if (!gameOver) {
    //if game is not over clear the board, update entities and draw the board with the player, food and enemies
    clearBoard(); 
    updateEntities();
    drawBoard();
  } else {
    //if the game is over show game over text
    background(0);
    textSize(60);
    fill(255);
    text("    Game over!", 200, 1001/2);
    text(" Your score is: " + player.score, 200, 1001/3);
  }
}
