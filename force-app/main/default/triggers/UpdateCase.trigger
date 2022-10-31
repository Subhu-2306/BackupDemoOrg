trigger UpdateCase on Case (before insert)
{
    string queueid=[select id from Group where type='Queue' and name='Case Queue'].id;
	for(case c:trigger.new)
        {
            if(c.Origin=='phone')
            {
                c.OwnerId=queueid;
            }
        }
}