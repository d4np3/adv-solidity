pragma solidity ^0.5.0;

import "./KaseiCoin.sol";
import "./KaseiCoinCrowdsale.sol";

contract KaseiDeployer {
    address public kasei_tok_add;
    address public kasei_cs_add;

    constructor(
        string memory name,
        string memory symbol,
        address payable wallet
        ) public {
            KaseiCoin token = new KaseiCoin(name, symbol, 0);
            kasei_tok_add = address(token);

            KaseiCoinCrowdsale kasei_crowdsale = new KaseiCoinCrowdsale(1, wallet, token);
            kasei_cs_add = address(kasei_crowdsale);

            token.addMinter(kasei_cs_add);
            token.renounceMinter();
        }
}