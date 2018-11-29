using System;

namespace avFramworktalents.models
{
		/// <summary>
		/// Gets or sets the VideoGalleryEntity value.
		/// </summary>
	public class VideoGallery
	{

		/// <summary>
		/// Gets or sets the Id value.
		/// </summary>
		public long Id { get; set; }

		/// <summary>
		/// Gets or sets the CategoryId value.
		/// </summary>
		public long CategoryId { get; set; }

		/// <summary>
		/// Gets or sets the VideoUrl value.
		/// </summary>
		public string VideoUrl { get; set; }

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

		/// <summary>
		/// Gets or sets the VideoTitle value.
		/// </summary>
		public string VideoTitle { get; set; }

		/// <summary>
		/// Gets or sets the FileName value.
		/// </summary>
		public string FileName { get; set; }

	}
}
