void updateEnemies() {
  //loops over all enemies and makes them move towards the player
  for (int i = 0; i < enemies.size(); i++) {
    enemies.get(i).MoveTowardsPlayer();
  }
}

void updateFoods() {
  //loops over all foods and makes them move away from the player
  for (int i = 0; i < foods.size(); i++) {
    foods.get(i).MoveAwayFromPlayer();
  }
}
