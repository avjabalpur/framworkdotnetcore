using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Rendering;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using avFramworktalents.core;
using avFramworktalents.Core;

namespace avFramworktalents.models
{
		/// <summary>
		/// Gets or sets the EventSettingEntity value.
		/// </summary>
	public class EventRounds : BaseModel
    {

       
        /// <summary>
        /// Gets or sets the RoundName value.
        /// </summary>
        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        [Display(Name = "Round Name", Description = "Enter Round Name")]
        public string RoundName { get; set; }

        /// <summary>
        /// Gets or sets the RoundDuration value.
        /// </summary>
        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        [Display(Name = "Round Duration", Description = "Enter Round Duration")]
        public decimal RoundDuration { get; set; }

        /// <summary>
        /// Gets or sets the NoOfVideos value.
        /// </summary>
        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        [RegularExpression(RegexValidation.NumberValidate, ErrorMessage = RequiredMessages.InvalidFieldMessage)]
        [Display(Name = "Max Number of Videos", Description = "Number of Videos")]
        public string NoOfVideos { get; set; }

        /// <summary>
        /// Gets or sets the DaysDurations value.
        /// </summary>
        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        [RegularExpression(RegexValidation.NumberValidate, ErrorMessage = RequiredMessages.InvalidFieldMessage)]
        [Display(Name = "Days Durations", Description = "Days Durations")]
        public int DaysDurations { get; set; }

        /// <summary>
        /// Gets or sets the RoundOrderNo value.
        /// </summary>
        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        [RegularExpression(RegexValidation.NumberValidate, ErrorMessage = RequiredMessages.InvalidFieldMessage)]
        [Display(Name = "Round Order Number", Description = "Round Order Number")]
        public int RoundOrderNo { get; set; }

		/// <summary>
		/// Gets or sets the IsDeleted value.
		/// </summary>
		public bool IsDeleted { get; set; }

		/// <summary>
		/// Gets or sets the ImageName value.
		/// </summary>
		public string ImageName { get; set; }

		/// <summary>
		/// Gets or sets the ShowVotes value.
		/// </summary>
		public bool? ShowVotes { get; set; }

		/// <summary>
		/// Gets or sets the IsActive value.
		/// </summary>
		public bool IsActive { get; set; }

        /// <summary>
        /// Gets or sets the StartDate value.
        /// </summary>
        //[RegularExpression(RegexValidation.DateValidate, ErrorMessage = RequiredMessages.InvalidFieldMessage)]
        [Display(Name = "Start Date", Description = "Start Date")]
        public DateTime? StartDate { get; set; }

        /// <summary>
        /// Gets or sets the EndDate value.
        /// </summary>
        //[RegularExpression(RegexValidation.DateValidate, ErrorMessage = RequiredMessages.InvalidFieldMessage)]
        [Display(Name = "End Date", Description = "End Date")]
        public DateTime? EndDate { get; set; }

        /// <summary>
        /// Gets or sets the Eventtype value.
        /// </summary>
        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        [RegularExpression(RegexValidation.NumberValidate, ErrorMessage = RequiredMessages.InvalidFieldMessage)]
        [Display(Name = "Event Type", Description = "Event Type")]
        public int EventType { get; set; }

		/// <summary>
		/// Gets or sets the Isbackstage value.
		/// </summary>
		public long? IsbackStage { get; set; }

        /// <summary>
        /// Gets or sets the Eventstage value.
        /// </summary>
        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        //[RegularExpression(RegexValidation.NumberValidate, ErrorMessage = RequiredMessages.InvalidFieldMessage)]
        [Display(Name = "Event Stage", Description = "Event Stage")]
        public EventStages EventStage { get; set; }


        [NotMapped]
        public IEnumerable<SelectListItem> EventStages
        {
            get
            {
                return Common.GetSelectListItems(Common.ConvertEnumToList(typeof(EventStages)));
            }
        }

        //[NotMapped]
        //public IFormFile RoundImage { get; set; }

    }
}
