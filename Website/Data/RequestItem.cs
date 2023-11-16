using System;
using System.Collections.Generic;

namespace MythicalToyMachine.Data;

public partial class RequestItem
{
    public int Id { get; set; }

    public int RequestId { get; set; }

    public int KitId { get; set; }

    public int Quantity { get; set; }

    public decimal? RequestPrice { get; set; }

    public virtual Kit Kit { get; set; } = null!;

    public virtual Request Request { get; set; } = null!;
}
