using Newtonsoft.Json;
using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace avFramworktalents.models
{
		/// <summary>
		/// Gets or sets the GrantedTokensEntity value.
		/// </summary>
	public class GrantedTokens : BaseModel
	{

		/// <summary>
		/// Gets or sets the UniqueToken value.
		/// </summary>
		public string UniqueToken { get; set; }

		/// <summary>
		/// Gets or sets the UserId value.
		/// </summary>
		public long UserId { get; set; }

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
        /// Gets or sets the UserId value.
        /// </summary>
        [NotMapped]
        public string UserName { get; set; }

    }
}
