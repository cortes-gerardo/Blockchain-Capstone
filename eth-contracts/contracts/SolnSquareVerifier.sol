pragma solidity >=0.4.24;
import './ERC721Mintable.sol';
import '../../node_modules/openzeppelin-solidity/contracts/drafts/Counters.sol';


// TODO define another contract named SolnSquareVerifier that inherits from your ERC721Mintable class
contract SolnSquareVerifier is RealEstateToken {
    using Counters for Counters.Counter;

    Verifier private verifierContract;

    struct Solution {
        uint256 index;
        address account;
        SolutionState state;
    }
    enum SolutionState { Verified, Minted }

    Counters.Counter private solutionsCount;
    event SolutionAdded(uint256 index, address account);
    mapping (bytes32 => Solution) private solutions;

    constructor (address verifierContractAddress) public {
        verifierContract = Verifier(verifierContractAddress);
    }

    function addSolution(
        uint[2] memory a,
        uint[2][2] memory b,
        uint[2] memory c,
        uint[2] memory input
    ) public {
        bytes32 hash = getSolutionHash(input);

        require(solutions[hash].account == address(0), "Solution already exists");
        bool verification = verifierContract.verifyTx(a, b, c, input);

        require(verification == true, "RejectedSolution");
        solutionsCount.increment();
        solutions[hash] = Solution(solutionsCount.current(), msg.sender, SolutionState.Verified);

        emit SolutionAdded(solutionsCount.current(), msg.sender);
    }

    function mintBlackDevRealEstate(
        uint[2] memory a,
        uint[2][2] memory b,
        uint[2] memory c,
        uint[2] memory input
    ) public {
        bytes32 hash = getSolutionHash(input);
        require(solutions[hash].account == msg.sender, "Not owner of solution");
        require(solutions[hash].state != SolutionState.Minted, "solution already minted");

        mint(solutions[hash].account, solutions[hash].index);
        solutions[hash].state = SolutionState.Minted;
    }

    function getSolutionHash(uint[2] memory input)
    private
    returns (bytes32)
    {
        return keccak256(abi.encodePacked(input[0], input[1]));
    }
}

contract Verifier {
    function verifyTx(
        uint[2] memory a,
        uint[2][2] memory b,
        uint[2] memory c,
        uint[2] memory input ) public returns(bool){
        return true;
    }
}
