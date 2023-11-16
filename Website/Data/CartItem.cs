using System;
using System.Collections.Generic;

namespace MythicalToyMachine.Data;

public partial class CartItem
{
    public int Id { get; set; }

    public int CustomerId { get; set; }

    public int KitId { get; set; }

    public int Quantity { get; set; }

    public bool? SaveForLater { get; set; }

    public virtual Customer Customer { get; set; } = null!;

    public virtual Kit Kit { get; set; } = null!;
}
