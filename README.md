# ICO-hadcoins-

This contract represents a simple Initial Coin Offering (ICO) for the Hadcoin token. It allows investors to buy and sell Hadcoins with the following features:

Buy Hadcoins: Investors can buy Hadcoins by investing USD. The total number of available Hadcoins is capped at 1,000,000 Hadcoins.
Sell Hadcoins: Investors can sell their Hadcoins, with their equity updated accordingly.
Investor Equity: The contract tracks each investor's equity in both Hadcoins and USD.
ICO Limits: A modifier ensures that the total number of Hadcoins bought by all investors does not exceed the available supply.
Key Functions:
buy_hadcoins: Allows an investor to buy Hadcoins based on the USD they invest.
sell_hadcoins: Allows an investor to sell their Hadcoins and updates their equity accordingly.
equity_in_hadcoins & equity_in_usd: View functions to check an investor's equity in Hadcoins and USD.
This contract ensures transparency and accurate tracking of investor equity, and it enforces the limit on total Hadcoins available for sale.
