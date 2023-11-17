using Bunit;
using Bunit.TestDoubles;
using Moq;
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
        public void AddToCartButtonAddsToCart()
        {
            //arr
            //Services.AddSingleton()
            var cut = RenderComponent<Shop>();



            //act

            //assert
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