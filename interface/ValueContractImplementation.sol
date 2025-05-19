// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

interface IValue {
    function setValue(int256 _value) external;
    function get() external view returns(int256);
}


contract MyValue{

    IValue value = IValue(0x1A9CD84b055255E14848A691828B54Ef477a818d);

    function setValue(int256 _value) public{
        value.setValue(_value);
    }
    function get() public view returns(int256){
        return value.get();
    }
}
