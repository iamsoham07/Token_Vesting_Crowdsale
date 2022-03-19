// SPDX-License-Identifier: MIT
pragma solidity >0.4.0<=0.9.0;
import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/utils/math/SafeMath.sol";

contract Sale {
  using SafeMath for uint256;

  ERC20 public token;
  address payable public wallet;
  uint256 public rate;
  uint256 public weiRaised;

  constructor(uint256 _rate, address _wallet, ERC20 _token) public {
    require(_rate > 0);
    require(_wallet != address(0));


    rate = _rate;
    wallet = payable(_wallet);
    token = _token;
  }

  fallback() external payable {
    buyTokens(payable(msg.sender));
  }

  function buyTokens(address _beneficiary) public payable {
    require(_beneficiary != address(0));
    require(msg.value!= 0);

    uint256 tokens = msg.value.mul(rate);
    weiRaised = weiRaised.add(msg.value);

    token.transfer(_beneficiary, tokens);
    wallet.transfer(msg.value);
  }
}