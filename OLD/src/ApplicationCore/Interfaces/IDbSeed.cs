using System.Collections.Generic;
using Microsoft.eShopWeb.ApplicationCore.Entities;

namespace Microsoft.eShopWeb.ApplicationCore.Interfaces
{
    public interface IDbSeed
    {
        IEnumerable<CatalogItem> GetPreconfiguredItems();
        IEnumerable<CatalogType> GetPreconfiguredCatalogTypes();
        IEnumerable<CatalogBrand> GetPreconfiguredCatalogBrands();
    }
}
