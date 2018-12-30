pragma solidity ^0.4.23;
// written for Solidity version 0.4.18 and above that doesnt break functionality
contract Election{
    
    struct Candidate{
        uint id;
        string name;
        uint voteCount;
    }
    
    mapping(address => bool) public voters;
    
    mapping(uint => Candidate) public candidates;
    
    uint public candidatesCount;
    
    constructor() public{
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }
    
    function addCandidate(string memory _name) private{
        candidatesCount++;
        candidates[candidatesCount]= Candidate(candidatesCount, _name, 0);
    }
    
    function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;

    }
}