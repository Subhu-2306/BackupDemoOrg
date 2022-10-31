public with sharing class SelectionSort 
{
  public static void sort(List<Integer> sortkro) 
  {
    Integer listLength = sortkro.size() - 1;
    for (Integer i = 0; i < listLength; i++) 
    {
      Integer minIndex = i;
      for (Integer j = i + 1; j <= listLength; j++) 
      {
        System.debug(
          LoggingLevel.INFO,
          'comparing ' +
          sortkro[j] +
          ' ' +
          sortkro[i]
        );
        if (sortkro[j] < sortkro[minIndex]) 
        {
          minIndex = j;
        }
      }
      Integer temp = sortkro[i];
      sortkro[i] = sortkro[minIndex];
      sortkro[minIndex] = temp;
      System.debug(LoggingLevel.INFO, 'sortkro after inner loop ' + sortkro);
    }
    System.debug(LoggingLevel.INFO, 'Value of sorted list = ' + sortkro);
  }
}