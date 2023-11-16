using System;
using System.Collections.Generic;

namespace MythicalToyMachine.Data;

public partial class Creature
{
    public int Id { get; set; }

    public string? Creaturename { get; set; }

    public decimal? Suggestedprice { get; set; }

    public string? Discription { get; set; }

    public virtual ICollection<Kit> Kits { get; set; } = new List<Kit>();
}
