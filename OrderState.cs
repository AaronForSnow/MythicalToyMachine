using MythicalToyMachine.Data;
using MythicalToyMachine.Shared;

namespace MythicalToyMachine;

public class OrderState
{
    public bool ShowingConfigureDialog { get; private set; }

    public Item ConfiguringItem { get; private set; }

    public Order Order { get; private set; } = new Order();

    //public void ShowConfigurePizzaDialog(PizzaSpecial special)
    //{
    //    ConfiguringPizza = new Pizza()
    //    {
    //        Special = special,
    //        SpecialId = special.Id,
    //        Size = Pizza.DefaultSize,
    //        Toppings = new List<PizzaTopping>(),
    //    };

    //    ShowingConfigureDialog = true;
    //}

    public void CancelConfigureItemDialog()
    {
        ConfiguringItem = null;
        ShowingConfigureDialog = false;
    }

    public void ConfirmConfigureItemDialog()
    {
        Order.Items.Add(ConfiguringItem);
        ConfiguringItem = null;
        ShowingConfigureDialog = false;
    }

    public void RemoveConfiguredItem(Item item)
    {
        Order.Items.Remove(item);
    }

    public void ResetOrder()
    {
        Order = new Order();
    }
}
