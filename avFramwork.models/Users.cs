using System;
using System.ComponentModel.DataAnnotations;
using avFramworktalents.Core;

namespace avFramworktalents.models
{
		/// <summary>
		/// Gets or sets the UsersEntity value.
		/// </summary>
	public class Users : BaseModel
    {
        /// <summary>
        /// Gets or sets the UserName value.
        /// </summary>
        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        [RegularExpression(RegexValidation.UserNameValidate,  ErrorMessage = RequiredMessages.InvalidFieldMessage)]
        public string UserName { get; set; }

        /// <summary>
        /// Gets or sets the Email value.
        /// </summary>
        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        [RegularExpression(RegexValidation.EmailValidate, ErrorMessage = RequiredMessages.InvalidFieldMessage)]
        public string Email { get; set; }

        /// <summary>
        /// Gets or sets the FirstName value.
        /// </summary>
        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        [RegularExpression(RegexValidation.NameValidation, ErrorMessage = RequiredMessages.InvalidFieldMessage)]
        public string FirstName { get; set; }

        /// <summary>
        /// Gets or sets the LastName value.
        /// </summary>
        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        [RegularExpression(RegexValidation.NameValidation, ErrorMessage = RequiredMessages.InvalidFieldMessage)]
        public string LastName { get; set; }

		/// <summary>
		/// Gets or sets the ProfilePic value.
		/// </summary>
		public string ProfilePic { get; set; }

		/// <summary>
		/// Gets or sets the CreatedDate value.
		/// </summary>
		public DateTime? CreatedDate { get; set; }

		/// <summary>
		/// Gets or sets the IsActive value.
		/// </summary>
		public bool? IsActive { get; set; }

		/// <summary>
		/// Gets or sets the IsDeleted value.
		/// </summary>
		public bool? IsDeleted { get; set; }

		/// <summary>
		/// Gets or sets the IsToken value.
		/// </summary>
		public bool? IsToken { get; set; }

		/// <summary>
		/// Gets or sets the NumberOfToken value.
		/// </summary>
		public int? NumberOfToken { get; set; }

		/// <summary>
		/// Gets or sets the AboutMe value.
		/// </summary>
		public string AboutMe { get; set; }

		/// <summary>
		/// Gets or sets the Info value.
		/// </summary>
		public string Info { get; set; }

		/// <summary>
		/// Gets or sets the FbConnection value.
		/// </summary>
		public string FbConnection { get; set; }

		/// <summary>
		/// Gets or sets the TwitterConnection value.
		/// </summary>
		public string TwitterConnection { get; set; }

		/// <summary>
		/// Gets or sets the GooglePlusConnection value.
		/// </summary>
		public string GooglePlusConnection { get; set; }

		/// <summary>
		/// Gets or sets the Country value.
		/// </summary>
		public string Country { get; set; }

		/// <summary>
		/// Gets or sets the State value.
		/// </summary>
		public string State { get; set; }

        /// <summary>
        /// Gets or sets the City value.
        /// </summary>
        [RegularExpression(RegexValidation.CityValidate, ErrorMessage = RequiredMessages.InvalidFieldMessage)]
        public string City { get; set; }

        /// <summary>
        /// Gets or sets the ZipCode value.
        /// </summary>
        [RegularExpression(RegexValidation.ZipValidate, ErrorMessage = RequiredMessages.InvalidFieldMessage)]
        public string ZipCode { get; set; }

        /// <summary>
        /// Gets or sets the Age value.
        /// </summary>
        [RegularExpression(RegexValidation.NumberValidate, ErrorMessage = RequiredMessages.InvalidFieldMessage)]
        public int? Age { get; set; }

        /// <summary>
        /// Gets or sets the Dbo value.
        /// </summary>
        //[RegularExpression(RegexValidation.DateValidate, ErrorMessage = RequiredMessages.InvalidFieldMessage)]
        public DateTime? Dbo { get; set; }

		/// <summary>
		/// Gets or sets the Promocode value.
		/// </summary>
		public string Promocode { get; set; }

		/// <summary>
		/// Gets or sets the Refralcode value.
		/// </summary>
		public string Refralcode { get; set; }


        /// <summary>
        /// Gets or sets the EncrptPassword value.
        /// </summary>
        public string EncrptPassword { get; set; }

    }
}
