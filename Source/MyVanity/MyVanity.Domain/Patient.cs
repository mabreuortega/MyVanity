//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MyVanity.Domain
{
    using System;
    using System.Collections.Generic;
    
    public partial class Patient : User
    {
        public Patient()
        {
            this.Procedures = new HashSet<UserProcedure>();
            this.Documents = new HashSet<PatientDocument>();
            this.Profile = new Person();
        }
    
        public string Number { get; set; }
        public int ContactId { get; set; }
    
        public Person Profile { get; set; }
    
        public virtual ICollection<UserProcedure> Procedures { get; set; }
        public virtual ICollection<PatientDocument> Documents { get; set; }
        public virtual Contact Contact { get; set; }
    }
}
