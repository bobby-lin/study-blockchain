// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.0;

contract Album {
    // Local state variables
    string public artist;
    string public albumTitle;
    uint public tracks;
    // Constant cannot be reassigned
    string public constant contractAuthor = "Bobby Lin";
    
    constructor() {
        artist = 'Linkin Park';
        albumTitle = 'Hybrid Theory';
        tracks = 12;
    }
    
    // For returns, we specify what will be returned using returns (...)
    function getAlbum() public returns (string memory, string memory, uint) {
        return (artist, albumTitle, tracks);
    }
    
    // For set, we specify the params that will be used to modify the local variables of the SC.
    function setAlbum(string memory _artist, string memory _albumTitle, uint _tracks) public {
        artist = _artist;
        albumTitle = _albumTitle;
        tracks = _tracks;
    }
    
}
