public class Ascending_Order 
{
    public static Integer[] sortArray(Integer[] a)
    {     
		for(Integer i= 0; i < a.size(); i++) 
        {
            for(integer j=i+1; j <= a.size() -1; j++)
            {
                  integer x = 0;
                  if(a[i] >  a[j])
                    {
                       x = a[i];
                       a[i] = a[j];
                       a[j]  = x;
                       system.debug(x);
                    }
    		}
		}  
        system.debug(a);
        return a;
    }
}