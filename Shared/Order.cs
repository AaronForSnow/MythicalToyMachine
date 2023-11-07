using System.Net;
using System.Text.Json.Serialization;
using Microsoft.AspNetCore.Http.Features;
using MythicalToyMachine.Data;

namespace MythicalToyMachine.Shared;

public class Order
{
    
    public List<Item> Items { get; set; } = new List<Item>();

    public decimal GetTotalPrice() => Items.Sum(i => i.Price);

    public string GetFormattedTotalPrice() => GetTotalPrice().ToString("0.00");
}

[JsonSourceGenerationOptions(GenerationMode = JsonSourceGenerationMode.Default, PropertyNamingPolicy = JsonKnownNamingPolicy.CamelCase)]
[JsonSerializable(typeof(Order))]
//[JsonSerializable(typeof(OrderWithStatus))]
//[JsonSerializable(typeof(List<OrderWithStatus>))]
//[JsonSerializable(typeof(Pizza))]
//[JsonSerializable(typeof(List<PizzaSpecial>))]
//[JsonSerializable(typeof(List<Topping>))]
//[JsonSerializable(typeof(Topping))]
//[JsonSerializable(typeof(Dictionary<string, string>))]
public partial class OrderContext : JsonSerializerContext { }