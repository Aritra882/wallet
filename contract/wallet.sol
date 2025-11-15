🧱 Smart Contract Code
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


⚙️ How It Works
FunctionDescriptiondeposit()Allows users to deposit ETH into their wallet stored in the smart contract.withdraw(uint256 _amount)Enables users to withdraw ETH securely from their wallet.getBalance()Displays the caller’s current balance in the wallet.getContractBalance()Shows the total ETH held by the contract overall.

🚀 How to Deploy & Test (Using Remix IDE)


Visit Remix IDE.


Click File Explorer → Create New File → name it SimpleWallet.sol.


Paste the code above into the editor.


Go to the Solidity Compiler tab → compile using version 0.8.0 or higher.


Go to the Deploy & Run Transactions tab:


Select Environment: “Remix VM (London)”


Click Deploy




After deployment:


Use the Value (in ETH) box to enter an amount (e.g., 1)


Click deposit() to send ETH into your wallet.


Use getBalance() to check your current wallet balance.


Call withdraw(amount) to take out ETH (e.g., 0.5 ETH).


Use getContractBalance() to see total ETH held in the contract.





🔐 Security Features


Each user can only withdraw their own deposited balance.


The contract rejects zero-value deposits.


Uses Solidity’s require() statements to prevent invalid transactions.


Transparent logs with events for every deposit and withdrawal.



🧩 Future Improvements
You can extend this project to:


Add owner-only administrative controls (pause, emergency withdrawal, etc.)


Support token deposits (ERC-20) instead of just ETH.


Integrate with a frontend (React + Web3.js) to create a simple dApp interface.



🧠 Author
Aritra Hazra — Blockchain enthusiast learning Solidity and Ethereum smart contract development.



