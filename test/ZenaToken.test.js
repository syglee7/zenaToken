var ZenaToken = artifacts.require('./ZenaToken.sol');

contract('ZenaToken', async (accounts) => {
    it ('initialises the contract with the correct values', async () => {
        let instance = await ZenaToken.deployed();

        let name = await instance.name();

        assert.equal(name, 'Zena ERC20 Token', 'has the correct name');

        let symbol = await instance.symbol();
        assert.equal(symbol, 'ZNT', 'has the correct symbol');
    });

    it ('allocates the total supply on deployment', async () => {
        let instance = await ZenaToken.deployed();

        let supply = await instance.totalSupply();

        assert.equal(supply, 1000000, 'sets the correct total supply');
    });
});