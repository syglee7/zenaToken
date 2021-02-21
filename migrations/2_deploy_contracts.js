var ZenaToken = artifacts.require('./ZenaToken.sol');
var ZenaTokenSale = artifacts.require('./ZenaTokenSale.sol');

module.exports = function (deployer) {
    deployer.deploy(ZenaToken, 1000000).then(function() {
        return deployer.deploy(
            ZenaTokenSale,
            ZenaToken.address,
            1000000000000000
        )
    })
}