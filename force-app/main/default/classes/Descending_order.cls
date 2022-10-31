public class Descending_order 
{
 public static Integer[] sortArray(Integer[] intList)
    {

		for(Integer i = 0 ; i < intList.size() ; i++) 
        {
            for(integer j = i+1 ; j <= intList.size() -1 ; j++)
            {
                  integer x = 0 ;
                  if(intList[i] <  intList[j])
                  {
                       x = intList[i];
                       intList[i] = intList[j]  ;
                       intList[j]  = x;
                       system.debug(intList) ;
          		   }
    		}
		}  
        return intList;
    }
}