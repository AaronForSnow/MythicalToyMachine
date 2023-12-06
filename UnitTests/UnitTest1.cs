
using Bunit;
using Bunit.TestDoubles;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Moq;
using MythicalToyMachine.Data;
using MythicalToyMachine.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace UnitTests;


public class UnitTest1 : TestContext
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



public class AuthenticationTests2
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
        Assert.Contains(@"<message class=""validation-message"">You need to <a class=""btn btn-info"" href=""/identity/login"">log in</a> to create a kit</message>", renderedComponent.Markup);
    }

    //[Fact]
    //public void UserAuthenticated_BuildAToyComponent_Test()
    //{
    //    //Arrange
    //    using var ctx = new TestContext();
    //    ctx.Services.AddSingleton<IUserRoleService, UnitTestAuthenticationProvider>();
    //    ctx.Services.AddDbContextFactory<PostgresContext>();
    //    ctx.Services.AddHttpContextAccessor();
    //    ctx.Services.AddScoped<HttpContextAccessor>();


    //    var authContext = new UnitTestAuthenticationProvider();
    //    authContext.IsAuthenticated = true;
        

    //    //Act
    //    var renderedComponent = ctx.RenderComponent<MythicalToyMachine.Pages.BuildAToy>();

    //    //Assert
    //    Assert.Contains(@"<body>
    //<div id=""flex-container"">
    //    <div id=""accessory-column"" Class=""flex-column"">
    //        <div  Class=""accessory-img img-fluid"" id=""unicornhorn"">
    //            <img class=""img-fluid"" src=""/Images/Accessories/unicornhorn.png"">
    //        </div>
    //        <div Class=""accessory-img img-fluid"" id=""antlers"">
    //            <img class=""img-fluid"" src=""/Images/Accessories/antlers.png"">
    //        </div>
    //        <div Class=""accessory-img img-fluid"" id=""wing"">
    //            <img class=""img-fluid"" src=""/Images/Accessories/wing.png"">
    //        </div>
    //        <div Class=""accessory-img img-fluid"" id=""wing-evil"">
    //            <img class=""img-fluid"" src=""/Images/Accessories/wing-evil.png"">
    //        </div>
    //        <div Class=""accessory-img img-fluid"" id=""js"">
    //            <img class=""img-fluid"" src=""/Images/Accessories/js.png"">
    //        </div>
    //    </div>
    //    <div id=""center-column"" class=""flex-column"">
    //        <div id=""page-subtitle img-fluid"">
    //            <img style=""user-select: none;"" src=""/Images/Accessories/subtitle.png"">
    //        </div>
    //        <div id=""dragContainer"" class=""dino-img"">
    //                <canvas id=""dinoCanvas"" width=""600"" height=""300"">
    //                </canvas>
    //        </div>
    //        <div class=""option-buttons"">
    //            <button class=""btn btn-success option-buttons"" @onclick=""() => AddKitAsync() "">Save</button>
    //            <a href=""/MyCreations"" class=""btn btn-secondary option-buttons"">View my past creations</a>
    //        </div>
    //    </div>
    //    <div id=""colors-column"" class=""flex-column"">
    //        <div class=""red rounded-circle color-selection""></div>
    //        <div class=""orange rounded-circle color-selection""></div>
    //        <div class=""yellow rounded-circle color-selection""></div>
    //        <div class=""green rounded-circle color-selection""></div>
    //        <div class=""blue rounded-circle color-selection""></div>
    //        <div class=""purple rounded-circle color-selection""></div>
    //        <img id=""eraser"" draggable=""false"" src=""/Images/Accessories/eraser.png"">
    //    </div>
    //</div>
    //    <script src=""js/drawingscript.js"" type=""module""></script>
    //</body>", renderedComponent.Markup);
    //}
}


