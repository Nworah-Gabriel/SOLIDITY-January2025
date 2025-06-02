// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;
import {Animal} from "../abstract/implementatation.sol";

contract AnimalFactory{

    mapping( string => address) Animals;
    

    function CreateAnimal(
        string memory _name,
        string memory _movement,
        string memory _sound
    ) public returns (address){
        Animal new_animal = new Animal(
        _name,
        _movement,
        _sound
        );

        address animal_address = address(new_animal);
        Animals[_name] = animal_address;
        return animal_address;
    }

    function speak(string memory _name) public view returns (string memory){
        
        //gets contract address from the mapping
        address contract_address = Animals[_name];

        //typecasting the address to Animal type
        Animal _contract = Animal(contract_address);
        
        return _contract.speak();
    }

    function move(string memory _name) public view returns (string memory){
        
        //gets contract address from the mapping
        address contract_address = Animals[_name];

        //typecasting the address to Animal type
        Animal _contract = Animal(contract_address);
        
        return _contract.move();
    }

    function getAnimal(string memory _name) public view returns (address){
      
        //gets contract address from the mapping
        address contract_address = Animals[_name];

        return contract_address;
    }
}
