public with sharing class InsertionSort 
{  
    public static void sort(List<Integer> valuesToSort)
    {
        
        for (Integer i = 1; i < valuesToSort.size(); i++)
        {
            Integer current = valuesToSort[i];
            Integer j = i - 1;
            
            while (j >= 0 && valuesToSort[j] > current)
            {
                valuesToSort[j + 1] = valuesToSort[j];
                j--;
            }
            valuesToSort[j + 1] = current;
        }
    }
}