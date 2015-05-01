void setup() {

  // This uses a Processing-provided function to make file selection a lot easier.
  // Also, you will have the use of a platform-native file selection dialog box.
  // (That is, the dialog box will look 'right' on OS X, or on Windows, et cetera).
  // The first parameter is the message the user will see
  // The second parameter is the name of a function that will be invoked, or "called"
  // after a file selection has been made  
  selectInput("Select a file to process:", "fileSelected");
}

// This runs after a file selection has been made
void fileSelected(File selection) {

  // Take different actions based on what the user chose to do
  if (selection == null) {

    println("Window was closed or the user hit cancel.");
  } else {

    println("User selected " + selection.getAbsolutePath());

    // Now actually open the file using an object of type BufferedReader
    println("-------- file contents are --------");
    BufferedReader reader;
    String line;
    reader = createReader(selection);
    do {
      
      // Attempt to read a line
      try {
        line = reader.readLine();
      } 
      catch (IOException e) {
        e.printStackTrace();
        line = null;
      }

      // Print the contents of that line to the console
      if (line != null) println(line);
    } 
    while (line != null);
    
  }
  
}
