using System;

namespace avFramworktalents.models
{
		/// <summary>
		/// Gets or sets the VoteEntity value.
		/// </summary>
	public class Vote
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
		/// Gets or sets the IsVote value.
		/// </summary>
		public bool IsVote { get; set; }

		/// <summary>
		/// Gets or sets the CreatedDate value.
		/// </summary>
		public DateTime CreatedDate { get; set; }

		/// <summary>
		/// Gets or sets the VoteEventId value.
		/// </summary>
		public long VoteEventId { get; set; }

	}
}
