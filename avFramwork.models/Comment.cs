using System;

namespace avFramworktalents.models
{
		/// <summary>
		/// Gets or sets the CommentEntity value.
		/// </summary>
	public class Comment
	{

		/// <summary>
		/// Gets or sets the Id value.
		/// </summary>
		public long Id { get; set; }

		/// <summary>
		/// Gets or sets the UserId value.
		/// </summary>
		public long UserId { get; set; }

		/// <summary>
		/// Gets or sets the VideoId value.
		/// </summary>
		public long VideoId { get; set; }

		/// <summary>
		/// Gets or sets the CommentText value.
		/// </summary>
		public string CommentText { get; set; }

		/// <summary>
		/// Gets or sets the CreatedDate value.
		/// </summary>
		public DateTime CreatedDate { get; set; }

		/// <summary>
		/// Gets or sets the IsActive value.
		/// </summary>
		public bool IsActive { get; set; }

		/// <summary>
		/// Gets or sets the IsDeleted value.
		/// </summary>
		public bool IsDeleted { get; set; }

	}
}
