
 // SPDX-License-Identifier: MIT
 pragma solidity ^0.8.20;

 contract HotelBooking {

     // This is the hotel owner address
     address public hotelOwner;

     // Set the owner when contract start
     constructor() {
         hotelOwner = msg.sender;
     }

 }
