/*
Harold is a kidnapper who wrote a ransom note, but now he is worried it will be traced back to him through his handwriting. 
He found a magazine and wants to know if he can cut out whole words from it and use them to create an untraceable replica of his ransom note. 
he words in his note are case-sensitive and he must use only whole words available in the magazine. 
He cannot use substrings or concatenation to create the words he needs.
Given the words in the magazine and the words in the ransom note, print "Yes"
if he can replicate his ransom note exactly using whole words from the magazine; otherwise, print "No"


Example: 
let magazine = "attack at dawn"
let note = "Attack at dawn"

The magazine has all the right words but there is a case mismatch.
The answer is "No."

Complete the checkMagazine function in the editor below. It must print "Yes" 
if the note can be formed using the magazine, or "No".

checkMagazine has the following parameters:

string magazine[m]: the words in the magazine
string note[n]: the words in the ransom note
*/





























const canConstruct = (magazine, ransomNote) => {
    // set up the map
    let wordMap = new Map();
    
    // count each word in the magazine
    for(let word of magazine) {
        if(wordMap.has(word)) {
            // increase the word count each time the word is encountered after the first time
            wordMap.set(word, wordMap.get(word) + 1);
        } else {
            // set the word count to one the first time the word is encountered
            wordMap.set(word, 1);
        }
    }

    // check if each word in the note is in the magazine
    for(let word of ransomNote) {
        // The frequency check is necessary because a word could be in the magazine, 
        // but it might have been already used up for previous words in the ransom note.
        if(wordMap.has(word) && wordMap.get(word) > 0) {
            // decrease the word count by one each time it is used
            wordMap.set(word, wordMap.get(word) - 1);
        } else {
            console.log('No');
            return;
        }
    }

    console.log('Yes');
}

/*
Commentary


*/