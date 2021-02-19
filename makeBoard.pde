
void clearBoard()
{
  //clears the board, using the nested for loops 
  //to tell the grid all boxes in the grid should be grey (number 0 in the getColorFromType)
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
  //here the board uses the getColorFromType function to put the player, enemies and food on the board
  for (int x = 0; x < grid.length; x++)
  {
    for (int y = 0; y < grid[0].length; y++)
    {
      fill(getColorFromType(grid[x][y]));
      rect(x * size, y * size, size, size);
    }
  }
}
