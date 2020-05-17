class Order {
  float x, y; //location
  float type;
  PImage img;
  PImage failed;
  PImage burger;
  int [] columns;
  ArrayList<OrderIngredient> order;
  boolean complete;
  Order() {
    y = 30;
    order = new ArrayList<OrderIngredient>(); //creates an array of the ingredients in an order
    complete = false;
    int[] columns = {120, 200, 280, 360, 480};
    for (int i = 0; i < ings.length; i++) { //go through the ingredients and place them in a different column at y = 30
      order.add(new OrderIngredient(i));
      order.get(i).x = columns[i];
      order.get(i).y = 30;
    }
  }

  void display() {  
    if (complete) { //if order is complete
      for (int i = 0; i < ingredients.size(); i++ ) { //goes through all elements of the ingredients arrayList
        ingredients.remove(i); //remove the ingredient from the array when it leaves the screen
      }
      count = 0;
      for  ( OrderIngredient oIng : order) {
        if (oIng.number != 0) {
          count = 1;
          break;
        }
      }
      if (count == 0) {
        background(0, 204, 0);
        fill(245, 245, 220);
        rect(50, 50, width - 100, height - 100, 7);
        noFill();
        burger = loadImage("burger.png");
        imageMode(CENTER);
        image(burger, width/2, height/2, burger.width/14, burger.height/14);
        textSize(17);
        fill(0);
        text("Successful Order!", width/2, 150);
        textAlign(CENTER, CENTER);
      } else {
        background(0);
        fill(245, 245, 220);
        rect(50, 50, width - 100, height - 100, 7);
        noFill();
        failed = loadImage("failed.png");
        imageMode(CENTER);
        image(failed, width/2, height/2, failed.width/3, failed.height/3);
        textSize(25);
        fill(0);
        text("Game Over!", width/2, height/4);
        textAlign(CENTER, CENTER);
      }
    } else {
      for (OrderIngredient ing : order) {
        ing.display();
      }
    }
  }
}
