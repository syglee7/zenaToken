pragma solidity ^0.8.0;

import "./ZenaToken.sol";
import "./SafeMath.sol";

contract ZenaTokenSale {
    ZenaToken public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokensSold;
    address owner;
    event Sell(address indexed _buyer, uint256 indexed _amount);

    constructor(ZenaToken _tokenContract, uint256 _tokenPrice) public {
        owner = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
    }

    function buyTokens(uint256 _numberOfTokens)
        public
        payable
    {
        require(msg.value == SafeMath.mul(_numberOfTokens, tokenPrice));
        require(tokenContract.balanceOf(address(this)) >= _numberOfTokens);
        tokensSold += _numberOfTokens;
        emit Sell(msg.sender, _numberOfTokens);
        require(tokenContract.transfer(msg.sender, _numberOfTokens));
    }

    function endSale() public {
        require(msg.sender == owner);
        require(tokenContract.transfer(owner, tokenContract.balanceOf(address(this))));
        payable(msg.sender).transfer(address(this).balance);
    }

    function safeMultiply(uint256 x, uint256 y)
        internal
        pure
        returns (uint z)
    {
        require(y == 0 || (z = x * y) / y == x);
    }
}