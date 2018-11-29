using System;

namespace avFramworktalents.models
{
		/// <summary>
		/// Gets or sets the EventsEntity value.
		/// </summary>
	public class Events
	{

		/// <summary>
		/// Gets or sets the Id value.
		/// </summary>
		public long Id { get; set; }

		/// <summary>
		/// Gets or sets the CreatorId value.
		/// </summary>
		public long CreatorId { get; set; }

		/// <summary>
		/// Gets or sets the EventTitle value.
		/// </summary>
		public string EventTitle { get; set; }

		/// <summary>
		/// Gets or sets the EventDesc value.
		/// </summary>
		public string EventDesc { get; set; }

		/// <summary>
		/// Gets or sets the EventStartDate value.
		/// </summary>
		public DateTime EventStartDate { get; set; }

		/// <summary>
		/// Gets or sets the EventImage value.
		/// </summary>
		public string EventImage { get; set; }

		/// <summary>
		/// Gets or sets the EventEndDate value.
		/// </summary>
		public DateTime EventEndDate { get; set; }

		/// <summary>
		/// Gets or sets the CreateDate value.
		/// </summary>
		public DateTime CreateDate { get; set; }

		/// <summary>
		/// Gets or sets the IsActive value.
		/// </summary>
		public bool IsActive { get; set; }

		/// <summary>
		/// Gets or sets the IsDeleted value.
		/// </summary>
		public bool IsDeleted { get; set; }

		/// <summary>
		/// Gets or sets the ShowVotes value.
		/// </summary>
		public bool ShowVotes { get; set; }

		/// <summary>
		/// Gets or sets the BackStageCompletionDate value.
		/// </summary>
		public DateTime BackStageCompletionDate { get; set; }

		/// <summary>
		/// Gets or sets the IsSemiFinalistSelected value.
		/// </summary>
		public bool IsSemiFinalistSelected { get; set; }

		/// <summary>
		/// Gets or sets the GroupEventId value.
		/// </summary>
		public long GroupEventId { get; set; }

		/// <summary>
		/// Gets or sets the EventRoundStatusId value.
		/// </summary>
		public long EventRoundStatusId { get; set; }

		/// <summary>
		/// Gets or sets the CurrentRoundEndDate value.
		/// </summary>
		public DateTime CurrentRoundEndDate { get; set; }

		/// <summary>
		/// Gets or sets the EventType value.
		/// </summary>
		public int EventType { get; set; }

	}
}
