// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract ETH{

    mapping (address => uint) public Contributors;

    constructor() payable {}

    receive() external payable { 
        Contributors[msg.sender] += msg.value;
    }

    fallback() external payable { }
    
    function _send(uint _amount, address _reciever ) public returns (bool){
        return payable(_reciever).send(_amount);
    }

    function _transfer(uint _amount, address _reciever ) public {
        payable(_reciever).transfer(_amount);
    }

    function _call(uint _amount, address _reciever ) public returns (bool){
        (bool success, ) = payable(_reciever).call{value: _amount}("");
        return success;
    }
}
