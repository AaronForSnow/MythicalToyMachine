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
