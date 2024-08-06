
# Pausable Token Smart Contract

This repository contains a Solidity smart contract for a pausable token. The contract allows the owner to pause and resume token transfers, ensuring that transfers cannot occur while the contract is paused. This feature can be useful for mitigating risks in case of an emergency or potential vulnerability.

## Features

- **Ownership**: Only the owner of the contract can pause and resume the contract.
- **Pause and Resume**: The contract includes functionality to pause and resume token transfers.
- **Token Transfers**: Users can transfer tokens, but only when the contract is not paused.

## Smart Contract Details

### Modifiers

The contract uses two main modifiers to control access and functionality:

1. `onlyOwner`
    - Ensures that only the owner of the contract can call certain functions.
    - Example usage:
      ```solidity
      modifier onlyOwner() {
          require(msg.sender == owner, "You are not the owner.");
          _;
      }
      ```

2. `notPause`
    - Ensures that a function can only be called when the contract is not paused.
    - Example usage:
      ```solidity
      modifier notPause() {
          require(paused == false, "The contract is paused.");
          _;
      }
      ```

### Functions

1. `pause`
    - Pauses the contract. Can only be called by the owner.
    - Example usage:
      ```solidity
      function pause() public onlyOwner {
          paused = true;
      }
      ```

2. `resume`
    - Resumes the contract. Can only be called by the owner.
    - Example usage:
      ```solidity
      function resume() public onlyOwner {
          paused = false;
      }
      ```

3. `transfer`
    - Transfers tokens from the sender to a specified address. Can only be called when the contract is not paused.
    - Example usage:
      ```solidity
      function transfer(address to, uint amount) public notPause {
          require(balances[msg.sender] >= amount, "Insufficient balance");
          balances[msg.sender] -= amount;
          balances[to] += amount;
      }
      ```

## Getting Started

### Prerequisites

- [Node.js](https://nodejs.org/)
- [npm](https://www.npmjs.com/)
- [Hardhat](https://hardhat.org/)
- [Solidity](https://docs.soliditylang.org/)

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/pausable-token.git
   cd pausable-token
   ```

2. **Install dependencies**:
   ```bash
   npm install
   ```

3. **Compile the smart contracts**:
   ```bash
   npx hardhat compile
   ```

### Testing

To run the tests for the smart contract, use the following command:
```bash
npx hardhat test
```

### Deployment

To deploy the smart contract to a local or test Ethereum network, use:
```bash
npx hardhat run scripts/deploy.js --network localhost
```

## Contributing

Contributions are welcome! If you have suggestions, bug reports, or would like to contribute, please open an issue or submit a pull request.

1. **Fork the repository**.
2. **Create a new branch**:
   ```bash
   git checkout -b feature/your-feature
   ```
3. **Commit your changes**:
   ```bash
   git commit -m 'Add some feature'
   ```
4. **Push to the branch**:
   ```bash
   git push origin feature/your-feature
   ```
5. **Open a pull request**.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
