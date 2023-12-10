using Microsoft.EntityFrameworkCore.Internal;
using MythicalToyMachine.Data;

namespace MythicalToyMachine.Services;

public class ShoppingCartService : IShoppingCartService
{
    public List<Kit> AllKitsThatAreInTheCart { get; } = new();

    public void AddKitToCart(Kit kit)
    {
        AllKitsThatAreInTheCart.Add(kit);
    }

    public void RemoveKitFromCart(Kit kit)
    {
        AllKitsThatAreInTheCart.Remove(kit);
    }
}
