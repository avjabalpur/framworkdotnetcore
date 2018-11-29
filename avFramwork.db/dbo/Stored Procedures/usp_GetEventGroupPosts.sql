CREATE PROCEDURE [dbo].[usp_GetEventGroupPosts] --[dbo].[usp_GetEventGroupPosts] 1,2,1
@RoundNo INT,
@EventTypeId int,
@UserId int
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
			   evnt.ShowVotes as ShowVotes,
			 vd.[CreatedDate] as CreatedDate,
    (select Name from [dbo].[GroupEvent] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic,
    (select count(VideoId) from comment where VideoId=vd.Id) as CommentCount,

    (select count(VideoId) from vote where VideoId=vd.Id and isvote=1) as VoteCount,		     
          
		    CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS IsVote
			--CAST(dbo.GetIsVoted(vd.Id, @EventTypeId, @UserId, @RoundNo) As Bit) As IsVote

           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		   join  [dbo].[GroupEvent] evnt on evnt.id = vd.EventId
	 LEFT JOIN vote vt on  vt.videoId=vd.id and isvote=1 and vt.userid=@UserId
      WHERE vd.EventId=@RoundNo AND vd.EventTypeId=@EventTypeId AND vd.IsDeleted = 0 AND vd.IsActive=0
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
			   evnt.ShowVotes as ShowVotes,
			 vd.[CreatedDate] as CreatedDate,
    (select Name from [dbo].[GroupEvent] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic,
    (select count(VideoId) from comment where VideoId=vd.Id) as CommentCount,

    (select count(VideoId) from vote where VideoId=vd.Id and isvote=1) as VoteCount,		     
          
		    CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS IsVote
			--Case When dbo.GetIsVoted(vd.Id, @EventTypeId, @UserId, @RoundNo) As IsVote

           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		   join  [dbo].[GroupEvent] evnt on evnt.id = vd.EventId
	 LEFT JOIN vote vt on  vt.videoId=vd.id and isvote=1 and vt.userid=@UserId
      WHERE vd.EventId=@RoundNo AND vd.EventTypeId=@EventTypeId AND vd.IsDeleted = 0 AND vd.IsActive=0
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
			   evnt.ShowVotes as ShowVotes,
			 vd.[CreatedDate] as CreatedDate,
    (select Name from [dbo].[GroupEvent] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic,
    (select count(VideoId) from comment where VideoId=vd.Id) as CommentCount,

    (select count(VideoId) from vote where VideoId=vd.Id and isvote=1) as VoteCount,		     
          
		    --CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS IsVote
			dbo.GetIsVoted(vd.Id, @EventTypeId, @UserId, @RoundNo) As IsVote

           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		   join  [dbo].[GroupEvent] evnt on evnt.id = vd.EventId
	 LEFT JOIN vote vt on  vt.videoId=vd.id and isvote=1 and vt.userid=@UserId
      WHERE vd.EventId=@RoundNo AND vd.EventTypeId=@EventTypeId AND vd.IsDeleted = 0 AND vd.IsActive=0
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
			   evnt.ShowVotes as ShowVotes,
			 vd.[CreatedDate] as CreatedDate,
    (select Name from [dbo].[GroupEvent] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic,
    (select count(VideoId) from comment where VideoId=vd.Id) as CommentCount,

    (select count(VideoId) from vote where VideoId=vd.Id and isvote=1) as VoteCount,		     
          
		    --CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS IsVote
			dbo.GetIsVoted(vd.Id, @EventTypeId, @UserId, @RoundNo) As IsVote

           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		   join  [dbo].[GroupEvent] evnt on evnt.id = vd.EventId
	 LEFT JOIN vote vt on  vt.videoId=vd.id and isvote=1 and vt.userid=@UserId
      WHERE vd.EventId=@RoundNo AND vd.EventTypeId=@EventTypeId AND vd.IsDeleted = 0 AND vd.IsActive=0
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
			   evnt.ShowVotes as ShowVotes,
			 vd.[CreatedDate] as CreatedDate,
    (select Name from [dbo].[GroupEvent] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic,
    (select count(VideoId) from comment where VideoId=vd.Id) as CommentCount,

    (select count(VideoId) from vote where VideoId=vd.Id and isvote=1) as VoteCount,		     
          
		    --CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS IsVote
			dbo.GetIsVoted(vd.Id, @EventTypeId, @UserId, @RoundNo) As IsVote

           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		   join  [dbo].[GroupEvent] evnt on evnt.id = vd.EventId
	 LEFT JOIN vote vt on  vt.videoId=vd.id and isvote=1 and vt.userid=@UserId
      WHERE vd.EventId=@RoundNo AND vd.EventTypeId=@EventTypeId AND vd.IsDeleted = 0 AND vd.IsActive=0
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
			   evnt.ShowVotes as ShowVotes,
			 vd.[CreatedDate] as CreatedDate,
    (select Name from [dbo].[GroupEvent] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic,
    (select count(VideoId) from comment where VideoId=vd.Id) as CommentCount,

    (select count(VideoId) from vote where VideoId=vd.Id and isvote=1) as VoteCount,		     
          
		    --CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS IsVote
			dbo.GetIsVoted(vd.Id, @EventTypeId, @UserId, @RoundNo) As IsVote

           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		   join  [dbo].[GroupEvent] evnt on evnt.id = vd.EventId
	 LEFT JOIN vote vt on  vt.videoId=vd.id and isvote=1 and vt.userid=@UserId
      WHERE vd.EventId=@RoundNo AND vd.EventTypeId=@EventTypeId AND vd.IsDeleted = 0 AND vd.IsActive=0
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
			   evnt.ShowVotes as ShowVotes,
			 vd.[CreatedDate] as CreatedDate,
    (select Name from [dbo].[GroupEvent] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic,
    (select count(VideoId) from comment where VideoId=vd.Id) as CommentCount,

    (select count(VideoId) from vote where VideoId=vd.Id and isvote=1) as VoteCount,		     
          
		    --CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS IsVote
			dbo.GetIsVoted(vd.Id, @EventTypeId, @UserId, @RoundNo) As IsVote

           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		   join  [dbo].[GroupEvent] evnt on evnt.id = vd.EventId
	 LEFT JOIN vote vt on  vt.videoId=vd.id and isvote=1 and vt.userid=@UserId
      WHERE vd.EventId=@RoundNo AND vd.EventTypeId=@EventTypeId AND vd.IsDeleted = 0 AND vd.IsActive=0
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
			   evnt.ShowVotes as ShowVotes,
			 vd.[CreatedDate] as CreatedDate,
    (select Name from [dbo].[GroupEvent] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic,
    (select count(VideoId) from comment where VideoId=vd.Id) as CommentCount,

    (select count(VideoId) from vote where VideoId=vd.Id and isvote=1) as VoteCount,		     
          
		    --CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS IsVote
			dbo.GetIsVoted(vd.Id, @EventTypeId, @UserId, @RoundNo) As IsVote

           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		   join  [dbo].[GroupEvent] evnt on evnt.id = vd.EventId
	 LEFT JOIN vote vt on  vt.videoId=vd.id and isvote=1 and vt.userid=@UserId
      WHERE vd.EventId=@RoundNo AND vd.EventTypeId=@EventTypeId AND vd.IsDeleted = 0 AND vd.IsActive=0
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
			   evnt.ShowVotes as ShowVotes,
			 vd.[CreatedDate] as CreatedDate,
    (select Name from [dbo].[GroupEvent] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic,
    (select count(VideoId) from comment where VideoId=vd.Id) as CommentCount,

    (select count(VideoId) from vote where VideoId=vd.Id and isvote=1) as VoteCount,		     
          
		    --CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS IsVote
			dbo.GetIsVoted(vd.Id, @EventTypeId, @UserId, @RoundNo) As IsVote

           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		   join EventWinners ev on ev.VideoId=vd.Id
		   join  [dbo].[GroupEvent] evnt on evnt.id = vd.EventId
	 LEFT JOIN vote vt on  vt.videoId=vd.id and isvote=1 and vt.userid=@UserId
      WHERE ev.EventId=@RoundNo AND ev.EventTypeId=@EventTypeId 
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
			   evnt.ShowVotes as ShowVotes,
			 vd.[CreatedDate] as CreatedDate,
    (select Name from [dbo].[GroupEvent] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic,
    (select count(VideoId) from comment where VideoId=vd.Id) as CommentCount,

    (select count(VideoId) from vote where VideoId=vd.Id and isvote=1) as VoteCount,		     
          
		    --CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS IsVote
			dbo.GetIsVoted(vd.Id, @EventTypeId, @UserId, @RoundNo) As IsVote

           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		   join dbo.EventWinners ev on ev.VideoId=vd.Id
		   join  [dbo].[GroupEvent] evnt on evnt.id = vd.EventId
	 LEFT JOIN vote vt on  vt.videoId=vd.id and isvote=1 and vt.userid=@UserId
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
			   evnt.ShowVotes as ShowVotes,
			 vd.[CreatedDate] as CreatedDate,
    (select Name from [dbo].[GroupEvent] where Id= @RoundNo) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic,
    (select count(VideoId) from comment where VideoId=vd.Id) as CommentCount,

    (select count(VideoId) from vote where VideoId=vd.Id and isvote=1) as VoteCount,		     
          
		    --CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS IsVote
			dbo.GetIsVoted(vd.Id, @EventTypeId, @UserId, @RoundNo) As IsVote

           from 
           video vd  JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		   join dbo.EventWinners ev on ev.VideoId=vd.Id
		   join  [dbo].[GroupEvent] evnt on evnt.id = vd.EventId
	 LEFT JOIN vote vt on  vt.videoId=vd.id and isvote=1 and vt.userid=@UserId
      WHERE ev.EventId=@RoundNo AND ev.EventTypeId=@EventTypeId 
  END

END