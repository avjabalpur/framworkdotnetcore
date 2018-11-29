using System;

namespace avFramworktalents.models
{
		/// <summary>
		/// Gets or sets the ProfileImagesEntity value.
		/// </summary>
	public class ProfileImages
	{

		/// <summary>
		/// Gets or sets the Id value.
		/// </summary>
		public long Id { get; set; }

		/// <summary>
		/// Gets or sets the ImageName value.
		/// </summary>
		public string ImageName { get; set; }

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
		/// Gets or sets the ImageDescription value.
		/// </summary>
		public string ImageDescription { get; set; }

	}
}
