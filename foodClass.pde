class Food
{
    int x; 
    int y; 
    int type = 3; 
    int health; 
    
    Food(int x, int y)
    {
        this.x = x;
        this.y = y;
        health = 100;
    }
    
        
    void feedPlayer()
    {
        health--;    
    }
}
