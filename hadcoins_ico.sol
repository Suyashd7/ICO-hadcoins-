// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract hadcoin_ico {

    // Introducing the total number of hadcoins available for sale.
    uint public max_hadcoins = 1000000;

    uint public usd_to_hadcoins = 1000; 

    // Introducing the total number of hadcoins that have been bought by investors.
    uint public total_hadcoins_bought = 0;

    // Mapping from the investor address to its equity in hadcoins and USD.
    mapping(address => uint) equity_hadcoins;
    mapping(address => uint) equity_usd;

    // Check if an investor can buy hadcoins
    modifier can_buy_hadcoins(uint usd_invested) {
        require(usd_invested * usd_to_hadcoins + total_hadcoins_bought <= max_hadcoins, "Not enough Hadcoins available for sale");
        _;
    }

    // Getting the equity of an investor in hadcoins & usd.
    function equity_in_hadcoins(address investor) external view returns (uint) {
        return equity_hadcoins[investor];
    }

    function equity_in_usd(address investor) external view returns (uint) {
        return equity_usd[investor];
    }

    // Buy hadcoins
    function buy_hadcoins(address investor, uint usd_invested) external can_buy_hadcoins(usd_invested) {
        uint hadcoins_bought = usd_invested * usd_to_hadcoins;
        equity_hadcoins[investor] += hadcoins_bought;
        equity_usd[investor] = equity_hadcoins[investor] / usd_to_hadcoins;
        total_hadcoins_bought += hadcoins_bought;
    }

    // Sell hadcoins
    function sell_hadcoins(address investor, uint hadcoins_sold) external {
        require(equity_hadcoins[investor] >= hadcoins_sold, "Not enough Hadcoins to sell");
        equity_hadcoins[investor] -= hadcoins_sold;
        equity_usd[investor] = equity_hadcoins[investor] / usd_to_hadcoins;
    }
}
