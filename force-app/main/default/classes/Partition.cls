public class Partition 
{
	 public integer partition(integer [] arr, integer low, integer high){
        integer pivot = arr[(low+high)/2];
        while(low<=high){
            while(arr[low]<pivot){
                low++;  
            }
            while(arr[high]>pivot)
            {
                high--;
            }
            if(low<=high){
                integer temp = arr[low];
                arr[low]=arr[high];
                arr[high]=temp;
                low++;
                high--;
            }
        }
        return low; 
    }
}