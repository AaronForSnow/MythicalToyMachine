using MythicalToyMachine.Data;

namespace MythicalToyMachine.Logic
{
    public class ShopLogic
    {
        public string AccesoriesToString(Kit kit)
        {
            List<KitAccessory> kitList = kit.KitAccessories.ToList();
            string accesoryList = "";
            for (int i = 0; i < kitList.Count; i++)
            {
                if (i == kitList.Count - 1)
                {
                    accesoryList += kitList[i].Acc.Accessoryname;
                }
                else
                {
                    if (kitList[i].Acc.Accessoryname is not null)
                    {
                        accesoryList += $"{kitList[i].Acc.Accessoryname}, ";
                    }
                }
            }

            return accesoryList;
        }
    }
}
