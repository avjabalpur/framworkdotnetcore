CREATE PROCEDURE  [dbo].[usp_GetUsersSelectedInNextRound] -- [usp_GetUsersSelectedInNextRound] 1,2
@RoundNo INT,
@EventTypeId int
AS
BEGIN
IF(@RoundNo = 1) -- Round one
  BEGIN
  Select 		     
               usr.[UserName] as UserName,
			 
			   usr.Id as UserId,
			   usr.ProfilePic as ProfilePic,
		      
		       vd.[Id] as VideoId,
	           vd.videotitle as VideoTitle,
			   vd.VideoPath as VideoPath,
			   vd.IsActive as IsVideoActive,
		       vd.VideoDesc as VideoDesc,
			   vd.EventId as EventId,
			  
   
    (select Name from [dbo].[GroupEvent] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic
		    
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
	
      WHERE vd.eventid=@RoundNo AND vd.EventTypeId=@EventTypeId AND vd.IsDeleted = 0
  END
  IF(@RoundNo = 2) 
  BEGIN
  Select 		     
               usr.[UserName] as UserName,
			 
			   usr.Id as UserId,
			   usr.ProfilePic as ProfilePic,
		      
		       vd.[Id] as VideoId,
	           vd.videotitle as VideoTitle,
			   vd.VideoPath as VideoPath,
			   vd.IsActive as IsVideoActive,
		       vd.VideoDesc as VideoDesc,
			   vd.EventId as EventId,
			  
   
    (select Name from [dbo].[GroupEvent] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic
		    
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
	
      WHERE vd.eventid=@RoundNo AND vd.EventTypeId=@EventTypeId AND vd.IsDeleted = 0
  END
  IF(@RoundNo = 3) 
  BEGIN
  Select 		     
               usr.[UserName] as UserName,
			 
			   usr.Id as UserId,
			   usr.ProfilePic as ProfilePic,
		      
		       vd.[Id] as VideoId,
	           vd.videotitle as VideoTitle,
			   vd.VideoPath as VideoPath,
			   vd.IsActive as IsVideoActive,
		       vd.VideoDesc as VideoDesc,
			   vd.EventId as EventId,
			  
   
    (select Name from [dbo].[GroupEvent] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic
		    
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
	
      WHERE vd.eventid=@RoundNo AND vd.EventTypeId=@EventTypeId AND vd.IsDeleted = 0
  END
  IF(@RoundNo = 4) 
  BEGIN
  Select 		     
               usr.[UserName] as UserName,
			 
			   usr.Id as UserId,
			   usr.ProfilePic as ProfilePic,
		      
		       vd.[Id] as VideoId,
	           vd.videotitle as VideoTitle,
			   vd.VideoPath as VideoPath,
			   vd.IsActive as IsVideoActive,
		       vd.VideoDesc as VideoDesc,
			   vd.EventId as EventId,
			  
   
    (select Name from [dbo].[GroupEvent] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic
		    
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
	
      WHERE vd.eventid=@RoundNo AND vd.EventTypeId=@EventTypeId AND vd.IsDeleted = 0
  END
  IF(@RoundNo = 5) 
  BEGIN
  Select 		     
               usr.[UserName] as UserName,
			 
			   usr.Id as UserId,
			   usr.ProfilePic as ProfilePic,
		      
		       vd.[Id] as VideoId,
	           vd.videotitle as VideoTitle,
			   vd.VideoPath as VideoPath,
			   vd.IsActive as IsVideoActive,
		       vd.VideoDesc as VideoDesc,
			   vd.EventId as EventId,
			  
   
    (select Name from [dbo].[GroupEvent] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic
		    
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
	
      WHERE vd.eventid=@RoundNo AND vd.EventTypeId=@EventTypeId AND vd.IsDeleted = 0
  END
  IF(@RoundNo = 6) 
  BEGIN
  Select 		     
               usr.[UserName] as UserName,
			 
			   usr.Id as UserId,
			   usr.ProfilePic as ProfilePic,
		      
		       vd.[Id] as VideoId,
	           vd.videotitle as VideoTitle,
			   vd.VideoPath as VideoPath,
			   vd.IsActive as IsVideoActive,
		       vd.VideoDesc as VideoDesc,
			   vd.EventId as EventId,
			  
   
    (select Name from [dbo].[GroupEvent] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic
		    
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
	
      WHERE vd.eventid=@RoundNo AND vd.EventTypeId=@EventTypeId AND vd.IsDeleted = 0
  END
  IF(@RoundNo = 7) 
  BEGIN
  Select 		     
               usr.[UserName] as UserName,
			 
			   usr.Id as UserId,
			   usr.ProfilePic as ProfilePic,
		      
		       vd.[Id] as VideoId,
	           vd.videotitle as VideoTitle,
			   vd.VideoPath as VideoPath,
			   vd.IsActive as IsVideoActive,
		       vd.VideoDesc as VideoDesc,
			   vd.EventId as EventId,
			  
   
    (select Name from [dbo].[GroupEvent] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic
		    
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
	
      WHERE vd.eventid=@RoundNo AND vd.EventTypeId=@EventTypeId AND vd.IsDeleted = 0
  END
  IF(@RoundNo = 8) 
  BEGIN
  Select 		     
               usr.[UserName] as UserName,
			 
			   usr.Id as UserId,
			   usr.ProfilePic as ProfilePic,
		      
		       vd.[Id] as VideoId,
	           vd.videotitle as VideoTitle,
			   vd.VideoPath as VideoPath,
			   vd.IsActive as IsVideoActive,
		       vd.VideoDesc as VideoDesc,
			   vd.EventId as EventId,
			  
   
    (select Name from [dbo].[GroupEvent] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic
		    
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
	
      WHERE vd.eventid=@RoundNo AND vd.EventTypeId=@EventTypeId AND vd.IsDeleted = 0
  END
  IF(@RoundNo = 9) 
  BEGIN
  Select 		     
               usr.[UserName] as UserName,
			 
			   usr.Id as UserId,
			   usr.ProfilePic as ProfilePic,
		      
		       vd.[Id] as VideoId,
	           vd.videotitle as VideoTitle,
			   vd.VideoPath as VideoPath,
			   vd.IsActive as IsVideoActive,
		       vd.VideoDesc as VideoDesc,
			   vd.EventId as EventId,
			  
   
    (select Name from [dbo].[GroupEvent] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic
		    
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
	  join EventWinners ev on ev.VideoId=vd.Id
      WHERE ev.EventId=@RoundNo AND ev.EventTypeId=@EventTypeId AND vd.IsDeleted = 0
  END
  IF(@RoundNo = 10)
  BEGIN
  Select 		     
               usr.[UserName] as UserName,
			 
			   usr.Id as UserId,
			   usr.ProfilePic as ProfilePic,
		      
		       vd.[Id] as VideoId,
	           vd.videotitle as VideoTitle,
			   vd.VideoPath as VideoPath,
			   vd.IsActive as IsVideoActive,
		       vd.VideoDesc as VideoDesc,
			   vd.EventId as EventId,
			  
   
    (select Name from [dbo].[GroupEvent] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic
		    
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
	  join EventWinners ev on ev.VideoId=vd.Id
      WHERE ev.EventId=@RoundNo AND ev.EventTypeId=@EventTypeId 
  END
  IF(@RoundNo = 11) 
  BEGIN
  Select 		     
               usr.[UserName] as UserName,
			 
			   usr.Id as UserId,
			   usr.ProfilePic as ProfilePic,
		      
		       vd.[Id] as VideoId,
	           vd.videotitle as VideoTitle,
			   vd.VideoPath as VideoPath,
			   vd.IsActive as IsVideoActive,
		       vd.VideoDesc as VideoDesc,
			   vd.EventId as EventId,
			  
   
    (select Name from [dbo].[GroupEvent] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic
		    
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		   join EventWinners ev on ev.VideoId=vd.Id
	
      WHERE ev.EventId=@RoundNo AND ev.EventTypeId=@EventTypeId
  END
 

 
  END