// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract SimpleStorage {
    // This initialized to 0 by default if the integers are not assigned with value
    uint256 favouriteNumber;

    mapping (string => uint256) public nameToFavouriteNumber;

    function store(uint256 _favouriteNumber) public virtual {
        favouriteNumber = _favouriteNumber;
    }

    struct People {
        uint256 favouriteNumber;
        string name;
    }

    People[] public people; // This is dynamic array if size is not given

    // This function does not cost gas fee because of the view visibility
    function retrieve() public view returns(uint256) {
        return favouriteNumber;
    }

    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        people.push(People(_favouriteNumber, _name));
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }
}
