using Bunit;
using FluentAssertions;
using FluentAssertions.Common;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Moq;
using MythicalToyMachine.Data;
using MythicalToyMachine.Pages;
using MythicalToyMachine.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;

namespace UnitTests
{
    public class ToyIntegrationTests : BlazorIntegrationTestContext
    {
        [Fact]
        public async Task NonSignedInUserCannotSeeCart()
        {
            var mockHttpContextAccessor = new Mock<IHttpContextAccessor>();

            var user = new ClaimsPrincipal(new ClaimsIdentity(new Claim[]
            {
            new Claim(ClaimTypes.Name, "testuser"),
            new Claim(ClaimTypes.Role, "admin"), 
            }));

            mockHttpContextAccessor.Setup(x => x.HttpContext.User).Returns(user);

            Services.AddSingleton<IHttpContextAccessor>(mockHttpContextAccessor.Object);

            // Act
            var cut = RenderComponent<Cart>();

            cut.Find("#main-title").InnerHtml.Should().Be("Sorry You're Not Logged In!");
        }

        [Fact]
        public async Task SignedInUserCanSeeCart()
        {
            using var ctx = new TestContext();
            var mockHttpContextAccessor = new Mock<IHttpContextAccessor>();
            var user = new ClaimsPrincipal(new ClaimsIdentity(new Claim[]
            {
                new Claim(ClaimTypes.Name, "Carlos Felipe Blanco Castro"),
                new Claim(ClaimTypes.Email, "blancocastrocarlosfelipe@gmail.com"),
                new Claim(ClaimTypes.Surname, "Blanco Castro")
            }));
            mockHttpContextAccessor.Setup(x => x.HttpContext.User).Returns(user);

            var authContext = new UnitTestAuthenticationProvider();
            authContext.IsAuthenticated = true;
            ctx.Services.AddSingleton<IUserRoleService, UnitTestAuthenticationProvider>((_) => authContext);
            ctx.Services.AddSingleton<IHttpContextAccessor>(mockHttpContextAccessor.Object);
            ctx.Services.AddDbContextFactory<PostgresContext>();

            // Act
            var cut = ctx.RenderComponent<MythicalToyMachine.Pages.Cart>();
            cut.Find("div").InnerHtml.Should().Be("Your Cart is currently empty!");
        }


        [Fact]
        public async Task NonAdminCannotSeeAdminPage()
        {
            using var ctx = new TestContext();
            var mockHttpContextAccessor = new Mock<IHttpContextAccessor>();
            var user = new ClaimsPrincipal(new ClaimsIdentity(new Claim[]
            {
                new Claim(ClaimTypes.Name, "Tailored Toys"),
                new Claim(ClaimTypes.Email, "tailoredtoys47@gmail.com"),
                new Claim(ClaimTypes.Surname, "Toys")
            }));
            mockHttpContextAccessor.Setup(x => x.HttpContext.User).Returns(user);

            var authContext = new UnitTestAuthenticationProvider();
            authContext.IsAuthenticated = true;
            ctx.Services.AddSingleton<IUserRoleService, UnitTestAuthenticationProvider>((_) => authContext);
            ctx.Services.AddSingleton<IHttpContextAccessor>(mockHttpContextAccessor.Object);
            ctx.Services.AddDbContextFactory<PostgresContext>();

            // Act
            var cut = ctx.RenderComponent<MythicalToyMachine.Pages.Manager>();
            cut.Find("#main-title").InnerHtml.Should().Be("You're not Authorized to see This Content!");
        }

        [Fact]
        public async Task SignedInUserCanViewCreations()
        {
            using var ctx = new TestContext();
            var mockHttpContextAccessor = new Mock<IHttpContextAccessor>();
            var user = new ClaimsPrincipal(new ClaimsIdentity(new Claim[]
            {
                new Claim(ClaimTypes.Name, "Carlos Felipe Blanco Castro"),
                new Claim(ClaimTypes.Email, "blancocastrocarlosfelipe@gmail.com"),
                new Claim(ClaimTypes.Surname, "Blanco Castro")
            }, "Basic"));
            mockHttpContextAccessor.Setup(x => x.HttpContext.User).Returns(user);
            var isAuthenticated = user.Identity.IsAuthenticated;

            var authContext = new UnitTestAuthenticationProvider();
            authContext.IsAuthenticated = true;
            ctx.Services.AddSingleton<IUserRoleService, UnitTestAuthenticationProvider>((_) => authContext);
            ctx.Services.AddSingleton<IHttpContextAccessor>(mockHttpContextAccessor.Object);
            ctx.Services.AddDbContextFactory<PostgresContext>();

            // Act
            var cut = ctx.RenderComponent<MythicalToyMachine.Pages.MyCreations>();
            cut.Find("a").InnerHtml.Should().Be("You don't have any saved creations");
        }      
    }
}
