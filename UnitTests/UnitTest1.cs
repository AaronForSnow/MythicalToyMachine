using Bunit;
using Bunit.TestDoubles;
using FluentAssertions;
using Microsoft.Extensions.DependencyInjection;
using Moq;
using MythicalToyMachine.Data;
using MythicalToyMachine.Pages;
using MythicalToyMachine.Services;
using MythicalToyMachine.Shared;

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
            //Assert.Equal(1, sh.AllKitsThatAreInTheCart.Count);
            Assert.Single(sh.AllKitsThatAreInTheCart);
            Assert.Equal("Batman Kit", sh.AllKitsThatAreInTheCart[0].Kitname);
        }

        [Fact]
        public void CanDisplayItemsInUserCart()
        {
            var sh = new ShoppingCartService();
            Services.AddSingleton<ShoppingCartService>(sh);
            Mock<IUserRoleService> roleMock = new Mock<IUserRoleService>();
            roleMock.Setup(m => m.GetUser(It.IsAny<string>())).ReturnsAsync(new Customer()
            {
                Id = 1
            });
            Services.AddSingleton(roleMock.Object);
            this.AddTestAuthorization(); //look up bunit docs for how to pass in the email
            Mock<IDataService> mock = new Mock<IDataService>();
            mock.Setup(n => n.GetKitsAsync()).ReturnsAsync(new[]
            {
                new Kit
                {
                    Id= 1,
                    Kitname = "testname"
                }
            });
            Services.AddTransient<IDataService>(o => mock.Object); //this adds it to the app
            var cut = RenderComponent<Shop>(); //renders shop page

            //Act
            var button = cut.WaitForElement(".cartButton");
            button.Click(); //now the kit is in our cart
            var cutCart = RenderComponent<Cart>();

            var cartList = cutCart.WaitForElement(".Cart");

            //Assert
            cutCart.WaitForElements("ul li").Should().HaveCount(1);
        }
    }

    public class UnitTestAuthenticationProvider : IUserRoleService
    {
        public bool IsAuthenticated => true;

        public IEnumerable<string> Roles { get; } = new List<string> { "customer", "admin" };

        public async Task<int> LookUpUserAsync(string email, string name, string surname)
        {
            return -1; //ToDO: implement
        }

        public void ResetUser()
        {

        }

        public async Task<Customer> GetUser(string email)
        {
            return new Customer
            {
                Id = 5,
                Useremail = email
            };
        }
    }


}