public class Min_value 
{
    public static Integer minArray(Integer[] intList)
    {
		integer min = intList[0]; 
        
		if(intList.size()>0)
			{
				for(integer i =1;i<intList.size();i++)
				{
					if(intList[i]<min)
					{
						min = intList[i];
					}
				}
            }
        system.debug(min) ;
        return min;
    }
}