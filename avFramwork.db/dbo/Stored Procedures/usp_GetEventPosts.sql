CREATE PROCEDURE [dbo].[usp_GetEventPosts]--  [dbo].[usp_GetEventPosts] 10,1,1
@RoundNo INT,
@EventTypeId int,
@UserId int
AS
BEGIN
IF(@RoundNo = 1) 
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
   COALESCE(usr.profilepic,'') As profilePic,
    (select count(VideoId) from comment where VideoId=vd.id) as CommentCount,
               (select count(VideoId) from vote where VideoId=vd.id and isvote=1) as VoteCount,
		       CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS IsVote
				--dbo.GetIsVoted(vd.Id, @EventTypeId, @UserId, @RoundNo) As IsVote
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		    join  [dbo].[EventSetting] evnt on evnt.id = vd.EventId
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId
	   LEFT JOIN vote vt on  vt.videoId=vd.id and isvote=1 and vt.userid=@UserId
      WHERE vd.EventTypeId=@EventTypeId AND vd.EventId=@RoundNo AND vd.IsDeleted = 0 AND vd.IsActive=0
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
   COALESCE(usr.profilepic,'') As profilePic,
    (select count(VideoId) from comment where VideoId=vd.id) as CommentCount,
               (select count(VideoId) from vote where VideoId=vd.id and isvote=1) as VoteCount,
		       --CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS IsVote
				dbo.GetIsVoted(vd.Id, @EventTypeId, @UserId, @RoundNo) As IsVote
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		    join  [dbo].[EventSetting] evnt on evnt.id = vd.EventId
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId
	   LEFT JOIN vote vt on  vt.videoId=vd.id and isvote=1 and vt.userid=@UserId
      WHERE vd.EventTypeId=@EventTypeId AND vd.EventId=@RoundNo AND vd.IsDeleted = 0 AND vd.IsActive=0
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
   COALESCE(usr.profilepic,'') As profilePic,
    (select count(VideoId) from comment where VideoId=vd.id) as CommentCount,
               (select count(VideoId) from vote where VideoId=vd.id and isvote=1) as VoteCount,
		       --CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS IsVote
				dbo.GetIsVoted(vd.Id, @EventTypeId, @UserId, @RoundNo) As IsVote
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		    join  [dbo].[EventSetting] evnt on evnt.id = vd.EventId
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId
	   LEFT JOIN vote vt on  vt.videoId=vd.id and isvote=1 and vt.userid=@UserId
      WHERE vd.EventTypeId=@EventTypeId AND vd.EventId=@RoundNo AND vd.IsDeleted = 0 AND vd.IsActive=0
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
   COALESCE(usr.profilepic,'') As profilePic,
    (select count(VideoId) from comment where VideoId=vd.id) as CommentCount,
               (select count(VideoId) from vote where VideoId=vd.id and isvote=1) as VoteCount,
		       --CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS IsVote
				dbo.GetIsVoted(vd.Id, @EventTypeId, @UserId, @RoundNo) As IsVote
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		    join  [dbo].[EventSetting] evnt on evnt.id = vd.EventId
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId
	   LEFT JOIN vote vt on  vt.videoId=vd.id and isvote=1 and vt.userid=@UserId
      WHERE vd.EventTypeId=@EventTypeId AND vd.EventId=@RoundNo AND vd.IsDeleted = 0 AND vd.IsActive=0
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
   COALESCE(usr.profilepic,'') As profilePic,
    (select count(VideoId) from comment where VideoId=vd.id) as CommentCount,
               (select count(VideoId) from vote where VideoId=vd.id and isvote=1) as VoteCount,
		       --CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS IsVote
				dbo.GetIsVoted(vd.Id, @EventTypeId, @UserId, @RoundNo) As IsVote
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		    join  [dbo].[EventSetting] evnt on evnt.id = vd.EventId
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId
	   LEFT JOIN vote vt on  vt.videoId=vd.id and isvote=1 and vt.userid=@UserId
      WHERE vd.EventTypeId=@EventTypeId AND vd.EventId=@RoundNo AND vd.IsDeleted = 0 AND vd.IsActive=0
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
   COALESCE(usr.profilepic,'') As profilePic,
    (select count(VideoId) from comment where VideoId=vd.id) as CommentCount,
               (select count(VideoId) from vote where VideoId=vd.id and isvote=1) as VoteCount,
		       --CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS IsVote
				dbo.GetIsVoted(vd.Id, @EventTypeId, @UserId, @RoundNo) As IsVote
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		    join  [dbo].[EventSetting] evnt on evnt.id = vd.EventId
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId
	   LEFT JOIN vote vt on  vt.videoId=vd.id and isvote=1 and vt.userid=@UserId
      WHERE vd.EventTypeId=@EventTypeId AND vd.EventId=@RoundNo AND vd.IsDeleted = 0 AND vd.IsActive=0
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
   COALESCE(usr.profilepic,'') As profilePic,
    (select count(VideoId) from comment where VideoId=vd.id) as CommentCount,
               (select count(VideoId) from vote where VideoId=vd.id and isvote=1) as VoteCount,
		       --CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS IsVote
				dbo.GetIsVoted(vd.Id, @EventTypeId, @UserId, @RoundNo) As IsVote
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		    join  [dbo].[EventSetting] evnt on evnt.id = vd.EventId
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId
	   LEFT JOIN vote vt on  vt.videoId=vd.id and isvote=1 and vt.userid=@UserId
      WHERE vd.EventTypeId=@EventTypeId AND vd.EventId=@RoundNo AND vd.IsDeleted = 0 AND vd.IsActive=0
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
   COALESCE(usr.profilepic,'') As profilePic,
    (select count(VideoId) from comment where VideoId=vd.id) as CommentCount,
               (select count(VideoId) from vote where VideoId=vd.id and isvote=1) as VoteCount,
		       --CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS IsVote
				dbo.GetIsVoted(vd.Id, @EventTypeId, @UserId, @RoundNo) As IsVote
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		    join  [dbo].[EventSetting] evnt on evnt.id = vd.EventId
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId
	   LEFT JOIN vote vt on  vt.videoId=vd.id and isvote=1 and vt.userid=@UserId
      WHERE vd.EventTypeId=@EventTypeId AND vd.EventId=@RoundNo AND vd.IsDeleted = 0 AND vd.IsActive=0
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
   COALESCE(usr.profilepic,'') As profilePic,
    (select count(VideoId) from comment where VideoId=vd.id) as CommentCount,
               (select count(VideoId) from vote where VideoId=vd.id and isvote=1) as VoteCount,
		       --CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS IsVote
				dbo.GetIsVoted(vd.Id, @EventTypeId, @UserId, @RoundNo) As IsVote
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		    join  [dbo].[EventSetting] evnt on evnt.id = vd.EventId
			join dbo.EventWinners ev on ev.VideoId=vd.Id
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId
	   LEFT JOIN vote vt on  vt.videoId=vd.id and isvote=1 and vt.userid=@UserId
      WHERE ev.EventTypeId=@EventTypeId AND ev.EventId=@RoundNo AND vd.IsDeleted = 0 AND vd.IsActive=0
  END
 else IF(@RoundNo = 10) 
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
   COALESCE(usr.profilepic,'') As profilePic,
    (select count(VideoId) from comment where VideoId=vd.id) as CommentCount,
               (select count(VideoId) from vote where VideoId=vd.id and isvote=1) as VoteCount,
		       --CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS IsVote
				dbo.GetIsVoted(vd.Id, @EventTypeId, @UserId, @RoundNo) As IsVote
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		    join  [dbo].[EventSetting] evnt on evnt.id = vd.EventId
			join dbo.EventWinners ev on ev.VideoId=vd.Id
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId
	   LEFT JOIN vote vt on  vt.videoId=vd.id and isvote=1 and vt.userid=@UserId
      WHERE ev.EventTypeId=@EventTypeId AND ev.EventId=@RoundNo AND vd.IsDeleted = 0 AND vd.IsActive=0
  END
 else IF(@RoundNo = 11) 
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
   COALESCE(usr.profilepic,'') As profilePic,
    (select count(VideoId) from comment where VideoId=vd.id) as CommentCount,
               (select count(VideoId) from vote where VideoId=vd.id and isvote=1) as VoteCount,
		       --CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS IsVote
				dbo.GetIsVoted(vd.Id, @EventTypeId, @UserId, @RoundNo) As IsVote
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		    join  [dbo].[EventSetting] evnt on evnt.id = vd.EventId
		 join dbo.EventWinners ev on ev.VideoId=vd.Id
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId
	   LEFT JOIN vote vt on  vt.videoId=vd.id and isvote=1 and vt.userid=@UserId
      WHERE ev.EventTypeId=@EventTypeId AND ev.EventId=@RoundNo AND vd.IsDeleted = 0 AND vd.IsActive=0
  END
 
  else
  Begin
 -- select * from [dbo].[EventSetting] where Id= 13
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
			   vd.CreatedDate as CreatedDate,
			    MaskingType.Id as MaskingTypeId,
				evnt.ShowVotes as ShowVotes,
   MaskingType.Name as MaskingTypeName,
   
    (select RoundName from [dbo].[EventSetting] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic,
    (select count(VideoId) from comment where VideoId=vd.id) as CommentCount,
               (select count(VideoId) from vote where VideoId=vd.id and isvote=1) as VoteCount,
		       CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS IsVote
				--dbo.GetIsVoted(vd.Id, @EventTypeId, @UserId, @RoundNo) As IsVote
           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		    join  [dbo].[EventSetting] evnt on evnt.id = vd.EventId
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId
	   LEFT JOIN vote vt on  vt.videoId=vd.id and isvote=1 and vt.userid=@UserId
      WHERE vd.EventTypeId=@EventTypeId AND vd.EventId=1 AND vd.IsDeleted = 0 AND vd.IsActive=0
  End
 
  END