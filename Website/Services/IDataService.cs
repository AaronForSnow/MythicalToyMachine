using Microsoft.EntityFrameworkCore;
using MythicalToyMachine.Data;

namespace MythicalToyMachine.Services;

public interface IDataService
{
    public Task<IEnumerable<Kit>> GetKitsAsync();

    public Task<IEnumerable<CartItem>> GetKitsFromCart(int customerId);

}

public class PostgresDataService : IDataService
{
    private PostgresContext _context;
    public PostgresDataService(IDbContextFactory<PostgresContext> dbContextFactory)
    {
        _context = dbContextFactory.CreateDbContext();
    }

    public async Task<IEnumerable<Kit>> GetKitsAsync()
    {
        return await _context.Kits
                           .Include(C => C.Creature)
                           .Include(k => k.KitAccessories)
                           .ThenInclude(ka => ka.Acc)
                           .ToArrayAsync();
    }

    public async Task<IEnumerable<CartItem>>GetKitsFromCart(int customerId)
    {
        return await _context.CartItems
                            .Include(C => C.Customer)
                            .Include(K => K.Kit)
                            .Where(k => k.CustomerId == customerId) 
                            .ToListAsync();
    }
}



