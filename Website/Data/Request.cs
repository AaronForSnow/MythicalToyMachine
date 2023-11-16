using System;
using System.Collections.Generic;

namespace MythicalToyMachine.Data;

public partial class Request
{
    public int Id { get; set; }

    public int CustomerId { get; set; }

    public DateTime? Requestdate { get; set; }

    public virtual Customer Customer { get; set; } = null!;

    public virtual ICollection<RequestItem> RequestItems { get; set; } = new List<RequestItem>();
}
