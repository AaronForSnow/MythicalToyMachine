using System;
using System.Collections.Generic;

namespace MythicalToyMachine.Data;

public partial class CustomerRole
{
    public int Id { get; set; }

    public string RoleDescription { get; set; } = null!;

    public virtual ICollection<Customer> Customers { get; set; } = new List<Customer>();
}
