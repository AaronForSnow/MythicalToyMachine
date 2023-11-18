using Microsoft.EntityFrameworkCore.Internal;
using MythicalToyMachine.Data;

namespace MythicalToyMachine.Services;

public class ShoppingCartService
{
    public List<Kit> AllKitsThatAreInTheCart { get; } = new();

    public void AddKitToCart(Kit kit)
    {
        AllKitsThatAreInTheCart.Add(kit);
    }
}
