using MythicalToyMachine.Data;

namespace MythicalToyMachine;

public class ShoppingCartService
{
    public List<Kit> KitsInCart { get; } = new();
    public void AddToCart(Kit kit)
    {
        KitsInCart.Add(kit);
    }
}
