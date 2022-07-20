/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */

import com.fptproject.SWP391.controller.authentication.LoginDAO;
import com.fptproject.SWP391.manager.customer.AppointmentManager;
import com.fptproject.SWP391.model.Appointment;
import com.fptproject.SWP391.model.AppointmentDetail;
import com.fptproject.SWP391.model.Customer;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import org.junit.Assert;
import static org.junit.Assert.assertThrows;
import org.junit.Test;
import org.junit.function.ThrowingRunnable;

/**
 *
 * @author hieunguyen
 */
public class TestLogin_Appoitment {

    public TestLogin_Appoitment() {
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
    public void login1() throws SQLException {
        LoginDAO loginDAO = new LoginDAO();
        Customer customer = loginDAO.checkLoginCustomer("nguyentrunghieu", "123456Hieu");
        Assert.assertNotNull(customer);
    }

    @Test
    public void login2() throws SQLException {
        LoginDAO loginDAO = new LoginDAO();
        Customer customer = loginDAO.checkLoginCustomer("nasda", "asdad");
        Assert.assertNull(customer);
    }

    @Test
    public void login3() throws SQLException {
        LoginDAO loginDAO = new LoginDAO();
        Customer customer = loginDAO.checkLoginCustomer("", "");
        Assert.assertNull(customer);
    }

    @Test
    public void login4() throws SQLException {
        System.out.println("asdasd");
        LoginDAO loginDAO = new LoginDAO();
        Customer customer = loginDAO.checkLoginCustomer("nguyentrunghieu", "");
        Assert.assertNull(customer);
    }

    @Test
    public void login5() throws SQLException {
        LoginDAO loginDAO = new LoginDAO();
        Customer customer = loginDAO.checkLoginCustomer("", "123456Hieu");
        Assert.assertNull(customer);
    }

    @Test
    public void makeAppointment1() throws SQLException {
        AppointmentManager appointmentManager = new AppointmentManager();

        //get parameter
        String dentistId = "DT1";
        String customerId = "US0";

        //convert String to SQLDate using LocalDate
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d/M/yyyy");
        String date = "30/7/2022";
        LocalDate localDate = LocalDate.parse(date, formatter);
        Date meetingDate = Date.valueOf(localDate);

        //taking the time when customer books successfully
        long now = System.currentTimeMillis();
        Time bookTime = new Time(now);

        //taking the current day for book date
        Date bookDate = new Date(System.currentTimeMillis());

        String customerSymtom = "toi rat dau rang";
        String[] serviceId = {"SV0", "SV1"};
        String[] slot = {"1", "2"};

        //set status of appointment
        byte paymentConfirm = 0; //payment_confirm ( IN APPOINTMENT TABLE) : 0 is not confirm, 1 is confirm
        byte dentistConfirm = 0; //dentist_confirm ( IN APPOINTMENT TABLE) : 0 is not done yet, 1 is done
        int status = 1; //status (APPOINTMENT) : 0 is cancel, 1 is book success, 2 is checkin, 3 is complete appointment

        //init appointment id in format of APddMMYYYYQUANTITY
        String id = "AP" + localDate.getDayOfMonth() + localDate.getMonthValue() + localDate.getYear() + (appointmentManager.getQuantityOfAppointmentInOneDay(meetingDate) + 1);

        //counting number of service picked for appointment detail
        int noOfService = 0;
        for (int i = 0; i < serviceId.length; i++) {
            if (!serviceId[i].isEmpty()) {
                noOfService++;
            }
        }

        //init appointment
        AppointmentDetail[] appointmentDetail = new AppointmentDetail[noOfService];
        Appointment appointment = new Appointment(id, dentistId, customerId, meetingDate, customerSymtom, bookTime, status, paymentConfirm, dentistConfirm);
        appointment.setBookDate(bookDate);

        //init array of appointmentdetail include serviceId and slot
        for (int i = 0; i < serviceId.length; i++) {
            if (i == 1 && serviceId[i - 1].isEmpty()) {
                int defaultSlotLength = slot[i].length() - 1;//length of slot's string for taking number (1) of 'Slot no(1)'
                appointmentDetail[i - 1] = new AppointmentDetail(id, serviceId[i], Integer.valueOf(String.valueOf(slot[i].charAt(defaultSlotLength))));
                break;
            }
            if (!serviceId[i].isEmpty()) {
                int defaultSlotLength = slot[i].length() - 1;//length of slot's string for taking number (1) of 'Slot no(1)'
                appointmentDetail[i] = new AppointmentDetail(id, serviceId[i], Integer.valueOf(String.valueOf(slot[i].charAt(defaultSlotLength))));
            }
        }
        AppointmentManager manager = new AppointmentManager();
        boolean result = manager.makeAppointment(appointment, appointmentDetail);
        Assert.assertTrue(result);
    }

    @Test
    public void makeAppointment2() throws SQLException {
        Exception e = assertThrows(RuntimeException.class, new ThrowingRunnable() {
            @Override
            public void run() throws Throwable {
                AppointmentManager appointmentManager = new AppointmentManager();

                //get parameter
                String dentistId = "DT1";
                String customerId = "US0";

                //convert String to SQLDate using LocalDate
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d/M/yyyy");
                String date = "2022-7-30";
                LocalDate localDate = LocalDate.parse(date, formatter);
                Date meetingDate = Date.valueOf(localDate);

                //taking the time when customer books successfully
                long now = System.currentTimeMillis();
                Time bookTime = new Time(now);

                //taking the current day for book date
                Date bookDate = new Date(System.currentTimeMillis());

                String customerSymtom = "toi rat dau rang";
                String[] serviceId = {"SV0", "SV1"};
                String[] slot = {"1", "2"};

                //set status of appointment
                byte paymentConfirm = 0; //payment_confirm ( IN APPOINTMENT TABLE) : 0 is not confirm, 1 is confirm
                byte dentistConfirm = 0; //dentist_confirm ( IN APPOINTMENT TABLE) : 0 is not done yet, 1 is done
                int status = 1; //status (APPOINTMENT) : 0 is cancel, 1 is book success, 2 is checkin, 3 is complete appointment

                //init appointment id in format of APddMMYYYYQUANTITY
                String id = "AP" + localDate.getDayOfMonth() + localDate.getMonthValue() + localDate.getYear() + (appointmentManager.getQuantityOfAppointmentInOneDay(meetingDate) + 1);

                //counting number of service picked for appointment detail
                int noOfService = 0;
                for (int i = 0; i < serviceId.length; i++) {
                    if (!serviceId[i].isEmpty()) {
                        noOfService++;
                    }
                }

                //init appointment
                AppointmentDetail[] appointmentDetail = new AppointmentDetail[noOfService];
                Appointment appointment = new Appointment(id, dentistId, customerId, meetingDate, customerSymtom, bookTime, status, paymentConfirm, dentistConfirm);
                appointment.setBookDate(bookDate);

                //init array of appointmentdetail include serviceId and slot
                for (int i = 0; i < serviceId.length; i++) {
                    if (i == 1 && serviceId[i - 1].isEmpty()) {
                        int defaultSlotLength = slot[i].length() - 1;//length of slot's string for taking number (1) of 'Slot no(1)'
                        appointmentDetail[i - 1] = new AppointmentDetail(id, serviceId[i], Integer.valueOf(String.valueOf(slot[i].charAt(defaultSlotLength))));
                        break;
                    }
                    if (!serviceId[i].isEmpty()) {
                        int defaultSlotLength = slot[i].length() - 1;//length of slot's string for taking number (1) of 'Slot no(1)'
                        appointmentDetail[i] = new AppointmentDetail(id, serviceId[i], Integer.valueOf(String.valueOf(slot[i].charAt(defaultSlotLength))));
                    }
                }
                AppointmentManager manager = new AppointmentManager();
                boolean result = manager.makeAppointment(appointment, appointmentDetail);
            }
        });
        System.out.println(e.getMessage());
    }

    @Test
    public void makeAppointment3() throws SQLException {
        Exception e = assertThrows(RuntimeException.class, new ThrowingRunnable() {
            @Override
            public void run() throws Throwable {
                AppointmentManager appointmentManager = new AppointmentManager();

                //get parameter
                String dentistId = null;
                String customerId = null;

                //convert String to SQLDate using LocalDate
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d/M/yyyy");
                String date = null;
                LocalDate localDate = LocalDate.parse(date, formatter);
                Date meetingDate = Date.valueOf(localDate);

                //taking the time when customer books successfully
                long now = System.currentTimeMillis();
                Time bookTime = new Time(now);

                //taking the current day for book date
                Date bookDate = new Date(System.currentTimeMillis());

                String customerSymtom = null;
                String[] serviceId = null;
                String[] slot = null;

                //set status of appointment
                byte paymentConfirm = 0; //payment_confirm ( IN APPOINTMENT TABLE) : 0 is not confirm, 1 is confirm
                byte dentistConfirm = 0; //dentist_confirm ( IN APPOINTMENT TABLE) : 0 is not done yet, 1 is done
                int status = 1; //status (APPOINTMENT) : 0 is cancel, 1 is book success, 2 is checkin, 3 is complete appointment

                //init appointment id in format of APddMMYYYYQUANTITY
                String id = "AP" + localDate.getDayOfMonth() + localDate.getMonthValue() + localDate.getYear() + (appointmentManager.getQuantityOfAppointmentInOneDay(meetingDate) + 1);

                //counting number of service picked for appointment detail
                int noOfService = 0;
                for (int i = 0; i < serviceId.length; i++) {
                    if (!serviceId[i].isEmpty()) {
                        noOfService++;
                    }
                }

                //init appointment
                AppointmentDetail[] appointmentDetail = new AppointmentDetail[noOfService];
                Appointment appointment = new Appointment(id, dentistId, customerId, meetingDate, customerSymtom, bookTime, status, paymentConfirm, dentistConfirm);
                appointment.setBookDate(bookDate);

                //init array of appointmentdetail include serviceId and slot
                for (int i = 0; i < serviceId.length; i++) {
                    if (i == 1 && serviceId[i - 1].isEmpty()) {
                        int defaultSlotLength = slot[i].length() - 1;//length of slot's string for taking number (1) of 'Slot no(1)'
                        appointmentDetail[i - 1] = new AppointmentDetail(id, serviceId[i], Integer.valueOf(String.valueOf(slot[i].charAt(defaultSlotLength))));
                        break;
                    }
                    if (!serviceId[i].isEmpty()) {
                        int defaultSlotLength = slot[i].length() - 1;//length of slot's string for taking number (1) of 'Slot no(1)'
                        appointmentDetail[i] = new AppointmentDetail(id, serviceId[i], Integer.valueOf(String.valueOf(slot[i].charAt(defaultSlotLength))));
                    }
                }
                AppointmentManager manager = new AppointmentManager();
                boolean result = manager.makeAppointment(appointment, appointmentDetail);
            }
        });
        System.out.println(e);
    }
}
