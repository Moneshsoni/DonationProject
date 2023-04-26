// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Company.sol";

contract CompanyFactory{
    Company[] public companies;
    function createCompany(address _user,string memory _name)external payable{
        Company company = new Company(_user,_name);
        companies.push(company);
    }

    function getCompaniesLenth()public view returns(uint){
        return companies.length;
    }

    function getCompanies()public view returns(Company[] memory){
        return companies;
    }

}