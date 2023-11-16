using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace MythicalToyMachine.Data;

public interface IUserRoleService
{
    //
    public bool IsAuthenticated { get; }
    public IEnumerable<string> Roles { get; }
    public Task LookUpUser(string email, string name, string surname);
    public void ResetUser();
}

public class UserRoleService : IUserRoleService
{
    public UserRoleService(PostgresContext context)
    {
        this.context = context;
    }
    public bool IsAuthenticated { get; private set; }

    public IEnumerable<string> Roles => roles;

    private PostgresContext context;

    private List<string> roles = new(); 
   

    public void ResetUser()
    {
        throw new NotImplementedException();
    }

    public async Task LookUpUser( string email, string name, string surname)
    {
        if (email is not null)
        {
            string? eCompare = email;
            var lCustomer = await context.Customers.FirstOrDefaultAsync(c => c.Useremail == email);
         
            
                
            
            if (lCustomer is null)
            {
                //Make a new Customer
                Customer newCustomer = new();
                newCustomer.Surname = surname;
                newCustomer.Firstname = name;
                newCustomer.Useremail = email;

                //add it to database
                context.Customers.Add(newCustomer);
                await context.SaveChangesAsync();
            }
            //Else, if cEmail is NOT null then the user already exists in the database, so we don't have to add them to the database a second time
            IsAuthenticated = true;
        }
    }
}