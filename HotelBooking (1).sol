
 // SPDX-License-Identifier: MIT
 pragma solidity ^0.8.20;

 contract HotelBooking {

     // this is the address of hotel owner
     address public hotelOwner;


     // price for one room
     uint public roomPrice = 1 ether;


     // here i save the guest address
     address public guest;


     // this set who is the hotel owner
     constructor() {
         hotelOwner = msg.sender;
     }

    
    // this function is for book the room
    function bookRoom() public payable {

        // check if guest send correct money
        require(msg.value == roomPrice, "wrong payment");

        // save who booked the room
        guest = msg.sender;
    }




 }
