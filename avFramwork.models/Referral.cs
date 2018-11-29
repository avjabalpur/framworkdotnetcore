using System;

namespace avFramworktalents.models
{
		/// <summary>
		/// Gets or sets the Tbl_referralEntity value.
		/// </summary>
	public class Tbl_referralEntity
	{

		/// <summary>
		/// Gets or sets the Id value.
		/// </summary>
		public long Id { get; set; }

		/// <summary>
		/// Gets or sets the Useridfrom value.
		/// </summary>
		public long Useridfrom { get; set; }

		/// <summary>
		/// Gets or sets the Useridto value.
		/// </summary>
		public long Useridto { get; set; }

		/// <summary>
		/// Gets or sets the Iscoupongiven value.
		/// </summary>
		public bool Iscoupongiven { get; set; }

		/// <summary>
		/// Gets or sets the Isactive value.
		/// </summary>
		public bool Isactive { get; set; }

		/// <summary>
		/// Gets or sets the Isdeleted value.
		/// </summary>
		public bool Isdeleted { get; set; }

		/// <summary>
		/// Gets or sets the Createdate value.
		/// </summary>
		public DateTime Createdate { get; set; }

	}
}
