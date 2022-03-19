// SPDX-License-Identifier: MIT
pragma solidity >0.4.0<=0.9.0;

import "./Sale.sol";


contract PreSale is Sale {
  constructor(
    uint256 _rate,
    address _wallet,
    ERC20 _token,
    address _tokenWallet
  )
    Sale(_rate, _wallet, _token)
    public
  {}
}