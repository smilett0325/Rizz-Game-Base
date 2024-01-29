namespace RizzGamingBase.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Video
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        public int GameId { get; set; }

        [Required]
        [StringLength(50)]
        public string DisplayVideo { get; set; }

        public virtual Game Game { get; set; }
    }
}