using System;

namespace avFramworktalents.models
{
		/// <summary>
		/// Gets or sets the UserTokensRequestsEntity value.
		/// </summary>
	public class UserTokensRequests
	{

		/// <summary>
		/// Gets or sets the Id value.
		/// </summary>
		public long Id { get; set; }

		/// <summary>
		/// Gets or sets the RequestedByUserId value.
		/// </summary>
		public long RequestedByUserId { get; set; }

		/// <summary>
		/// Gets or sets the TokenId value.
		/// </summary>
		public long TokenId { get; set; }

		/// <summary>
		/// Gets or sets the CreatedOn value.
		/// </summary>
		public DateTime CreatedOn { get; set; }

		/// <summary>
		/// Gets or sets the IsActive value.
		/// </summary>
		public bool IsActive { get; set; }

		/// <summary>
		/// Gets or sets the IsDeleted value.
		/// </summary>
		public bool IsDeleted { get; set; }

		/// <summary>
		/// Gets or sets the IsGranted value.
		/// </summary>
		public bool IsGranted { get; set; }

		/// <summary>
		/// Gets or sets the GrantedTokenId value.
		/// </summary>
		public long GrantedTokenId { get; set; }

		/// <summary>
		/// Gets or sets the GrantedOn value.
		/// </summary>
		public DateTime GrantedOn { get; set; }

	}
}
