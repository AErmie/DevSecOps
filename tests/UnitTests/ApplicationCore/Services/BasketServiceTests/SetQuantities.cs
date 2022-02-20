﻿using System;
using System.Threading.Tasks;
using Microsoft.eShopWeb.ApplicationCore.Entities.BasketAggregate;
using Microsoft.eShopWeb.ApplicationCore.Exceptions;
using Microsoft.eShopWeb.ApplicationCore.Interfaces;
using Microsoft.eShopWeb.ApplicationCore.Services;
using Moq;
using Xunit;

namespace Microsoft.eShopWeb.UnitTests.ApplicationCore.Services.BasketServiceTests;

public class SetQuantities
{
    private readonly int _invalidId = -1;
    private readonly Mock<IRepository<Basket>> _mockBasketRepo = new();

    [Fact]
    public async Task ThrowsGivenInvalidBasketId()
    {
        var basketService = new BasketService(_mockBasketRepo.Object, null);

        await Assert.ThrowsAsync<BasketNotFoundException>(async () =>
            await basketService.SetQuantities(_invalidId, new System.Collections.Generic.Dictionary<string, int>()));
    }

    [Fact]
    public async Task ThrowsGivenNullQuantities()
    {
        var basketService = new BasketService(null, null);

        await Assert.ThrowsAsync<ArgumentNullException>(async () =>
            await basketService.SetQuantities(123, null));
    }
}
