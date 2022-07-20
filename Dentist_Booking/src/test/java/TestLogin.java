/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */

import com.fptproject.SWP391.controller.authentication.LoginDAO;
import com.fptproject.SWP391.model.Customer;
import java.sql.SQLException;
import org.junit.Assert;
import org.junit.Test;
/**
 *
 * @author hieunguyen
 */

public class TestLogin {
    
    public TestLogin() {
    }

    @org.junit.BeforeClass
    public static void setUpClass() throws Exception {
    }

    @org.junit.AfterClass
    public static void tearDownClass() throws Exception {
    }

    @org.junit.Before
    public void setUp() throws Exception {
    }

    @org.junit.After
    public void tearDown() throws Exception {
    }
    

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
     @Test
     public void login() throws SQLException {
         LoginDAO loginDAO = new LoginDAO();
         Customer customer = loginDAO.checkLoginCustomer("nguyentrunghieu", "123456Hieu");
         Assert.assertNotNull(customer);        
     }
}
