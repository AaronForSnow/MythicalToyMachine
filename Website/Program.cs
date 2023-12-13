using FluentAssertions.Common;
using Microsoft.AspNetCore.Authentication.Cookies;
using MythicalToyMachine;
using MythicalToyMachine.Data;

using MythicalToyMachine.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();
builder.Services.AddDbContextFactory<PostgresContext>();

//builder.Services.AddSingleton<UserRoleService>();
//We need to add an IUserRoleService
builder.Services.AddScoped<IUserRoleService, UserRoleService>();
builder.Services.AddSingleton<WeatherForecastService>();
builder.Services.AddTransient<IDataService, PostgresDataService>();
builder.Services.AddScoped<ShoppingCartService>();

builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme).AddCookie();
builder.Services.AddAuthentication().AddGoogle(options =>
{
    //var clientid = builder.Configuration["Google:ClientId"];
    options.ClientId = builder.Configuration["Google:ClientId"];
    options.ClientSecret = builder.Configuration["Google:ClientSecret"];
    //options.ClaimActions.MapJsonkey("urn:google:profile", "link");
    //options.ClaimActions.MapJsonkey("urn:google:image", "picture");
});
// fron: https://github.com/aspnet/Blazor/issues/1554 ""
// Adds HttpContextAccessor Used to determine if d user is logged in and what their username is
builder.Services.AddHttpContextAccessor();
builder.Services.AddScoped<HttpContextAccessor>();
// Required for HttpClient support in the Blanbl Client project
builder.Services.AddHttpClient();
builder.Services.AddScoped<HttpClient>();
//builder.Services.AddScoped<IDbContextFactory>();
builder.Services.AddLogging();

//hellow workd

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}



app.UseHttpsRedirection();

app.UseStaticFiles();
app.UseCookiePolicy();
app.UseAuthentication();
app.UseRouting();


app.MapBlazorHub();
app.MapFallbackToPage("/_Host");


app.Run();
