using System;

namespace avFramworktalents.models
{
		/// <summary>
		/// Gets or sets the GroupEventEntity value.
		/// </summary>
	public class GroupEvent
	{

		/// <summary>
		/// Gets or sets the Id value.
		/// </summary>
		public long Id { get; set; }

		/// <summary>
		/// Gets or sets the Name value.
		/// </summary>
		public string Name { get; set; }

		/// <summary>
		/// Gets or sets the StartDate value.
		/// </summary>
		public DateTime StartDate { get; set; }

		/// <summary>
		/// Gets or sets the EndDate value.
		/// </summary>
		public DateTime EndDate { get; set; }

		/// <summary>
		/// Gets or sets the IsStarted value.
		/// </summary>
		public bool IsStarted { get; set; }

		/// <summary>
		/// Gets or sets the EventImage value.
		/// </summary>
		public string EventImage { get; set; }

		/// <summary>
		/// Gets or sets the RoundDuration value.
		/// </summary>
		public decimal RoundDuration { get; set; }

		/// <summary>
		/// Gets or sets the NoOfVideos value.
		/// </summary>
		public string NoOfVideos { get; set; }

		/// <summary>
		/// Gets or sets the DaysDurations value.
		/// </summary>
		public int DaysDurations { get; set; }

		/// <summary>
		/// Gets or sets the RoundOrderNo value.
		/// </summary>
		public int RoundOrderNo { get; set; }

		/// <summary>
		/// Gets or sets the ShowVotes value.
		/// </summary>
		public bool ShowVotes { get; set; }

		/// <summary>
		/// Gets or sets the IsActive value.
		/// </summary>
		public bool IsActive { get; set; }

	}
}
