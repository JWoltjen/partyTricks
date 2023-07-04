/*Mark and Jane are very happy after having their first child.
Their son loves toys, so Mark wants to buy some. 
There are a number of different toys lying in front of him, tagged with their prices. 
Mark has only a certain amount to spend, and he wants to maximize the number of toys he buys with this money. 
Given a list of toy prices and an amount to spend, determine the maximum number of gifts he can buy.
Note Each toy can be purchased only once.

example
prices = [1, 2, 3, 4]
k = 7

The budget is  units of currency.
He can buyu items that cost 1, 2, 3 for 6 or 3,4 for 7. 
The maximum is three items.

Complete the function maximumToys in the editor below.

maximumToys has the following parameter(s):

int prices[n]: the toy prices
int k: Mark's budget
Returns

int: the maximum number of toys
*/













let prices = [1, 12, 5, 111, 200, 1000, 10]
let k = 50
const maxToys = (prices, k) => {
  //set up variables
  let count = 0;
  let remainingBudget = k;
  //sort the array in ascending order
  const sortedPrices = prices.sort((a, b) => (a-b));
  //loop through the array while the remaining budget is more than the next bigest toy
  for(let i = 0; i <  sortedPrices.length; i++){
    if(sortedPrices[i] <= remainingBudget){
      count++
      remainingBudget -= sortedPrices[i]
    } else {
      break
    }
  }
  return count;
}

maxToys(prices, k)