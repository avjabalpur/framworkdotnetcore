using System;

namespace avFramworktalents.models
{
		/// <summary>
		/// Gets or sets the ManagetokenEntity value.
		/// </summary>
	public class Managetoken : BaseModel
	{

		/// <summary>
		/// Gets or sets the UserId value.
		/// </summary>
		public long UserId { get; set; }

		/// <summary>
		/// Gets or sets the TokenId value.
		/// </summary>
		public long TokenId { get; set; }

		/// <summary>
		/// Gets or sets the CreateDate value.
		/// </summary>
		public DateTime CreateDate { get; set; }

		/// <summary>
		/// Gets or sets the IsActive value.
		/// </summary>
		public bool IsActive { get; set; }

		/// <summary>
		/// Gets or sets the UniqueTokenId value.
		/// </summary>
		public string UniqueTokenId { get; set; }

		/// <summary>
		/// Gets or sets the WillExpireOn value.
		/// </summary>
		public DateTime WillExpireOn { get; set; }

		/// <summary>
		/// Gets or sets the RemainingUploadCount value.
		/// </summary>
		public int RemainingUploadCount { get; set; }

	}
}
