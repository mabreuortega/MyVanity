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
    
    public abstract partial class Document
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Path { get; set; }
        public string Censured { get; set; }
        public int CategoryId { get; set; }
        public Nullable<int> SubcategoryId { get; set; }
        public ContentType ContentType { get; set; }
        public string Description { get; set; }
    
        public virtual DocumentCategory Category { get; set; }
        public virtual DocumentSubcategory Subcategory { get; set; }
    }
}
