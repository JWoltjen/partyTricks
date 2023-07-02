/*
Harold is a kidnapper who wrote a ransom note, but now he is worried it will be traced back to him through his handwriting. 
He found a magazine and wants to know if he can cut out whole words from it and use them to create an untraceable replica of his ransom note. 
he words in his note are case-sensitive and he must use only whole words available in the magazine. 
He cannot use substrings or concatenation to create the words he needs.
Given the words in the magazine and the words in the ransom note, print "Yes"
if he can replicate his ransom note exactly using whole words from the magazine; otherwise, print "No"


Example: 
Magazine: "attack at dawn"
Note: "Attack at dawn"

The magazine has all the right words but there is a case mismatch.
The answer is "No."

Complete the checkMagazine function in the editor below. It must print "Yes" 
if the note can be formed using the magazine, or "No".

checkMagazine has the following parameters:

string magazine[m]: the words in the magazine
string note[n]: the words in the ransom note
*/

const canConstruct = (magazine, ransomNote) => {
    // create the frequency maps
    const magazineMap = new Map();
    const ransomMap = new Map();

    // populate the magazineMap
    for (let i = 0; i < magazine.length; i++){
        const char = magazine[i];
        // setting the value of the key char to the present value (if it exists) + 1 
        // or 0, if it doesn't exist + 1
        magazineMap.set(char, (magazineMap.get(char) || 0) + 1);
    }

    // populate the ransomMap
    for (let i = 0; i < ransomNote.length; i++){
        const char = ransomNote[i];
        ransomNote.set(char, (ransomMap.get(char) || 0) + 1);
    }
    // check if the ransom note can be constructed
    for (const [char, count] of ransomMap){
        if(!magazineMap.has(char) || magazineMap.get(char) < count){
            return false;
        }
    }
    return true; 
}

/*
Commentary
The hardest part of this problem for me is the destructuring assignment
for (const [char, count] of ransomMap). I know that we are looping over
the entries of the ransomMap. Each entry consists of a key (char) and a 
value (count). During the destructuring assignment, the 'count' variable
is created and assigned to the value of the frequency count for the corresponding
char. 
So to summarize, the 'count' variable is created implicitly during the destructuring assignment.

The second hardest thinga bout this problem is recognizing the appropriate
datatype to use. What makes Map() the best data type to use for this problem?

Maps provide: efficient lookup--they store key/values
they perseve the insertion order of entries. They handle duplicate keys--
In this problem, it's possible to have duplicate characters in the magazine and 
ransom note.Maps do not allow duplicate keys. Each key in a Map must be unique.
If you try to add a key-value pair with a key that already exists in the Map, 
it will overwrite the previous value associated with that key.
By using "Map", we can accurately count the frequency of each character,
even if they appear multiple times. 

*/