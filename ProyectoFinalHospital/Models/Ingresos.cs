//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProyectoFinalHospital.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Ingresos
    {
        public int Id { get; set; }
        public string FechaIngreso { get; set; }
        public int HabitacionesId { get; set; }
        public int PacientesId { get; set; }
    
        public virtual Habitaciones Habitacione { get; set; }
        public virtual Pacientes Paciente { get; set; }
        public virtual Altas Alta { get; set; }
    }
}
