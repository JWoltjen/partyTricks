function sockMerchant(n, ar) {
    // Write your code here
    // iterate through socks
    // count pairs of socks
    // return pairs
     let numberOfPairs = 0
     let sockTypeCount = new Map(); 
     for(let i = 0; i< n; i++){
         const sock = ar[i]
         
         if(!sockTypeCount.has(sock)){
             sockTypeCount.set(sock, 1)
         } else {
             const newCount = sockTyhhpeCount.get(sock) + 1; 
             sockTypeCount.set(sock, newCount); 
         }
     }
     for(let type of sockTypeCount.keys()){
         const pairs = sockTypeCount.get(type); 
         
         numberOfPairs += Math.floor(pairs/2); 
     }
     return numberOfPairs
}