using Bunit;
using Bunit.TestDoubles;
using Microsoft.Extensions.DependencyInjection;
using Moq;
using MythicalToyMachine.Data;
using MythicalToyMachine.Pages;
using MythicalToyMachine.Services;

namespace UnitTests
{
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

        [Fact]
        public void AddToCartButtonAddsToCart()
        {
            //arr
            ShoppingCartService sh = new ShoppingCartService(); //makes new service
            Services.AddSingleton<ShoppingCartService>(sh); //adds service to our app
            Mock<IDataService> cartServiceMock = new Mock<IDataService>(); //creates mock of service
            cartServiceMock.Setup(n => n.GetKitsAsync()).ReturnsAsync(new[] //this makes a new cart service with one kit in it
            {
                new Kit
                {
                    Id = 1,
                    Kitname = "Batman Kit"
                }
            });
            Services.AddTransient<IDataService>(o => cartServiceMock.Object); //this adds it to the app
            var cut = RenderComponent<Shop>(); //renders shop page

            //act
            var button = cut.WaitForElement(".cartButton");
            button.Click();

            //assert
            Assert.Equal(1, sh.AllKitsThatAreInTheCart.Count);
            Assert.Equal("Batman Kit", sh.AllKitsThatAreInTheCart[0].Kitname);
        }
    }

    public class UnitTestAuthenticationProvider : IUserRoleService
    {
        public bool IsAuthenticated => true;

        public IEnumerable<string> Roles { get; }= new List<string> { "customer", "admin" };

        public Task LookUpUser(string email, string name, string surname)
        {
            return Task.CompletedTask;
        }

        public void ResetUser()
        {
            
        }
    }


}