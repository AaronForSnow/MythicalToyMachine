using Bunit.TestDoubles;
using Moq;
using MythicalToyMachine.Data;
using System.Data;

namespace UnitTests
{
    public class UnitTest1
    {
        [Fact]
        public void Test1()
        {
            var defaultRoles = new List<string> { "customer", "admin" };
            var roleServiceMock = new Mock<IUserRoleService>();
            roleServiceMock.Setup(m => m.IsAuthenticated).Returns(true);
            roleServiceMock.Setup(m => m.Roles).Returns(defaultRoles);

        }
    }

    public class UnitTestAuthenticationProvider : IUserRoleService
    {
        public bool IsAuthenticated => true;

        public IEnumerable<string> Roles { get; }= new List<string> { "customer", "admin" };

        public Task<int> LookUpUser(string email, string name, string surname)
        {
            return Task.FromResult(0);
            //return CompletedTask;
        }

        public void ResetUser()
        {

        }
    }
}