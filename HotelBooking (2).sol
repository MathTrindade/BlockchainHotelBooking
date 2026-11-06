

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

         // check if room is already booked
         require(guest == address(0), "room already booked");

         // check if guest send correct money
         require(msg.value == roomPrice, "wrong payment");


         // save who booked the room
         guest = msg.sender;
     }


     // this function is for owner take the money
     function withdrawPayment() public {

         // check if is the hotel owner
         require(msg.sender == hotelOwner, "only owner");

         // check if contract have money
         require(address(this).balance > 0, "no money");

         // send money to hotel owner
         (bool success, ) = payable(hotelOwner).call{
             value: address(this).balance
         }("");

         require(success, "payment failed");
     }

 }
