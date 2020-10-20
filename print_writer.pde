import java.io.*;
import java.util.Locale;
import processing.serial.*;



// Instantiating serial and print writer
Serial mySerial;
PrintWriter output;

void setup() {
  println("Inside setup");
  mySerial = new Serial(this, Serial.list()[0], 9600);
  String filename = "/Users/harshdeep/EPFL/igem_2020/data.txt";
 
  File f = new File(dataPath(filename));
 
  // Delete the file if already exists
  if (f.exists())
  {
    println("file exists");
    f.delete();
  }
  output = createWriter(filename);
}

void draw() {
    if (mySerial.available() > 0 ) {
         String value = mySerial.readString();
         if ( value != null ) {
              output.println( value );
         }
    }
}

void keyPressed() {
    println("Closing the application");
    output.flush();  // Writes the remaining data to the file
    output.close();  // Finishes the file
    println("Exiting the program");
    exit();  // Stops the program
}
