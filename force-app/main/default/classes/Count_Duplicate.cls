public class Count_Duplicate 
{
	public static void countDuplicate(){
        List<Integer> numList = new List<Integer>{2, 2, 3, 4, 4, 5};
        Map<Integer, Integer> countDuplicateMAp = new Map<Integer, Integer>();
        for(Integer each : numList){
            countDuplicateMAp.put(each, countNumber(each, numList));
            countDuplicateMAp.put(2,4);
        }
        system.debug('countDuplicateMAp : '+ countDuplicateMAp);
        system.debug('countDuplicateMAp : '+ countDuplicateMAp.size());
    }
    public static Integer countNumber(Integer DigNum, List<Integer>numerList){
        Integer countNum = 0;
        system.debug('DigNum : '+ DigNum);
        
        for(Integer val : numerList){
            system.debug('valu : '+ val);
            if(val == DigNum){
                ++countNum;
            }
        }
        return countNum;
    }
}