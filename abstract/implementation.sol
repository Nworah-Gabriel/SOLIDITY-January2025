
// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

abstract contract BaseAnimal {
    function speak() public view virtual returns (string memory){}

    function move() public view virtual returns (string memory){}
}

contract Animal is BaseAnimal{

    string public name;
    string private s_sound;
    string private s_movement;

    constructor (
        string memory _name,
        string memory _movement,
        string memory _sound
    ){
        name = _name;
        s_sound = _sound;
        s_movement = _movement;
    }

    function speak() public view override returns (string memory){
        return s_sound;
    }

    function move() public view override returns (string memory){
        return s_movement;
    }
}
