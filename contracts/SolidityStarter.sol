// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "hardhat/console.sol";

/// @title Getting Started with Solidity
/// @author Joey Mach
/// @notice Super simple solidity contract that recieves messages from users

contract SolidityStart {
    uint256 public count;

    event MessageSent(address indexed from, string message);

    struct Message {
        address from;
        string message;
    }

    Message[] public messages;

    /// @notice Send a message to the contract
    /// @param _message The message you wish to send to the contract
    /// @dev Emits an event containg the sender's address and the message sent
    function sendMessage(string memory _message) public {
        count += 1;
        console.log("%s has waved!", msg.sender);

        messages.push(Message(msg.sender, _message));

        emit MessageSent(msg.sender, _message);
    }

    /// @notice Retrieve info of all messages that were sent to this contract
    /// @return Message[] Array of containing the messages and addresses of the sender
    function getMessages() public view returns (Message[] memory) {
        return messages;
    }

    /// @notice Retrieve the number of messages sent to this contract
    /// @return uint256 Count of the number of messages sent to this contract
    function getCount() public view returns (uint256) {
        return count;
    }
}