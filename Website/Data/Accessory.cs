using System;
using System.Collections.Generic;

namespace MythicalToyMachine.Data;

public partial class Accessory
{
    public int Id { get; set; }

    public string? Accessoryname { get; set; }

    public decimal? Price { get; set; }

    public string? Discription { get; set; }

    public int? BodypartId { get; set; }

    public virtual Bodypart? Bodypart { get; set; }

    public virtual ICollection<KitAccessory> KitAccessories { get; set; } = new List<KitAccessory>();
}
