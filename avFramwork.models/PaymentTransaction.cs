using System;

namespace avFramworktalents.models
{
		/// <summary>
		/// Gets or sets the PaymentTransactionEntity value.
		/// </summary>
	public class PaymentTransaction : BaseModel
	{
		/// <summary>
		/// Gets or sets the UserId value.
		/// </summary>
		public long UserId { get; set; }

		/// <summary>
		/// Gets or sets the TransactionNumber value.
		/// </summary>
		public string TransactionNumber { get; set; }

		/// <summary>
		/// Gets or sets the Amount value.
		/// </summary>
		public float Amount { get; set; }

		/// <summary>
		/// Gets or sets the TokenId value.
		/// </summary>
		public long TokenId { get; set; }

		/// <summary>
		/// Gets or sets the TransactionDate value.
		/// </summary>
		public DateTime TransactionDate { get; set; }

		/// <summary>
		/// Gets or sets the IsDeleted value.
		/// </summary>
		public bool IsDeleted { get; set; }

		/// <summary>
		/// Gets or sets the IsActive value.
		/// </summary>
		public bool IsActive { get; set; }

	}
}
