// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.0;

contract Album {
    string public constant contractAuthor = "Bobby Lin";
    MusicAlbum public currentAlbum;
    mapping(address => MusicAlbum) public userAlbums;
    event SetUserAlbums(string eventDescription, string artist, string albumTitle, uint tracks);
    address owner;

    struct MusicAlbum {
        string artist;
        string albumTitle;
        uint tracks;
    }

    constructor() {
        currentAlbum.artist = 'Linkin Park';
        currentAlbum.albumTitle = 'Hybrid Theory';
        currentAlbum.tracks = 12;
        owner = msg.sender;
    }
    
    function getCurrentAlbum() public view returns (string memory, string memory, uint) {
        return (currentAlbum.artist, currentAlbum.albumTitle, currentAlbum.tracks);
    }
    
    function setCurrentAlbum(string memory _artist, string memory _albumTitle, uint _tracks) public {
        currentAlbum.artist = _artist;
        currentAlbum.albumTitle = _albumTitle;
        currentAlbum.tracks = _tracks;
    }

    function getUserAlbums() public view returns (string memory _artist, string memory _title, uint _tracks) {
        return (userAlbums[msg.sender].artist, userAlbums[msg.sender].albumTitle, userAlbums[msg.sender].tracks);
    }

    function setUserAlbums(string memory _artist, string memory _albumTitle, uint _tracks) public {
        userAlbums[msg.sender].artist = _artist;
        userAlbums[msg.sender].albumTitle = _albumTitle;
        userAlbums[msg.sender].tracks = _tracks;
        emit SetUserAlbums("Added new album for user", _artist, _albumTitle, _tracks);
    } 
    
}
