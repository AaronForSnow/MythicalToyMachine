using System;
using System.Collections.Generic;

namespace MythicalToyMachine.Data;

public partial class Bodypart
{
    public int Id { get; set; }

    public string? Partname { get; set; }

    public virtual ICollection<Accessory> Accessories { get; set; } = new List<Accessory>();
}
