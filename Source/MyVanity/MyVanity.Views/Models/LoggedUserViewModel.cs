using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using MyVanity.Common.Localization;

namespace MyVanity.Views.Models
{
    public class LoggedUserViewModel
    {
        [HiddenInput]
        [Required]
        public int Id { get; set; }

        [Required]
        [Display(Name = "User name", ResourceType = typeof(LocalizerResource))]
        public string UserName { get; set; }
    }
}
