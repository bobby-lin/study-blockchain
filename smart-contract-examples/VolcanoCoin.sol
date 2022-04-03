// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract VolcanoCoin {
    address owner;
    uint totalSupply;
    event SupplyChange(uint);
    event TransferEvent(uint, address);
    Balance[] public balances;
    mapping(address => Payment) public paymentRef;

    modifier onlyOwner {
        if (msg.sender == owner) {
            _;
        }
    }

    struct Balance {
        address user;
        uint balance;
    }

    struct Payment {
        uint transferAmt;
        address receipt;
    }

    constructor () {
        owner = msg.sender;
        totalSupply = 10000;
        balances.push(Balance({user: owner, balance: totalSupply}));
    }

    function getTotalSupply() public view returns(uint) {
        return totalSupply;
    }

    function getPaymentRef(address _sender) public view returns(uint, address) {
        return (paymentRef[_sender].transferAmt, paymentRef[_sender].receipt);
    }

    function addSupply() public onlyOwner {
        totalSupply += 1000;
        emit SupplyChange(totalSupply);
    }

    function addAccount(address _user) public onlyOwner {
        balances.push(Balance({user: _user, balance: 0}));
    }

    function transfer(uint _amt, address _recipient) public {
        for (uint u = 0; u < balances.length; u++) {
            if(balances[u].user == _recipient) {
                balances[u].balance += _amt;
                paymentRef[msg.sender] = Payment({
                    transferAmt: 1000,
                    receipt: _recipient
                });
                break;
            }
        }
        
        emit TransferEvent(_amt, _recipient);
    } 
}
