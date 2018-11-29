using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using avFramworktalents.Core;

namespace avFramworktalents.models
{
		/// <summary>
		/// Gets or sets the TokenEntity value.
		/// </summary>
	public class Token : BaseModel
	{

		/// <summary>
		/// Gets or sets the Id value.
		/// </summary>
		public long Id { get; set; }

        /// <summary>
        /// Gets or sets the Name value.
        /// </summary>

        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        public string Name { get; set; }

        /// <summary>
        /// Gets or sets the NoOfUploadsAllowed value.
        /// </summary>
        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        public int NoOfUploadsAllowed { get; set; }

        /// <summary>
        /// Gets or sets the Amount value.
        /// </summary>
        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        public int Amount { get; set; }

		/// <summary>
		/// Gets or sets the IsActive value.
		/// </summary>
		public bool IsActive { get; set; }

        /// <summary>
        /// Gets or sets the ExpireDurationInDays value.
        /// </summary>
        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        public int ExpireDurationInDays { get; set; }

		/// <summary>
		/// Gets or sets the Description value.
		/// </summary>
		public string Description { get; set; }

		/// <summary>
		/// Gets or sets the IsDeleted value.
		/// </summary>
		public bool IsDeleted { get; set; }

	}
}
