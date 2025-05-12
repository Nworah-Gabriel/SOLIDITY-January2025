// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructExamples {

    // Basic struct
    struct User {
        uint id;
        string name;
        uint age;
        bool isActive;
    }

    // Nested struct
    struct Profile {
        User userInafo;
        string bio;
        string avatarUrl;
    }

    // Single instance
    User public singleUser;

    // Array of structs
    User[] public users;

    // Mapping of structs
    mapping(address => User) public userMap;

     // Nested Mapping
    mapping(address sender => mapping( address reciever => mapping (string message => uint value))) public Airdrop;

    // Nested mapping with struct
    mapping(address => Profile) public profiles;

    uint public userCount;

    function _returnProfileDetails(address addressKey) private view returns (
        User memory user,
        string memory bio,
        string memory avatarUrl
        ){
            user = profiles[addressKey].userInafo;
            bio = profiles[addressKey].bio;
            avatarUrl = profiles[addressKey].avatarUrl;
        }

    // Function Destructuring Implementation
    function returnProfileDetails(address addressKey) private view returns (
        // User memory user,
        // string memory user_bio
        string memory user_avatarUrl
        ){
            ( , , user_avatarUrl) = _returnProfileDetails(addressKey);
        }

    // Create and set a single user
    function setSingleUser(string memory _name, uint _age) public {
        singleUser = User(userCount++, _name, _age, true);
        Airdrop[address(0)][msg.sender]["Airdrop Reward"] = 1 ether;
    }

    // Add user to array
    function addUser(string memory _name, uint _age) public {
        users.push(User(userCount++, _name, _age, true));
    }

    // Update user in array
    function updateUser(uint index, string memory _name, uint _age) public {
        require(index < users.length, "Invalid index");
        users[index].name = _name;
        users[index].age = _age;
    }

    // Delete user from array (sets to default, doesn't remove)
    function deleteUser(uint index) public {
        require(index < users.length, "Invalid index");
        delete users[index];
    }

    // Add user to mapping
    function addUserToMap(string memory _name, uint _age) public {
        userMap[msg.sender] = User(userCount++, _name, _age, true);
    }

    // Update user in mapping
    function updateUserInMap(string memory _name, uint _age) public {
        require(userMap[msg.sender].isActive, "User not found");
        userMap[msg.sender].name = _name;
        userMap[msg.sender].age = _age;
    }

    // Delete user from mapping
    function deleteUserFromMap() public {
        delete userMap[msg.sender];
    }

    // Add nested struct (profile)
    function setProfile(string memory _name, uint _age, string memory _bio, string memory _avatarUrl) public {
        User memory newUser = User(userCount++, _name, _age, true);
        profiles[msg.sender] = Profile(newUser, _bio, _avatarUrl);
    }

    // Return a user from array
    function getUser(uint index) public view returns (User memory) {
        require(index < users.length, "Invalid index");
        return users[index];
    }

    // Return full profile
    function getProfile(address userAddr) public view returns (Profile memory) {
        return profiles[userAddr];
    }
}
