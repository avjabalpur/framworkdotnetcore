using System;

namespace avFramworktalents.models
{
		/// <summary>
		/// Gets or sets the DiscussionEntity value.
		/// </summary>
	public class Discussion
	{

		/// <summary>
		/// Gets or sets the Id value.
		/// </summary>
		public long Id { get; set; }

		/// <summary>
		/// Gets or sets the Title value.
		/// </summary>
		public string Title { get; set; }

		/// <summary>
		/// Gets or sets the CreatedBy value.
		/// </summary>
		public long CreatedBy { get; set; }

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

	}
}
