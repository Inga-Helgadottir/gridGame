void keyPressed()
{
  //if you press one of the arrows the player moves
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
  //if the game is over and you press enter then it starts over
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
