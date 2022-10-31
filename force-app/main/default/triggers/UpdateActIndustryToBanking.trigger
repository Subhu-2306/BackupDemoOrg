trigger UpdateActIndustryToBanking on Account (before insert,before update) 
{
    For(Account a:trigger.new)
    {
        If(a.rating=='Cold')
        {
            a.type='Prospect';
        }
    }
}