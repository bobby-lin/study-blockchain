// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import './PriceConverter.sol';

contract FundMe {
    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 50 * 1e18;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;
    
    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    function fund() public payable {
        require(msg.value.getConversationRate() > MINIMUM_USD, "Didn't send enough");
        funders.push(msg.sender); // address of the wallet that is sending the value
        addressToAmountFunded[msg.sender] = msg.value;
    }

    // https://solidity-by-example.org/sending-ether

    function withdraw() public OnlyOwner{
        for(uint256 funderIndex=0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        funders = new address[](0); // reset the array
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed!");

    }

    modifier OnlyOwner {
        require(msg.sender == i_owner, "Sender is not Owner!");
        _; // run the func code after the condition check
    }

    // Handle fund sent to the contract that is not using fund()

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }

}
