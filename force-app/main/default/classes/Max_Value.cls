public class Max_Value 
{
    public static Integer maxArray(Integer[] intList)
    {
		integer x = intList[0];
        
		for(Integer i = 0 ; i < intList.size() ; i++) 
        {
                  
                  if(intList[i] > x)
                  {
                       x = intList[i];
          		  }
		} 
        system.debug(x);
        return x;
    }
}