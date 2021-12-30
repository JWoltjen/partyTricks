function sockMerchant(n, ar) {
    
    //choose your weapons
     let numberOfPairs = 0
     let sockTypeCount = new Map(); 

     //In this problem, the let sockTypeCount = new Map() allows us to create a new Map that will set key value pairs for storage, sort of like having a drawer that is labeled with a word and has a given number of contents inside. 

     //Since the problem gives us an array of socks, we make the drawer without first knowing where to put all the socks we may encounter in the array. 

     // So let's iterate through the socks, and for each ar[i], place the sock into the corresponding drawer. 

     for(let i = 0; i< n; i++){
         const sock = ar[i]
         
         if(!sockTypeCount.has(sock)){
             sockTypeCount.set(sock, 1)

    //If our sock drawer has not seen this sock before, make a new shelf in the drawer with this particular sock as its key, and set the value of that shelf to 1

         } else {
             const newCount = sockTypeCount.get(sock) + 1; 
             sockTypeCount.set(sock, newCount); 
         }
    //If we have seen this type of sock before, create a new count of the total number of socks by getting the previously encountered number, adding one, and setting the sockCount to the newCount. 
     }

     // count pairs of socks
     for(let type of sockTypeCount.keys()){
         const pairs = sockTypeCount.get(type); 
         
         numberOfPairs += Math.floor(pairs/2); 
     }
     //The loop says for each shelf in the sock drawer, return me the total number of socks, divide that number  by two and round down, and add that number to to the running tally of sock pairs found in the sock drawer. Keep in mind that "type" is an arbitrary label here. We can call it anything we want as long as we sockTypeCount.get("whatever") in the next line. 

     //return them
     return numberOfPairs
}

// There is a large pile of socks that must be paired by color. Given an array of integers representing the color of each sock, determine how many pairs of socks with matching colors there are.


//What is a Map? A Map is a data structure where a key is mapped to a value. It's used to quickly lookup values based on their corresponding keys. Only one key can map to a value -- no duplicates.

//Applications: Maps are super popular because they are fast. Holding key/value pairs has many applications, such as: Caching--keys are URLs and values are website content. Indexing--keys are words, and values are the list of documents where they are found. Spell Checking--keys are English words. Networks--the key is an IP address/port number, while the value is the corresponding application to be run when address is accessed.

//Maps v. Arrays: Maps and arrays are similar. In an aray, the key/index is always a number, while the value in a Map can be anything. Both an array and map are veryfast for getting values by key in constant time O(1). A map is an array internally. It translates the key into an array's index using a hash function. That's why it's also called a Hash Map. 


  