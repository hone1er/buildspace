pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract MyWaveContract {
    uint256 totalWaves;
    Wave[] wavers;

    event NewWave(address indexed from, uint256 timestamp, string message);

    struct Wave {
        address waver;
        string message;
        uint256 timestamp;
    }

    constructor() {
        console.log("GM");
    }

    function wave(string memory _message) public {
        totalWaves += 1;
        console.log("%s has waved!", msg.sender);
        wavers.push(Wave(msg.sender, _message, block.timestamp));
        emit NewWave(msg.sender, block.timestamp, _message);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }

    function getWavers() public view returns (Wave[] memory) {
        return wavers;
    }
}
