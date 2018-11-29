using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using avFramworktalents.Core;

namespace avFramworktalents.models
{
		/// <summary>
		/// Gets or sets the VideoEntity value.
		/// </summary>
	public class Video : BaseModel
	{
        /// <summary>
        /// Gets or sets the UserId value.
        /// </summary>
        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        public long UserId { get; set; }

        /// <summary>
        /// Gets or sets the VideoPath value.
        /// </summary>
        public string VideoPath { get; set; }

        /// <summary>
        /// Gets or sets the VideoTitle value.
        /// </summary>
        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        public string VideoTitle { get; set; }

        /// <summary>
        /// Gets or sets the VideoDesc value.
        /// </summary>
        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        public string VideoDesc { get; set; }

		/// <summary>
		/// Gets or sets the CreatedDate value.
		/// </summary>
		public DateTime CreatedDate { get; set; }

		/// <summary>
		/// Gets or sets the IsActive value.
		/// </summary>
		public bool IsActive { get; set; }

		/// <summary>
		/// Gets or sets the IsDeleted value.
		/// </summary>
		public bool IsDeleted { get; set; }

		/// <summary>
		/// Gets or sets the TokenUniqueId value.
		/// </summary>
		public string TokenUniqueId { get; set; }

		/// <summary>
		/// Gets or sets the MaskTypeId value.
		/// </summary>
		public int? MaskTypeId { get; set; }

        /// <summary>
        /// Gets or sets the EventTypeId value.
        /// </summary>
        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        public long EventTypeId { get; set; }

		/// <summary>
		/// Gets or sets the CompetitionRound value.
		/// </summary>
		public int? CompetitionRound { get; set; }

		/// <summary>
		/// Gets or sets the IsCompetitionQualified value.
		/// </summary>
		public bool? IsCompetitionQualified { get; set; }

		/// <summary>
		/// Gets or sets the CompetitionQualifiedDate value.
		/// </summary>
		public DateTime? CompetitionQualifiedDate { get; set; }

		/// <summary>
		/// Gets or sets the Eventstage value.
		/// </summary>
		public int? Eventstage { get; set; }

        /// <summary>
		/// Gets or sets the VideoThumblinePath value.
		/// </summary>
		public string VideoThumblinePath { get; set; }

        [NotMapped]
        public string UserName { get; set; }

        [NotMapped]
        public string MaskType { get; set; }

        [NotMapped]
        public string EventType { get; set; }

    }
}
