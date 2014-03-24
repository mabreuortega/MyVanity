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
    
    public partial class UserProcedure
    {
        public UserProcedure()
        {
            this.Appointments = new HashSet<Appointment>();
        }
    
        public int Id { get; set; }
        public int PatientId { get; set; }
        public int ProcedureId { get; set; }
        public System.DateTime Date { get; set; }
        public ProcedureState State { get; set; }
    
        public virtual Patient Patient { get; set; }
        public virtual Procedure Procedure { get; set; }
        public virtual ICollection<Appointment> Appointments { get; set; }
    }
}
