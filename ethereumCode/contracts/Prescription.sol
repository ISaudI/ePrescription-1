pragma solidity ^0.4.4;

import "./abstract/AbstractPrescriptionFactory.sol";

contract Prescription {

  AbstractPrescriptionFactory creator;
  bytes32 public name;
  bytes data;
  address public issuingDoctor;
  address public patientAddress;


  function Prescription(bytes32 prescriptionName,address doctorAddress, bytes thePrescription,  address patient) {
    name = prescriptionName;
    issuingDoctor = doctorAddress;
    data = thePrescription;
    creator = AbstractPrescriptionFactory(msg.sender); // keep the reference to the creator contract
    patientAddress = patient;
    log0('hi');
  }

  function destroy(){
    if (!creator.isPharmacyTrusted(msg.sender)){
      throw;
    }
    selfdestruct(msg.sender);
  }

  function getPrescriptionData() constant returns(bytes){
    return data;
  }

  function isTrusted() constant returns(bool){
    return creator.isPharmacyTrusted(msg.sender);
  }

   function getPatientAddress() constant returns(address){
    return patientAddress;
  }

}