// Import required library
import javax.swing.JFileChooser;

void setup()
{
  // Create an object named 'chooser' based on class JFileChooser
  JFileChooser chooser = new JFileChooser();

  // This file chooser will allow selection of any file type
  // Should read details of JFileChooser class here:
  // http://docs.oracle.com/javase/7/docs/api/javax/swing/JFileChooser.html
  // ... and adjust code in this program so that only text files are 'choosable'
  // in the file chooser box
  chooser.setFileFilter(chooser.getAcceptAllFileFilter());

  // Show the dialog
  int returnVal = chooser.showOpenDialog(null);

  // See what happened – if the return value indicates the user selected the 'Open'
  // button, then print the name of the file selected to the console
  if (returnVal == JFileChooser.APPROVE_OPTION) 
  {
    println("You chose to open this file: " + chooser.getSelectedFile().getName());

    // Now actually open the file using an object of type BufferedReader
    println("-------- file contents are --------");
    BufferedReader reader;
    String line;
    reader = createReader(chooser.getSelectedFile());
    do
    {
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
