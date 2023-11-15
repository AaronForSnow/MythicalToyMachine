using System;
using System.Collections.Generic;

namespace MythicalToyMachine.Data;

public partial class Customer
{
    public int Id { get; set; }

    public string Useremail { get; set; } = null!;

    public string? Firstname { get; set; }

    public string? Surname { get; set; }

    public virtual ICollection<CartItem> CartItems { get; set; } = new List<CartItem>();

    public virtual ICollection<Kit> Kits { get; set; } = new List<Kit>();

    public virtual ICollection<Request> Requests { get; set; } = new List<Request>();
}
