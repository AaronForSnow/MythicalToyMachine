using System;
using System.Collections.Generic;

namespace MythicalToyMachine.Data;

public partial class KitAccessory
{
    public int Id { get; set; }

    public int? KitId { get; set; }

    public int? AccId { get; set; }

    public int Qty { get; set; }

    public virtual Accessory? Acc { get; set; }

    public virtual Kit? Kit { get; set; }
}
