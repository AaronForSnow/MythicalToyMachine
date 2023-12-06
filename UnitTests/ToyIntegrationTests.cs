using Bunit;
using FluentAssertions;
using MythicalToyMachine.Pages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UnitTests
{
    public class ToyIntegrationTests : BlazorIntegrationTestContext
    {
        //[Fact]
        //public async Task CanMakeComponent()
        //{
        //    var cut = RenderComponent<Cart>();

        //    cut.Find("a").InnerHtml.Should().Be("You are not logged in. Log in to see your cart.");

        //    //cut.WaitForElements("tbody tr").Should().HaveCount(5);
        //}

        //[Fact]
        //public async Task RenderingTwiceMakes10Forecasts()
        //{
        //    var cut = RenderComponent<Cart>();

        //    cut.Find("p em").InnerHtml.Should().Be("Loading...");

        //    cut.WaitForElements("tbody tr").Should().HaveCount(5);

        //    var c2 = RenderComponent<Cart>();
        //    c2.WaitForElements("tbody tr").Should().HaveCount(10);

        //    var c3 = RenderComponent<Cart>();
        //    c3.WaitForElements("tbody tr").Should().HaveCount(15);
        //}
    }
}
