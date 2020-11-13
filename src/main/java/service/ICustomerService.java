package service;

import model.Customer;

public interface ICustomerService {
    Customer findCustomerByUsername(String username);

    void registerNewCustomer(Customer customer);
}
