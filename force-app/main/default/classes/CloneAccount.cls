public class CloneAccount 
{
    public static void Accountrecord(list<account> lcclist)
    {
        if (CheckRun.runonce())
        {
            list<account> newlist = new list<account>();
            newlist = lcclist.deepclone();
            insert newlist;
        }
     }
}