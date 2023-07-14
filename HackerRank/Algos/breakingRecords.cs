/*
/*
Maria plays college basketball and wants to go pro. 
Each season she maintains a record of her play. 
She tabulates the number of times she breaks her season record 
for most points and least points in a game. 

Points scored in the first game establish her record for the season, 
and she begins counting from there.

Example
scores = [12, 24, 10, 24]
Scores are in the same order as the games played. 
She tabulates her results as follows:

                                     Count
    Game  Score  Minimum  Maximum   Min Max
     0      12     12       12       0   0
     1      24     12       24       0   1
     2      10     10       24       1   1
     3      24     10       24       1   1

Given the scores for a season, determine the number of times Maria breaks 
her records for most and least points scored during the season.


public int[] breakingRecords(int[] scores) 
{
    int highScoreCount = 0;
    int lowScoreCount = 0;
    int highScore = scores[0];
    int lowScore = scores[0];

    for(int i = 0; i < scores.Length; i++)
    {
        if(scores[i] > highScore)
        {
            highScoreCount++;
            highScore = scores[i];
        }
        if(scores[i] < lowScore)
        {
            lowScoreCount++;
            lowScore = scores[i];
        }
    }
    return new int[] {highScoreCount, lowScoreCount}
}

*/
