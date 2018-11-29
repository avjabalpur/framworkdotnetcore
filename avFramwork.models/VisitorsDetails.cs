using System;

namespace avFramworktalents.models
{
		/// <summary>
		/// Gets or sets the VisitorsDetailsEntity value.
		/// </summary>
	public class VisitorsDetails
	{

		/// <summary>
		/// Gets or sets the Id value.
		/// </summary>
		public int Id { get; set; }

		/// <summary>
		/// Gets or sets the IP value.
		/// </summary>
		public string IP { get; set; }

		/// <summary>
		/// Gets or sets the Date value.
		/// </summary>
		public DateTime Date { get; set; }

		/// <summary>
		/// Gets or sets the CountryName value.
		/// </summary>
		public string CountryName { get; set; }

		/// <summary>
		/// Gets or sets the City value.
		/// </summary>
		public string City { get; set; }

		/// <summary>
		/// Gets or sets the ZipCode value.
		/// </summary>
		public string ZipCode { get; set; }

		/// <summary>
		/// Gets or sets the Count value.
		/// </summary>
		public int Count { get; set; }

		/// <summary>
		/// Gets or sets the IsDeleted value.
		/// </summary>
		public bool IsDeleted { get; set; }

	}
}
