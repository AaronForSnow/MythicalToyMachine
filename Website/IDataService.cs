using Microsoft.EntityFrameworkCore;
using MythicalToyMachine.Data;

namespace MythicalToyMachine;

public interface IDataService
{
    public Task<IEnumerable<Kit>> GetAllKits();
}

public class PostgresDataService : IDataService
{
    public PostgresDataService(IDbContextFactory<PostgresContext> dbContextFactory)
    {
        dbContext = dbContextFactory.CreateDbContext();
    }

    private PostgresContext dbContext;

    public async Task<IEnumerable<Kit>> GetAllKits()
    {
        return await dbContext.Kits
                            .Include(C => C.Creature)
                            .Include(k => k.KitAccessories)
                            .ThenInclude(ka => ka.Acc)
                            .ToArrayAsync();
    }
}
