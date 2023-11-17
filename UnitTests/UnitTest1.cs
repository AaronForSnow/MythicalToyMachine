using Bunit;
using Microsoft.Extensions.DependencyInjection;
using Moq;
using MythicalToyMachine;
using MythicalToyMachine.Data;
using MythicalToyMachine.Pages;

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
        public void ClickingAddToCartButtonPutsTheItemInTheShoppingCart()
        {
            //Arrange
            var cartService = new ShoppingCartService();
            Services.AddSingleton<ShoppingCartService>(cartService);
            var mockService = new Mock<IDataService>();
            mockService.Setup(m => m.GetAllKits()).ReturnsAsync(new[]
            {
                new Kit
                {
                    Id = 1,
                    Kitname = "BogusKit1"
                }
            });
            Services.AddTransient<IDataService>(_ => mockService.Object);
            var cut = RenderComponent<Shop>();

            //act
            var button = cut.WaitForElement(".cartButton");
            button.Click();

            //assert
            Assert.Equal(1, cartService.KitsInCart.Count);
            Assert.Equal("BogusKit1", cartService.KitsInCart[0].Kitname);
        }
    }

    public class UnitTestAuthenticationProvider : IUserRoleService
    {
        public bool IsAuthenticated => true;

        public IEnumerable<string> Roles { get; } = new List<string> { "customer", "admin" };

        public Task LookUpUser(string email, string name, string surname)
        {
            return Task.CompletedTask;
        }

        public void ResetUser()
        {

        }
    }
}