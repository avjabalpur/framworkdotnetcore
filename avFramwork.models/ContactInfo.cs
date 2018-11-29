using System;

namespace avFramworktalents.models
{
		/// <summary>
		/// Gets or sets the ContactInfoEntity value.
		/// </summary>
	public class ContactInfo
	{

		/// <summary>
		/// Gets or sets the Id value.
		/// </summary>
		public long Id { get; set; }

		/// <summary>
		/// Gets or sets the ContactName value.
		/// </summary>
		public string ContactName { get; set; }

		/// <summary>
		/// Gets or sets the EmailId value.
		/// </summary>
		public string EmailId { get; set; }

		/// <summary>
		/// Gets or sets the Description value.
		/// </summary>
		public string Description { get; set; }

		/// <summary>
		/// Gets or sets the CreatedDate value.
		/// </summary>
		public DateTime CreatedDate { get; set; }

		/// <summary>
		/// Gets or sets the IsActive value.
		/// </summary>
		public bool IsActive { get; set; }

	}
}
