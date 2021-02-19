//checks what color goes where using the type in every class and the background
color getColorFromType(int type) 
{
  //the function needs a default type to work right
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
  }    
  return c;
}
