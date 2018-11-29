using System;

namespace avFramworktalents.models
{
		/// <summary>
		/// Gets or sets the EventWinnersEntity value.
		/// </summary>
	public class EventWinners
	{

		/// <summary>
		/// Gets or sets the Id value.
		/// </summary>
		public long Id { get; set; }

		/// <summary>
		/// Gets or sets the IsActive value.
		/// </summary>
		public bool IsActive { get; set; }

		/// <summary>
		/// Gets or sets the CreatedDate value.
		/// </summary>
		public DateTime CreatedDate { get; set; }

		/// <summary>
		/// Gets or sets the VideoId value.
		/// </summary>
		public long VideoId { get; set; }

		/// <summary>
		/// Gets or sets the EventId value.
		/// </summary>
		public long EventId { get; set; }

		/// <summary>
		/// Gets or sets the EventTypeId value.
		/// </summary>
		public long EventTypeId { get; set; }

	}
}
