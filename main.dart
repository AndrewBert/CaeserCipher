/* 
Andrew Bertino
9/24/2020
Assignment #3
Question #4
Caesar Cipher

This program can encrypt and decrypt a message using the Caesar Cipher. The plaintext and shift can be changed to whatever you prefer.
*/



main(){

  var plaintext = "meet me after the toga party";
  var shift = 3;

  var plaintextAsList = new List();

  //turns message string into list, one char at each index
  plaintext.runes.forEach((int rune){
    plaintextAsList.add(String.fromCharCode(rune));
  });

  var encryptedMessage = encrypt(plaintextAsList, shift);
    printListOfStrings(encryptedMessage);

  var decryptedMessage = decrypt(encryptedMessage, shift);
    printListOfStrings(decryptedMessage);
}

var alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];

List encrypt(List message, int shift){
  
  var encryptedMessage = List();

  
  message.forEach((messageChar){
    //finds the index of each letter in the message
    alphabet.asMap().forEach((index, letter){
      if(messageChar == letter){
        //applies the shift and mod operation
        encryptedMessage.add(alphabet[(index+shift)%26]);
      }
    });
  });

  return encryptedMessage;
}

//works nearly the same as the encrypt function
List decrypt(List encryptedMessage, int shift){
  var decryptedMessage = List();
  encryptedMessage.forEach((messageChar){
    alphabet.asMap().forEach((index, letter){
      if(messageChar == letter){
        //applies the shift in the opposite direction and mod operation
        decryptedMessage.add(alphabet[(index-shift)%26]);
      }
    });
  });

  return decryptedMessage;
}

//helper function to print a list nicely
void printListOfStrings(List listOfStrings){
  var concatenate = StringBuffer();

  listOfStrings.forEach((item){
    concatenate.write(item);
  });

  print(concatenate);

}