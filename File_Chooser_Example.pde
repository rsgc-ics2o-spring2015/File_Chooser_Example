// Load required libraries from the Java API (application programming interface)
// These allow us to load images from disk and write them to the 'data' folder
import javax.imageio.*;
import java.awt.image.*;

// Globals
BufferedImage image;             // Stores the initial image loaded off of the disk (from any location)
boolean writeSuccessful = false; // Tracks whether image was successfully written to 'data' folder
PImage imageToShow;              // Stores the image to be shown later, loaded from the 'data' folder

// Runs once
void setup() {
  
  // Create the canvas
  size(800, 600);

  // This uses a Processing-provided function to make file selection a lot easier.
  // Also, you will have the use of a platform-native file selection dialog box.
  // (That is, the dialog box will look 'right' on OS X, or on Windows, et cetera).
  // The first parameter is the message the user will see
  // The second parameter is the name of a function that will be invoked, or "called"
  // after a file selection has been made  
  selectInput("Select a file to process:", "fileSelected");
}

// Runs repeatedly
void draw() {
  
  // Show the image from the 'data' folder, if one was succesfully copied there
  if (imageToShow != null) {
    image(imageToShow, 0, 0);  
  }
  
}

// This runs after a file selection has been made
void fileSelected(File selection) {

  // Take different actions based on what the user chose to do
  if (selection == null) {

    println("Window was closed or the user hit cancel.");
    
  } else {

    println("User selected " + selection.getAbsolutePath());

    // Attempt to read the image selected
    try {
      image = ImageIO.read(selection);
    } 
    catch (IOException e) {
      image = null;
      println("Error occurred reading image file.");
      e.printStackTrace();
    }

    // Save the image to the sketch's data folder
    if (image != null) {
      println("Image loaded successfully.");
      println("Attempting to save to 'data' folder of sketch.");
      try {
        // TO DO: Need to write code that creates data folder if it doesn't already exist
        // FOR NOW: The data folder must already be created, otherwise this line of code will fail.
        writeSuccessful = ImageIO.write(image, "jpg", new File(sketchPath + "/data/" + selection.getName()));
      } 
      catch (IOException e) {
        println("Error occurred writing image file to 'data' folder of sketch.");
        e.printStackTrace();
      }
    }
    
    // Show the image on the canvas
    if (writeSuccessful) {
      println("Successfully wrote image to the 'data' folder.");
      imageToShow = loadImage(selection.getName());
    } else {
      imageToShow = null;
    }
    
  }
}
