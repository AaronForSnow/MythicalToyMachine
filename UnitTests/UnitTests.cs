
using Bunit;
using Bunit.TestDoubles;
using FluentAssertions;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Moq;
using MythicalToyMachine.Data;
using MythicalToyMachine.Logic;
using MythicalToyMachine.Pages;
using MythicalToyMachine.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace UnitTests;


public class LogicUnitTests : TestContext
{

    [Fact]
    public void AccessoryToString_ShopComponent_Test()
    {
        //Arrange

        List<KitAccessory> accessories = new()
        {
            new KitAccessory()
            {
                Id = 1,
                Acc = new Accessory()
                {
                    Accessoryname = "TestAccessory1"
                }
            }, 
            new KitAccessory()
            {
                Id = 2,
                Acc = new Accessory()
                {
                    Accessoryname = "TestAccessory2"
                }
            }
        };

        var kit = new Kit
        {
            Id = 1,
            Kitname = "BogusKit1",
            KitAccessories = accessories
        };

        //Act
        ShopLogic shopLogic = new();
        string testString = shopLogic.AccesoriesToString(kit);

        //Assert
        Assert.True(testString == "TestAccessory1, TestAccessory2");
    }

    [Fact]
    public void AccessoryToString_ShopComponent_FailsWhenIncorrect_Test()
    {
        //Arrange

        List<KitAccessory> accessories = new()
        {
            new KitAccessory()
            {
                Id = 1,
                Acc = new Accessory()
                {
                    Accessoryname = "TestAccessory1"
                }
            },
            new KitAccessory()
            {
                Id = 2,
                Acc = new Accessory()
                {
                    Accessoryname = "TestAccessory2"
                }
            }
        };

        var kit = new Kit
        {
            Id = 1,
            Kitname = "BogusKit1",
            KitAccessories = accessories
        };

        //Act
        ShopLogic shopLogic = new();
        string testString = shopLogic.AccesoriesToString(kit);

        //Assert
        Assert.False(testString == "TestAccessory1, TestAccessory354375943759");
    }


    [Fact]
    public void AccessoryToString_ShopComponent_ThrowsExceptionOnDataError_Test()
    {
        //Arrange

        List<KitAccessory> accessories = new()
        {
            new KitAccessory()
            {
                Id = 1,
                Acc = new Accessory()
                {
                    
                }
            },
            new KitAccessory()
            {
                Id = 2,
                Acc = new Accessory()
                {
                    Accessoryname = "TestAccessory2"
                }
            }
        };

        var kit = new Kit
        {
            Id = 1,
            Kitname = "BogusKit1",
            KitAccessories = accessories
        };

        //Act
        ShopLogic shopLogic = new();
        string testString = shopLogic.AccesoriesToString(kit);

        //Assert
        testString.Should().Be("TestAccessory2");
    }
}

public class UnitTests : TestContext
{
    [Fact]
    public void Test1()
    {
        var defaultRoles = new List<string> { "customer", "admin" };
        var roleServiceMock = new Mock<IUserRoleService>();
        roleServiceMock.Setup(m => m.IsAuthenticated).Returns(true);
        roleServiceMock.Setup(m => m.Roles).Returns(defaultRoles);

    }

    //[Fact]
    //public void ClickingAddToCartButtonPutsTheItemInTheShoppingCart()
    //{
    //    //Arrange
    //    var cartService = new ShoppingCartService();
    //    Services.AddSingleton(cartService);
    //    Services.AddSingleton<IUserRoleService, UnitTestAuthenticationProvider>();
    //    //Services.AddDbContextFactory<PostgresContext>();
    //    //Services.AddHttpContextAccessor();
    //    //Services.AddScoped<HttpContextAccessor>();
    //    //Services.AddAuthentication().AddGoogle(options =>
    //    //{
    //    //    //var clientid = builder.Configuration["Google:ClientId"];
    //    //    options.ClientId = builConfiguration["Google:ClientId"];
    //    //    options.ClientSecret = builder.Configuration["Google:ClientSecret"];
    //    //    //options.ClaimActions.MapJsonkey("urn:google:profile", "link");
    //    //    //options.ClaimActions.MapJsonkey("urn:google:image", "picture");
    //    //});
    //    var mockService = new Mock<IDataService>();
    //    mockService.Setup(m => m.GetKitsAsync()).ReturnsAsync(new[]
    //    {
    //        new Kit
    //        {
    //            Id = 1,
    //            Kitname = "BogusKit1"
    //        }
    //    });
    //    Services.AddTransient<IDataService>(_ => mockService.Object);
    //    var cut = RenderComponent<Shop>();

    //    //act
    //    var button = cut.WaitForElement(".cartButton");
    //    button.Click();

    //    //assert
    //    Assert.Equal(1, cartService.AllKitsThatAreInTheCart.Count);
    //    Assert.Equal("BogusKit1", cartService.AllKitsThatAreInTheCart[0].Kitname);
    //}

}



public class AuthenticationUnitTests : TestContext
{
    [Fact]
    public void UserNotAuthenticated_BuildAToyComponent_Test()
    {
        //Arrange
        using var ctx = new TestContext();
        ctx.Services.AddSingleton<IUserRoleService, UnitTestAuthenticationProvider>();
        ctx.Services.AddDbContextFactory<PostgresContext>();
        ctx.Services.AddHttpContextAccessor();
        ctx.Services.AddScoped<HttpContextAccessor>();

        //Act
        var renderedComponent = ctx.RenderComponent<MythicalToyMachine.Pages.BuildAToy>();

        //Assert
        var notLoggedInMsg = renderedComponent.Find("div:contains('You Need To Log In To Create!')");
        Assert.NotNull(notLoggedInMsg);
    }

    [Fact]
    public void UserAuthenticated_BuildAToyComponent_Test()
    {
        //Arrange
        var authContext = new UnitTestAuthenticationProvider();
        authContext.IsAuthenticated = true;
        using var ctx = new TestContext();
        ctx.Services.AddSingleton<IUserRoleService, UnitTestAuthenticationProvider>((_) => authContext);
        ctx.Services.AddDbContextFactory<PostgresContext>();
        ctx.Services.AddHttpContextAccessor();
        ctx.Services.AddScoped<HttpContextAccessor>();

        //Act
        var renderedComponent = ctx.RenderComponent<MythicalToyMachine.Pages.BuildAToy>();

        //Assert
        var firstImg = renderedComponent.WaitForElement("img");
        Assert.NotNull(firstImg);
    }
}


public class UnitTestShoppingCartServiceProvider : IShoppingCartService
{
    public List<Kit> AllKitsThatAreInTheCart => throw new NotImplementedException();

    public void AddKitToCart(Kit kit)
    {
        throw new NotImplementedException();
    }

    public void RemoveKitFromCart(Kit kit)
    {
        throw new NotImplementedException();
    }
}

public class UnitTestAuthenticationProvider : IUserRoleService
{
    public bool IsAuthenticated { get; set; }

    public IEnumerable<string> Roles { get; } = new List<string> { "customer", "admin" };

    public Task<Customer> GetUser(string email)
    {
        throw new NotImplementedException();
    }

    public Task<int> LookUpUserAsync(string email, string name, string surname)
    {
        return (Task<int>)Task.CompletedTask;
    }

    public void ResetUser()
    {

    }
    public PostgresContext GetPostgresContext()
    {
        throw new NotImplementedException();
    }

    public Task<int> LookUpUser(string email, string name, string surname)
    {
        throw new NotImplementedException();
    }
}






