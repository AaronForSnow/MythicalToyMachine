﻿using System;
using System.Collections.Generic;

namespace MythicalToyMachine.Data;

public partial class Kit
{
    public int Id { get; set; }

    public string? Kitname { get; set; }

    public int? CreatureId { get; set; }

    public bool? Shoulddisplay { get; set; }

    public int? CreatorId { get; set; }

    public string? ThumbnailPath { get; set; }

    public virtual ICollection<CartItem> CartItems { get; set; } = new List<CartItem>();

    public virtual Customer? Creator { get; set; }

    public virtual Creature? Creature { get; set; }

    public virtual ICollection<KitAccessory> KitAccessories { get; set; } = new List<KitAccessory>();

    public virtual ICollection<RequestItem> RequestItems { get; set; } = new List<RequestItem>();
}
