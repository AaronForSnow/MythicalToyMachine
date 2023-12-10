using MythicalToyMachine.Data;

namespace MythicalToyMachine.Services
{
    public interface IShoppingCartService
    {
        List<Kit> AllKitsThatAreInTheCart { get; }

        void AddKitToCart(Kit kit);
        void RemoveKitFromCart(Kit kit);
    }
}