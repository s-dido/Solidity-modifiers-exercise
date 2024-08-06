// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Twitter{

    struct Tweet {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    uint16 constant Tweet_max_length = 280;

    mapping ( address => Tweet[] ) tweets;

    function createTweet(string memory _tweet) public {
        
        require (bytes(_tweet).length <= Tweet_max_length, "tweet to long");

        Tweet memory newTweet = Tweet({
        author: msg.sender,
        content: _tweet,
        timestamp: block.timestamp,
        likes: 0

        });
            tweets[msg.sender].push(newTweet);
        }

        function getTweet ( uint _i) public view returns (Tweet memory){
            return tweets[msg.sender][_i];
        }   

         function getAllTweets (address _owner) public view returns (Tweet[] memory){
            return tweets[_owner];
        }


}
