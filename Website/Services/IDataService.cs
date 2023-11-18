using Microsoft.EntityFrameworkCore;
using MythicalToyMachine.Data;

namespace MythicalToyMachine.Services;

public interface IDataService
{
    public Task<IEnumerable<Kit>> GetKitsAsync();
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
}



