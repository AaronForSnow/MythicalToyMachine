using Bunit;
using FluentAssertions.Common;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using MythicalToyMachine.Data;
using MythicalToyMachine.Pages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Testcontainers.PostgreSql;

namespace UnitTests
{
    public class BlazorIntegrationTestContext : TestContext, IAsyncLifetime
    {
        private readonly PostgreSqlContainer _dbContainer;

        public BlazorIntegrationTestContext()
        {
            var backupFile = Directory.GetFiles("../../../..", "*.sql", SearchOption.AllDirectories)
                .Select(f => new FileInfo(f))
                .OrderByDescending(fi => fi.LastWriteTime)
                .First();

            _dbContainer = new PostgreSqlBuilder()
                .WithImage("postgres")
                .WithUsername("mythicalman")
                .WithPassword("P@ssword1")
                .WithBindMount(backupFile.FullName, "/docker-entrypoint-initdb.d/init.sql")
                .Build();

            Services.AddDbContextFactory<PostgresContext>(options => options.UseNpgsql(_dbContainer.GetConnectionString()));
            Services.AddSingleton<IUserRoleService, UnitTestAuthenticationProvider>();
            Services.AddScoped<IHttpContextAccessor, HttpContextAccessor>();
        }


        public async Task InitializeAsync()
        {
            await _dbContainer.StartAsync();
        }

        async Task IAsyncLifetime.DisposeAsync()
        {
            await _dbContainer.StopAsync();
        }
    }
}
