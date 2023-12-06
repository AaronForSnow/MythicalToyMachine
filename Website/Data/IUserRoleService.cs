using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace MythicalToyMachine.Data;

public interface IUserRoleService
{
    //
    public bool IsAuthenticated { get; }
    public IEnumerable<string> Roles { get; }
    public Task<int> LookUpUserAsync(string email, string name, string surname);
    public void ResetUser();
    public Task<Customer> GetUser(string email);
    public PostgresContext GetPostgresContext();
}

public class UserRoleService : IUserRoleService
{
    public UserRoleService(PostgresContext context)
    {
        this.context = context;
        //this.context = new PostgresContext();
    }
    public bool IsAuthenticated { get; private set; }

    public IEnumerable<string> Roles => roles;

    private PostgresContext context;

    private List<string> roles = new();

    public PostgresContext GetPostgresContext()
    {
        return context;
    }

    public async Task<Customer> GetUser(string email)
    {
        var lCustomer = new Customer();
        if (email is not null)
        {
            string? eCompare = email;
            lCustomer = await context.Customers.FirstOrDefaultAsync(c => c.Useremail == email);

        }
        return lCustomer == null ? null : lCustomer;
    }


    public void ResetUser()
    {
        IsAuthenticated = false;
        roles = new();

        //throw new NotImplementedException();
    }

    public async Task<int> LookUpUserAsync( string email, string name, string surname)
    {
        if (email is not null)
        {
            var lCustomer = await context.Customers.FirstOrDefaultAsync(c => c.Useremail == email);
            
            
                
            
            if (lCustomer is null)
            {
                //Make a new Customer
                Customer newCustomer = new();
                newCustomer.Surname = surname;
                newCustomer.Firstname = name;
                newCustomer.Useremail = email;
                newCustomer.Id = context.Customers.Max(c => c.Id) + 1;
                newCustomer.CustomerRoleId = 1; //1 = customer 2 = admin

                //add it to database
                await context.Customers.AddAsync(newCustomer);
                await context.SaveChangesAsync();
                lCustomer = newCustomer;
            }
            //Else, if cEmail is NOT null then the user already exists in the database, so we don't have to add them to the database a second time
            IsAuthenticated = true;
            return lCustomer.Id;
        }
        else
        {
            return 0;
        }
    }
}