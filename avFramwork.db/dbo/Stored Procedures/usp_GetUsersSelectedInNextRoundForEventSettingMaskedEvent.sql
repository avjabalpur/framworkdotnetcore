CREATE PROCEDURE  [dbo].[usp_GetUsersSelectedInNextRoundForEventSettingMaskedEvent] --[usp_GetUsersSelectedInNextRoundForEventSettingMaskedEvent] 11,1

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
			    MaskingType.Id as MaskingTypeId,
   MaskingType.Name as MaskingTypeName,
    (select RoundName from [dbo].[EventSetting] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic
		    
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId
      WHERE vd.eventid=@RoundNo AND vd.EventTypeId=@EventTypeId AND vd.IsDeleted = 0 --AND vd.IsActive=0
  END

else IF(@RoundNo = 2) 
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
			   vd.CreatedDate as CreatedDate,
			    MaskingType.Id as MaskingTypeId,
				evnt.ShowVotes as ShowVotes,
   MaskingType.Name as MaskingTypeName,
   
    (select RoundName from [dbo].[EventSetting] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic
   
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		    join  [dbo].[EventSetting] evnt on evnt.id = vd.EventId
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId	
	  
      WHERE vd.EventTypeId=@EventTypeId AND vd.EventId=@RoundNo AND vd.IsDeleted = 0 
  END
 else IF(@RoundNo = 3) 
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
			   vd.CreatedDate as CreatedDate,
			    MaskingType.Id as MaskingTypeId,
				evnt.ShowVotes as ShowVotes,
   MaskingType.Name as MaskingTypeName,
   
    (select RoundName from [dbo].[EventSetting] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic  
		    
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		    join  [dbo].[EventSetting] evnt on evnt.id = vd.EventId
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId
	
	
      WHERE vd.EventTypeId=@EventTypeId AND vd.EventId=@RoundNo AND vd.IsDeleted = 0 
  END
 else IF(@RoundNo = 4) 
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
			   vd.CreatedDate as CreatedDate,
			    MaskingType.Id as MaskingTypeId,
				evnt.ShowVotes as ShowVotes,
   MaskingType.Name as MaskingTypeName,
   
    (select RoundName from [dbo].[EventSetting] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic
   
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		    join  [dbo].[EventSetting] evnt on evnt.id = vd.EventId
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId
		 
      WHERE vd.EventTypeId=@EventTypeId AND vd.EventId=@RoundNo AND vd.IsDeleted = 0 
  END
 else IF(@RoundNo = 5) 
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
			   vd.CreatedDate as CreatedDate,
			    MaskingType.Id as MaskingTypeId,
				evnt.ShowVotes as ShowVotes,
   MaskingType.Name as MaskingTypeName,
   
    (select RoundName from [dbo].[EventSetting] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic
 
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		    join  [dbo].[EventSetting] evnt on evnt.id = vd.EventId
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId	
	
      WHERE vd.EventTypeId=@EventTypeId AND vd.EventId=@RoundNo AND vd.IsDeleted = 0
  END
else  IF(@RoundNo = 6) 
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
			   vd.CreatedDate as CreatedDate,
			    MaskingType.Id as MaskingTypeId,
				evnt.ShowVotes as ShowVotes,
   MaskingType.Name as MaskingTypeName,
   
    (select RoundName from [dbo].[EventSetting] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic  
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		    join  [dbo].[EventSetting] evnt on evnt.id = vd.EventId
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId
	
	      WHERE vd.EventTypeId=@EventTypeId AND vd.EventId=@RoundNo AND vd.IsDeleted = 0 
  END
 else IF(@RoundNo = 7) 
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
			   vd.CreatedDate as CreatedDate,
			    MaskingType.Id as MaskingTypeId,
				evnt.ShowVotes as ShowVotes,
   MaskingType.Name as MaskingTypeName,
   
    (select RoundName from [dbo].[EventSetting] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic
 
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		    join  [dbo].[EventSetting] evnt on evnt.id = vd.EventId
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId	
	  
      WHERE vd.EventTypeId=@EventTypeId AND vd.EventId=@RoundNo AND vd.IsDeleted = 0 
  END
 else IF(@RoundNo = 8) 
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
			   vd.CreatedDate as CreatedDate,
			    MaskingType.Id as MaskingTypeId,
				evnt.ShowVotes as ShowVotes,
   MaskingType.Name as MaskingTypeName,
   
    (select RoundName from [dbo].[EventSetting] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic
   
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		    join  [dbo].[EventSetting] evnt on evnt.id = vd.EventId
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId	
	
      WHERE vd.EventTypeId=@EventTypeId AND vd.EventId=@RoundNo AND vd.IsDeleted = 0 
  END
  
 else IF(@RoundNo = 9) 
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
			   vd.CreatedDate as CreatedDate,
			    MaskingType.Id as MaskingTypeId,
				evnt.ShowVotes as ShowVotes,
   MaskingType.Name as MaskingTypeName,
   
    (select RoundName from [dbo].[EventSetting] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic
 
		    
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		    join  [dbo].[EventSetting] evnt on evnt.id = vd.EventId
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId
	join EventWinners ev on ev.VideoId=vd.Id
	
      WHERE ev.EventTypeId=@EventTypeId AND ev.EventId=@RoundNo 
  END
 else  IF(@RoundNo = 10) 
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
			   vd.CreatedDate as CreatedDate,
			    MaskingType.Id as MaskingTypeId,
				evnt.ShowVotes as ShowVotes,
   MaskingType.Name as MaskingTypeName,
   
    (select RoundName from [dbo].[EventSetting] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic  
		    
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		    join  [dbo].[EventSetting] evnt on evnt.id = vd.EventId
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId
	join EventWinners ev on ev.VideoId=vd.Id
	       WHERE ev.EventTypeId=@EventTypeId AND ev.EventId=@RoundNo 
  END
 else   IF(@RoundNo = 11) 
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
			   vd.CreatedDate as CreatedDate,
			    MaskingType.Id as MaskingTypeId,
				evnt.ShowVotes as ShowVotes,
   MaskingType.Name as MaskingTypeName,
   
    (select RoundName from [dbo].[EventSetting] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic
  		    
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		    join  [dbo].[EventSetting] evnt on evnt.id = vd.EventId
			 join EventWinners ev on ev.VideoId=vd.Id
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId
    
	
      WHERE ev.EventTypeId=@EventTypeId AND ev.EventId=@RoundNo 

	 
  END
   else
   BEGIN
    set @EventTypeId=(select eventtype from [dbo].[EventSetting] where Id= @RoundNo)
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
			    MaskingType.Id as MaskingTypeId,
   MaskingType.Name as MaskingTypeName,
    (select RoundName from [dbo].[EventSetting] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic
		    
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId
      WHERE vd.eventid=@RoundNo AND vd.EventTypeId=@EventTypeId AND vd.IsDeleted = 0 --AND vd.IsActive=0
   END

  END