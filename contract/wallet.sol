
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
 * @title SimpleWallet
 * @dev A basic contract that allows users to deposit, withdraw,
 *      and check their ETH balance securely.
 */

contract SimpleWallet {

    // Mapping to store each user's balance
    mapping(address => uint256) private balances;

    // Event logs (useful for tracking transactions)
    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    // Deposit ETH into the wallet
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        balances[msg.sender] += msg.value;
        emit Deposited(msg.sender, msg.value);
    }

    // Withdraw ETH from the wallet
    function withdraw(uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
        emit Withdrawn(msg.sender, _amount);
    }

    // Check your wallet balance
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    // Get the total ETH held by this contract
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}




