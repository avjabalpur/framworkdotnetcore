using System;

namespace avFramworktalents.models
{
		/// <summary>
		/// Gets or sets the ForumDiscussionCommentsEntity value.
		/// </summary>
	public class ForumDiscussionComments
	{

		/// <summary>
		/// Gets or sets the Id value.
		/// </summary>
		public long Id { get; set; }

		/// <summary>
		/// Gets or sets the Comment value.
		/// </summary>
		public string Comment { get; set; }

		/// <summary>
		/// Gets or sets the CommentBy value.
		/// </summary>
		public long CommentBy { get; set; }

		/// <summary>
		/// Gets or sets the IsActive value.
		/// </summary>
		public bool IsActive { get; set; }

		/// <summary>
		/// Gets or sets the IsDeleted value.
		/// </summary>
		public bool IsDeleted { get; set; }

		/// <summary>
		/// Gets or sets the CreatedOn value.
		/// </summary>
		public DateTime CreatedOn { get; set; }

		/// <summary>
		/// Gets or sets the UpdatedOn value.
		/// </summary>
		public DateTime UpdatedOn { get; set; }

		/// <summary>
		/// Gets or sets the DicussionId value.
		/// </summary>
		public long DicussionId { get; set; }

	}
}
