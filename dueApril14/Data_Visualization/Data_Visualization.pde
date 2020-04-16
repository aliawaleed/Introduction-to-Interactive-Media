/* The concept for this data visualization is to present the calories present in all items sold in McDonald's as circles
   where the size is based on the number of calories. 
   
   By Alia Waleed
   April 14th, 2020
   Data Visualization

  Dataset was obtained from https://www.kaggle.com/jadeblue/openfoodfactsclean
  Used http://learningprocessing.com/examples/chp18/example-18-03-LoadSaveTable for reference
*/

Table table; // one table object
Food food; //one food class

void setup() {
  size(800, 800);
  food = new Food(); //calling the food class
}

void draw() {
  background(255);
  food.display_calories(); //calls the function "display_calories" inside food
}

class Food {
  // setting attributes for the food class and creating them as lists
  String category[];
  String product_name[];
  int calories[];
  float f[];
  float c[];
  float p[];
    
  Food(){
    Table table = loadTable("menu_data.csv", "header"); //Load CSV file into the table object, added "header" to indicate a header row in the file
    // goes through each row in every column to add its elements to a list
    category = new String[table.getRowCount()];
    product_name = new String[table.getRowCount()];
    calories = new int[table.getRowCount()];
    f = new float[table.getRowCount()];
    c = new float[table.getRowCount()];
    p = new float[table.getRowCount()];
   
    for (int i = 0; i < table.getRowCount(); i++) { //iterating over all the rows of the table to access them
      TableRow row = table.getRow(i); //gets each row of the table
      //accessing the fields through their column name
      category[i] = row.getString("category");
      product_name[i] = row.getString("product_name");
      calories[i] = row.getInt("calories");
      f[i] = row.getFloat("fat_g");
      c[i] = row.getFloat("carbohydrates_g");
      p[i] = row.getFloat("proteins_g");
      }
  }
  
  void display_calories() { //function to display the circles
    for (int i : calories){ //goes through all the elements of the list "calories"
       fill(random(255),random(255),random(255)); //randomizes color of circle displayed
       circle(random(i/8, width - i/8),random(i/8, height - i/8), i/4); //ensures that the location is within the window
       frameRate(3); //slows down the number of frames displayed per second
    }
  }
  
  //void display_category() { //function to print the name of the item in the category list (trying out but does not work)
  //  for (String i : category){ //goes through all the elements of the list "calories"
  //     println(i);
  //  }
  //}
}
