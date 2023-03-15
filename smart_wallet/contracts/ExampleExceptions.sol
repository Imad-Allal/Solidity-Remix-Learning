//SPDX-License-Identifier:MIT

pragma solidity 0.8.19;


contract willThrowError{

    error NotAllowedError(string);

    function aFunction() public pure {
        //require(false, "Error Message");
        //assert(false);
        revert NotAllowedError("You're not allowed");
    }
}

contract EventHandler{

    event ErrorLogged(string The_reason_is); //Naming the key
    event ErrorCode(uint The_code_of_the_error); //Naming the key
    event ErrorCustom(bytes Custom_Error_Low_Level_Infos); //Naming the key

    function handleEvent() public{
        willThrowError will = new willThrowError();

        try will.aFunction(){
        
        }
        //"Error" is used for "require"
        catch Error(string memory message){ //The value
            emit ErrorLogged(message);
        }
        //"Panic" is used for "assert"
        catch Panic(uint errorCode){ //The value
            emit ErrorCode(errorCode);
        }
        //If not "Error" and not "Panic" (not require nor assert): ==> A custom error than:
        catch (bytes memory errorMessage){ //The value
            emit ErrorCustom(errorMessage);
        }
    }
}