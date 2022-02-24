// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/*
interface wallet{
    function send(address to, uint256 amount);
}
*/
contract wallet is Ownable, ReentrancyGuard{
        using SafeMath for uint256;

        address token;
        mapping(address => bool) allowed;

        constructor(address _token){
            token= _token;
            allowed[msg.sender]= true;
        }

        function addOperator(address _who) public onlyOwner{
            allowed[_who]= true;
        }

        function removeOperator(address _who) public onlyOwner{
            delete allowed[_who];
        }

        function send(address to, uint256 amount) public {
            require(allowed[msg.sender], "You don't have permission to get token");
            IERC20(token).transfer(to, amount);
        }
}