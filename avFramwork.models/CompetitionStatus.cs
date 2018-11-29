using System;

namespace avFramworktalents.models
{
		/// <summary>
		/// Gets or sets the CompetitionStatusEntity value.
		/// </summary>
	public class CompetitionStatus
	{

		/// <summary>
		/// Gets or sets the Id value.
		/// </summary>
		public long Id { get; set; }

		/// <summary>
		/// Gets or sets the CompetitionNo value.
		/// </summary>
		public long CompetitionNo { get; set; }

		/// <summary>
		/// Gets or sets the StartDate value.
		/// </summary>
		public DateTime StartDate { get; set; }

		/// <summary>
		/// Gets or sets the EndDate value.
		/// </summary>
		public DateTime EndDate { get; set; }

		/// <summary>
		/// Gets or sets the IsActive value.
		/// </summary>
		public bool IsActive { get; set; }

		/// <summary>
		/// Gets or sets the EventTypeId value.
		/// </summary>
		public long EventTypeId { get; set; }

	}
}
