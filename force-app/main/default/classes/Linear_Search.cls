public class Linear_Search 
{
    public static Integer LinearSearch(List<Integer> SeachIt, Integer SearchValue)
    {
        Integer Steps=0;
        
        for(Integer i=0;i < SeachIt.size(); i++)
        {
            steps++;
            
            if(SeachIt[i]==SearchValue)
            {
                system.debug('It took'+' '+Steps+' '+'to search');
                return 1;
            }
        }
        system.debug('It took'+' '+Steps+' '+'to search');
        return -1;
    }
}