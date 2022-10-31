public with sharing class Binary_Search 
{
    public static Integer BinarySearch(List<Integer> SearchIt, Integer SearchValue)
    {
        Integer steps=0;
        Integer left=0;
        Integer right=SearchIt.size();
        
        while(left < right)
        {
           Integer middle =(left+right)/2;
            
           If(SearchIt[middle]== SearchValue)
           {
               return middle;
           }         
            If(SearchValue < SearchIt[middle])
            {
                right = middle-1;
            }else 
           {
               left = middle -1;
           }
        }
        return -1;
    }
}