namespace RizzGamingBase.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DiscountItem")]
    public partial class DiscountItem
    {
        public int Id { get; set; }

        public int DiscountId { get; set; }

        public int GameId { get; set; }

        public virtual Discount Discount { get; set; }

        public virtual Game Game { get; set; }
    }
}
