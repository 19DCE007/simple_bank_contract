// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Bank
{
    mapping(address => uint) private users;
    function deposit() public payable
    {
        users[msg.sender] += msg.value;
    }
    function withdraw(uint amount) public 
    {
        require(users[msg.sender]>=amount," Insufficient Balance ");
        payable(msg.sender).transfer(amount);
        users[msg.sender] -=amount;
    }
    function transfer(uint amount,address receiver) public 
    {
        require(users[msg.sender]>=amount," Insufficient Balance ");
        users[msg.sender] -=amount;
        users[receiver] +=amount;
    }
    function getBalance() public view returns(uint)
    {
        return users[msg.sender];
    }
       
}
