/* The concept for this data visualization is to present the calories present in all items sold in McDonald's as circles
   where the size is based on the number of calories. 
   
   By Alia Waleed
   April 14th, 2020
   Data Visualization

  Dataset was obtained from https://www.kaggle.com/jadeblue/openfoodfactsclean
  Used http://learningprocessing.com/examples/chp18/example-18-03-LoadSaveTable for reference
*/

Table table; // one table object
Food food;

void setup() {
  size(800, 800);
  food = new Food();
}

void draw() {
  background(255);
  food.display();
}

class Food {
  String category[];
  String product_name[];
  int calories[];
  float f[];
  float c[];
  float p[];
    
  Food(){
    Table table = loadTable("menu_data.csv", "header"); //Load CSV file into the table object, added "header" to indicate a header row in the file
    String category[] = new String[table.getRowCount()];
    String product_name[] = new String[table.getRowCount()];
    calories = new int[table.getRowCount()];
    float f[] = new float[table.getRowCount()];
    float c[] = new float[table.getRowCount()];
    float p[] = new float[table.getRowCount()];
   
    for (int i = 0; i < table.getRowCount(); i++) { //iterating over all the rows of the table to access them
      TableRow row = table.getRow(i);
      //accessing the fields through their column name
      category[i] = row.getString("category");
      product_name[i] = row.getString("product_name");
      calories[i] = row.getInt("calories");
      f[i] = row.getFloat("fat_g");
      c[i] = row.getFloat("carbohydrates_g");
      p[i] = row.getFloat("proteins_g");
      }
  }
  
  void display() { //function to display the circles
    for (int i : calories){
       fill(random(255),random(255),random(255));
       circle(random(width),random(height), i/4);
       frameRate(5);
    }
  }
}
