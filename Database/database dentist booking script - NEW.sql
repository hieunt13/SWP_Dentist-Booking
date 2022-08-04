/*gender : 0 is male, 1 is female 
  status ( IN FEEDBACK TABLE ): 0 is reject, 1 is pending, 2 is accept
  status : 0 is inactive (delete) , 1 is active
  status ( IN CUSTOMERS TABLE ) : 0 is inactive (delete) , 1 is active, 2 is waiting
  status ( IN APPOINTMENT TABLE) : 0 is cancel, 1 is book success, 2 is checkin, 3 is complete appointment
  book_time ( IN APPOINTMENT TABLE) : the moment that the customer book success
  status ( IN INVOICE TABLE ) : 0 is unpaid, 1 is paid
  payment_method : 0 is offline, 1 is online
  blacklist_status: 0 is not in blacklist, 1 is in blacklist
  payment_confirm ( IN APPOINTMENT TABLE) : 0 is not confirm, 1 is confirm
  dentist_confirm ( IN APPOINTMENT TABLE) : 0 is not done yet, 1 is done
  available_status ( IN DENTIST AVAILABLETIME) : 0 is not available, 1 is available
  id (IN APPOINTMENT TABLE) auto generate ( Hieu set rule: format of APddMMYYYYQUANTITY)
*/
USE [master]
DROP DATABASE IF EXISTS DentistBooking 
GO

CREATE DATABASE DentistBooking
GO

USE DentistBooking
GO

CREATE TABLE Customers  
(
	id varchar(10) NOT NULL PRIMARY KEY,
	username varchar(100) NOT NULL,
	password varchar(30) NOT NULL,
	role varchar(10) NOT NULL,
	personal_name varchar(30) NOT NULL,
	age tinyint, /* tinyint: 0-255 */
	address varchar(150),
	phone_number varchar(10) NOT NULL,
	email varchar(50) ,
	gender bit NOT NULL,
	image varchar(200), 
	status tinyint NOT NULL,
	blacklist_status bit NOT NULL,
	id_hash varchar(50) NOT NULL,
	create_date datetime NOT NULL

)

GO

CREATE TABLE Dentists
(
	id varchar(10) NOT NULL PRIMARY KEY,
	username varchar(30) NOT NULL,
	password varchar(30) NOT NULL,
	role varchar(10) NOT NULL,
	personal_name varchar(30) NOT NULL,
	rate float NOT NULL,
	gender bit NOT NULL,
	status bit NOT NULL,
	speciality varchar(30),
	description varchar(500),
	education varchar(300),
	working_experience int,
	award varchar(300),
	image varchar(200)
	

)

GO

CREATE TABLE DentistAvailiableTime
(
	dentist_id varchar(10) NOT NULL,
	slot tinyint NOT NULL, /* tinyint: 0-255 */
	day_of_week varchar(20) NOT NULL,
	available_status bit NOT NULL,
	CONSTRAINT fk_DentostAvailiableTime_Dentists_id FOREIGN KEY(dentist_id) REFERENCES Dentists(id),
	CONSTRAINT pk_DentistAvailiableTime PRIMARY KEY(dentist_id,slot,day_of_week)
)

GO

CREATE TABLE Promotions
(
	id varchar(10) NOT NULL PRIMARY KEY ,
	promotion_name varchar(30) NOT NULL,
	long_description varchar(600) NOT NULL,
	short_description varchar(1000) NOT NULL,
	image varchar(200) NOT NULL,
	discount_percentage float NOT NULL,
	expired_date date NOT NULL,
	status bit NOT NULL,
)

GO

CREATE TABLE Services
(
	id varchar(10) NOT NULL PRIMARY KEY,
	service_name varchar(30) NOT NULL,
	promotion_id varchar(10),
	short_description varchar(600) NOT NULL,
	long_description varchar(1000) NOT NULL,
	price int NOT NULL,
	image varchar(200) NOT NULL,
	status bit NOT NULL,
	CONSTRAINT fk_Service_Promotion_id FOREIGN KEY(promotion_id) REFERENCES Promotions(id)
)

GO

CREATE TABLE Appointments
(
	id varchar(14) NOT NULL PRIMARY KEY,
	dentist_id varchar(10) NOT NULL,
	customer_id varchar(10) NOT NULL,
	meeting_date date NOT NULL,
	dentist_note varchar(600),
	customer_symptom varchar(500),
	book_time time(0) NOT NULL,
	book_date date NOT NULL,
	status tinyint NOT NULL, /* tinyint: 0-255 */
	payment_confirm bit NOT NULL,
	dentist_confirm tinyint NOT NULL, /* tinyint: 0-255 */
	CONSTRAINT fk_Appointments_Dentists_id FOREIGN KEY(dentist_id) REFERENCES Dentists(id),
	CONSTRAINT fk_Appointments_Customers_id FOREIGN KEY(customer_id) REFERENCES Customers(id),

)
GO

CREATE TABLE AppointmentDetail
(
	id varchar(14) NOT NULL,
	service_id varchar(10) NOT NULL,
	slot tinyint NOT NULL, /* tinyint: 0-255 */
	CONSTRAINT fk_AppointmentsDetail_Appointments_id FOREIGN KEY(id) REFERENCES Appointments(id) ON DELETE CASCADE,
	CONSTRAINT fk_AppointmentsDetail_Services_id FOREIGN KEY(service_id) REFERENCES Services(id),
	CONSTRAINT pk_AppointmentDetail PRIMARY KEY(id,slot)
)
GO


CREATE TABLE Feedbacks
(
	id varchar(10) NOT NULL PRIMARY KEY,
	appointment_id varchar(14) NOT NULL,
	dentist_rating float NOT NULL,
	dentist_message varchar(8000) NOT NULL,
	status tinyint NOT NULL,
	CONSTRAINT fk_Feedbacks_Appointments_id FOREIGN KEY (appointment_id) REFERENCES Appointments(id) ON DELETE CASCADE
)

GO

CREATE TABLE Employees
(
	id varchar(10) NOT NULL PRIMARY KEY,
	username varchar(30) NOT NULL,
	password varchar(30) NOT NULL,
	role varchar(10) NOT NULL,
	personal_name varchar(30) NOT NULL,
	phone_number varchar(10) NOT NULL,
	email varchar(50) NOT NULL,
	image varchar(200) NOT NULL

)

GO

CREATE TABLE Invoices
(
	id varchar(10) NOT NULL,
	appointment_id varchar(14) NOT NULL,
	employee_id varchar(10) NOT NULL,
	price int NOT NULL,
	payment_method bit NOT NULL,
	creditcard_inf varchar(30),
	status bit NOT NULL,
	CONSTRAINT fk_Invoice_Appointments_id FOREIGN KEY(appointment_id) REFERENCES Appointments(id) ON DELETE CASCADE,
	CONSTRAINT fk_Invoice_Employees_id FOREIGN KEY(employee_id) REFERENCES Employees(id)

)

GO

CREATE TABLE ClinicInfomation
(
	open_time time(0) NOT NULL,
	close_time time(0) NOT NULL,
	name varchar(30) NOT NULL,
	address varchar(100) NOT NULL,
	phone varchar(10) NOT NULL,
	email varchar(50) NOT NULL 
)

GO

INSERT ClinicInfomation ( [open_time], [close_time], [name], [address], [phone], [email] )
VALUES	('7:00:00', '19:00:00', 'Dental Clinic', 'E2a-7,D1 street, D. D1, Thu Duc City', '0907586364', 'dentalclcinic@gmail.com')

INSERT Customers ([id], [username], [password], [role], [personal_name], [age], [address], [phone_number], [email], [gender], [image], [status], [blacklist_status], [id_hash], [create_date])
VALUES	('US0', 'hoangminhan', '123456An', 'USER', 'Hoang Minh An', 19, '135 Nam Ki Khoi Nghia street, district 1, Ho Chi Minh City', '0902746375','hoangminhan@gmail.com',0, 'assets/img/patients/patient2.jpg', 1,0,'1e4a91df9aa5c1267833177860532f76','2022-05-20 09:29:50'),
		('US1', 'luugiavinh', '123456Vinh', 'USER', 'Luu Gia Vinh', 19, '720 Dien Bien Phu street, Binh Thanh district, Ho Chi Minh City', '0905647289', 'luugiavinh@gmail.com',0, 'assets/img/patients/patient3.jpg',1,0,'3b8114914a1c8b2faab8e73f0339f5ed','2022-06-23 07:30:50'),
		('US2', 'nguyentrunghieu', '123456Hieu', 'USER', 'Nguyen Trung Hieu', 21, '7 Cong Truong Lam Son street, district 1, Ho Chi Minh City', '0903748264', 'nguyentrunghieu@gmail.com',0, 'assets/img/patients/patient8.jpg',1,0,'377eba7d5140a5e9331181f95d5168cd','2022-05-15 15:21:30'),
		('US3', 'nguyenhaidang', '123456Dang', 'USER', 'Nguyen Hai Dang', 20, '1 Nguyen Tat Thanh street, district 4, Ho Chi Minh City', '0903748627', 'nguyenhaidang@gmail.com',0, 'assets/img/patients/patient9.jpg',1,0,'db2851326a0706e5fe0c444243358cbe','2022-05-17 10:59:02'),
		('US4', 'tranminhkhang', '123456Khang', 'USER', 'Tran Minh Khang', 20, '3 Hoa Binh street, district 11, Ho Chi Minh City', '0902736581', 'tranminhkhang@gmail.com',0, 'assets/img/patients/patient10.jpg',1,0,'23d892e113d48bad48f4d722fad1f444','2022-05-27 04:50:20'),
		('US5', 'nguyenhuucanh', '123456Canh', 'USER', 'Nguyen Huu Canh', 22, '10 Nguyen Tat Thanh street, district 4, Ho Chi Minh City', '0903368627', 'nguyenhuucanh@gmail.com',0, 'assets/img/patients/patient12.jpg',1,0,'973f88bc1f110fbc27ad91963ffea58b','2022-05-21 17:40:20'),
		('US6', 'legiahan', '123456Han', 'USER', 'Le Gia Han', 17, '46 Hoa Binh street, district 11, Ho Chi Minh City', '0903837527', 'legiahan@gmail.com',1, 'assets/img/patients/patient4.jpg',1,0,'2a0a91bb70a3fc2ceb02f30fb3d7c2d6','2022-05-24 15:39:10'),
		('US7', 'phamdoantrang', '123456Trang', 'USER', 'Pham Doan Trang', 18, '10 Nguyen Tat Thanh street, district 4, Ho Chi Minh City', '0903831576', 'phamdoantrang@gmail.com',1, 'assets/img/patients/patient6.jpg',1,0,'94d19af173b70e25de8538065b2c5bac','2022-05-20 09:29:50'),
		('US8', 'nguyenlinhlan', '123456Lan', 'USER', 'Nguyen Linh Lan', 23, '15 Nguyen Tat Thanh street, district 4, Ho Chi Minh City', '0901645276', 'nguyenlinhlan@gmail.com',1, 'assets/img/patients/patient7.jpg',1,0,'21011623ac2533cda333b3df2b2f3b65','2022-05-20 11:22:33'),
		('US9', 'phamthienthanh', '123456Thanh', 'USER', 'Pham Thien Thanh', 16, '7 Dien Bien Phu street, Binh Thanh district, Ho Chi Minh City', '0901348276', 'phamthienthanh@gmail.com',1, 'assets/img/patients/patient13.jpg',1,0,'25a95799504c0f3ec78a38b05f663803','2022-06-12 10:22:50'),
		('US10', 'tranlethu', '123456Thu', 'USER', 'Tran Le Thu', 15, '48 Dien Bien Phu street, Binh Thanh district, Ho Chi Minh City', '0903965276', 'tranlethu@gmail.com',1, 'assets/img/patients/patient15.jpg',1,0,'fb9edf1ce4fdf1ee201e9ea1ae4310a7','2022-05-27 12:29:22'),
		('US11', 'tranthanhthuy', '123456Thuy', 'USER', 'Tran Thanh Thuy', 21, '48 Dien Bien Phu street, Binh Thanh district, Ho Chi Minh City', '0908455276', 'tranthanhthuy@gmail.com',1, 'assets/img/patients/patient6.jpg',1,0,'7f70269fa6fd1671b61a553b89636283','2022-05-29 12:29:50'),
		('US12', 'hoanglananh', '123456Anh', 'USER', 'Hoang Lan Anh', 15, ' 54 Cong Truong Lam Son street, district 1, Ho Chi Minh City', '0903396276', 'hoanglananh@gmail.com',1, 'assets/img/patients/patient6.jpg',1,0,'bbc33e3226d99e4330151208247e5646','2022-06-27 11:29:50')
GO


/* ------------------- INSERT DENTIST------------------------- */

DECLARE @DT0_description AS varchar(500)
SET @DT0_description = 'I am Le Gia Huy who is a dedicated dentist in the dental field. Passionate about educating patients on the importance of oral hygiene. Committed to providing the best patient care through communication and high-quality service. Experience in working with children, adolescents, and adults, as well as those who suffer from dental anxiety. ';

DECLARE @DT1_description AS varchar(500)
SET @DT1_description = 'I am Nguyen Khanh Duy who is a dedicated dentist in the dental field. Passionate about educating patients on the importance of oral hygiene. Committed to providing the best patient care through communication and high-quality service. Experience in working with children, adolescents, and adults, as well as those who suffer from dental anxiety. ';

DECLARE @DT2_description AS varchar(500)
SET @DT2_description = 'I am Tran Thuy Tan who is a dedicated dentist in the dental field. Passionate about educating patients on the importance of oral hygiene. Committed to providing the best patient care through communication and high-quality service. Experience in working with children, adolescents, and adults, as well as those who suffer from dental anxiety. ';

DECLARE @DT3_description AS varchar(500)
SET @DT3_description = 'I am Cao Trong Hieu who is a dedicated dentist in the dental field. Passionate about educating patients on the importance of oral hygiene. Committed to providing the best patient care through communication and high-quality service. Experience in working with children, adolescents, and adults, as well as those who suffer from dental anxiety. ';

DECLARE @DT4_description AS varchar(500)
SET @DT4_description = 'I am Nguyen Minh Tri who is a dedicated dentist in the dental field. Passionate about educating patients on the importance of oral hygiene. Committed to providing the best patient care through communication and high-quality service. Experience in working with children, adolescents, and adults, as well as those who suffer from dental anxiety. ';

DECLARE @DT5_description AS varchar(500)
SET @DT5_description = 'I am Pham Minh Tam who is a dedicated dentist in the dental field. Passionate about educating patients on the importance of oral hygiene. Committed to providing the best patient care through communication and high-quality service. Experience in working with children, adolescents, and adults, as well as those who suffer from dental anxiety. ';

DECLARE @DT6_description AS varchar(500)
SET @DT6_description = 'I am Le Lan Huong who is a dedicated dentist in the dental field. Passionate about educating patients on the importance of oral hygiene. Committed to providing the best patient care through communication and high-quality service. Experience in working with children, adolescents, and adults, as well as those who suffer from dental anxiety. ';

DECLARE @DT7_description AS varchar(500)
SET @DT7_description = 'I am Ngoc Ai Linh who is a dedicated dentist in the dental field. Passionate about educating patients on the importance of oral hygiene. Committed to providing the best patient care through communication and high-quality service. Experience in working with children, adolescents, and adults, as well as those who suffer from dental anxiety. ';

DECLARE @DT8_description AS varchar(500)
SET @DT8_description = 'I am Nguyen Thanh Thao who is a dedicated dentist in the dental field. Passionate about educating patients on the importance of oral hygiene. Committed to providing the best patient care through communication and high-quality service. Experience in working with children, adolescents, and adults, as well as those who suffer from dental anxiety. ';

DECLARE @DT9_description AS varchar(500)
SET @DT9_description = 'I am Le Diem Chau who is a dedicated dentist in the dental field. Passionate about educating patients on the importance of oral hygiene. Committed to providing the best patient care through communication and high-quality service. Experience in working with children, adolescents, and adults, as well as those who suffer from dental anxiety. ';

DECLARE @DT10_description AS varchar(500)
SET @DT10_description = 'I am To Thuy Nga who is a dedicated dentist in the dental field. Passionate about educating patients on the importance of oral hygiene. Committed to providing the best patient care through communication and high-quality service. Experience in working with children, adolescents, and adults, as well as those who suffer from dental anxiety. ';

DECLARE @DT11_description AS varchar(500)
SET @DT11_description = 'I am Ta Quoc Thinh who is a dedicated dentist in the dental field. Passionate about educating patients on the importance of oral hygiene. Committed to providing the best patient care through communication and high-quality service. Experience in working with children, adolescents, and adults, as well as those who suffer from dental anxiety. ';

DECLARE @DT12_description AS varchar(500)
SET @DT12_description = 'I am Nguyen Minh Quan who is a dedicated dentist in the dental field. Passionate about educating patients on the importance of oral hygiene. Committed to providing the best patient care through communication and high-quality service. Experience in working with children, adolescents, and adults, as well as those who suffer from dental anxiety. ';

DECLARE @DT13_description AS varchar(500)
SET @DT13_description = 'I am Huynh Huu Nhan who is a dedicated dentist in the dental field. Passionate about educating patients on the importance of oral hygiene. Committed to providing the best patient care through communication and high-quality service. Experience in working with children, adolescents, and adults, as well as those who suffer from dental anxiety. ';


INSERT Dentists ([id], [username], [password], [role], [personal_name], [rate], [gender], [status], [speciality], [description], [education], [working_experience], [award], [image])
VALUES	('DT0', 'legiahuy', '123456Huy', 'DENTIST', 'Le Gia Huy', 4.5, 0, 1, 'Pedodontist', @DT0_description, 'Graduated from FPT University',3, 'Smile Awards, Humanitarian Award', 'assets/img/doctors/doctor-thumb-02.jpg'),
		('DT1', 'nguyenkhanhduy', '123456Duy', 'DENTIST', 'Nguyen Khanh Duy', 4.9, 0, 1, 'Orthodontist', @DT1_description, 'Graduated from Hoa Sen University',4, 'AGD Recognition Award, IAE Award', 'assets/img/doctors/doctor-thumb-08.jpg'),
		('DT2', 'tranthuytan', '123456Tan', 'DENTIST', 'Tran Thuy Tan', 4.9, 0, 1, 'Periodontist', @DT2_description, 'Graduated from Ton Duc Thang University',6, 'The Dental Professional of The Year Award, Innovative Dentist Of The Year', 'assets/img/doctors/doctor-thumb-02.jpg'),
		('DT3', 'caotronghieu', '123456Hieu', 'DENTIST', 'Cao Trong Hieu', 4.8, 0, 1, 'Endodontist', @DT3_description, 'Graduated from FPT University',5 ,'Certificate for International Volunteer Service, Outstanding Dentsit Of The Year', 'assets/img/doctors/doctor-thumb-09.jpg'),
		('DT4', 'nguyenminhtri', '123456Tri', 'DENTIST', 'Nguyen Minh Tri', 4.8, 0, 1, 'Prosthodontist', @DT4_description, 'Graduated from Hoa Sen University',4, 'Smile Awards, Humanitarian Award', 'assets/img/doctors/doctor-thumb-08.jpg'),
		('DT5', 'phamminhtam', '123456Tam', 'DENTIST', 'Pham Minh Tam', 4.6, 1, 1, 'Prosthodontist', @DT5_description, 'Graduated from Hoa Sen University',4, 'Smile Awards, Humanitarian Award', 'assets/img/doctors/doctor-thumb-03.jpg'),
		('DT6', 'lelanhuong', '123456Huong', 'DENTIST', 'Le Lan Huong', 4.7, 1, 1, 'Periodontist', @DT6_description, 'Graduated from Ton Duc Thang University',2, 'Certificate for International Volunteer Service', 'assets/img/doctors/doctor-thumb-01.jpg'),
		('DT7', 'ngocailinh', '123456Linh', 'DENTIST', 'Ngoc Ai Linh', 4.9, 1, 1, 'Endodontist', @DT7_description, 'Graduated from Bach Khoa University',3, 'AGD Recognition Award', 'assets/img/doctors/doctor-thumb-01.jpg'),
		('DT8', 'nguyenthanhthao', '123456Thao', 'DENTIST', 'Nguyen Thanh Thao', 5, 1, 1, 'Orthodontist', @DT8_description, 'Graduated from Bach Khoa University',5, 'The Dental Professional of The Year Award, Humanitarian Award', 'assets/img/doctors/doctor-thumb-03.jpg'),
		('DT9', 'lediemchau', '123456Thao', 'DENTIST', 'Le Diem Chau', 5, 1, 1, 'Orthodontist', @DT9_description, 'Graduated from Y Duoc University',5, 'The Dental Professional of The Year Award', 'assets/img/doctors/doctor-thumb-01.jpg'),
		('DT10', 'tothuynga', '123456Nga', 'DENTIST', 'To Thuy Nga', 4.5, 1, 1, 'Endodontist', @DT10_description, 'Graduated from Hoa Sen University',3, 'Smile Awards, Certificate for International Volunteer Service', 'assets/img/doctors/doctor-thumb-03.jpg'),
		('DT11', 'taquocthinh', '123456Thinh', 'DENTIST', 'Ta Quoc Thinh', 4.7, 0, 1, 'Pedodontist', @DT11_description, 'Graduated from FPT University',4, 'Smile Awards, IAE Award', 'assets/img/doctors/doctor-thumb-08.jpg'),
		('DT12', 'nguyenminhquan', '123456Quan', 'DENTIST', 'Nguyen Minh Quan', 4.5, 0, 1, 'Pedodontist', @DT12_description, 'Graduated from Y Duoc University',5, 'The Dental Professional of The Year Award', 'assets/img/doctors/doctor-thumb-09.jpg'),
		('DT13', 'huynhhuunhan', '123456Nhan', 'DENTIST', 'Huynh Huu Nhan', 4.7, 0, 1, 'Periodontist', @DT13_description, 'Graduated from Hoa Sen University',3, 'Certificate for International Volunteer Service', 'assets/img/doctors/doctor-thumb-02.jpg')
GO


/* ------------------- INSERT DENTIST------------------------- */

INSERT DentistAvailiableTime ([dentist_id], [slot], [day_of_week], [available_status]) 
VALUES	(N'DT0', 1, N'Friday', 1),
		(N'DT0', 1, N'Monday', 1),
		(N'DT0', 1, N'Thursday', 1),
		(N'DT0', 1, N'Wednesday', 1),
		(N'DT0', 2, N'Friday', 1),
		(N'DT0', 2, N'saturday', 1),
		(N'DT0', 2, N'sunday', 1),
		(N'DT0', 2, N'Tuesday', 1),
		(N'DT0', 2, N'Wednesday', 1),
		(N'DT0', 3, N'sunday', 1),
		(N'DT0', 3, N'Thursday', 1),
		(N'DT0', 3, N'Tuesday', 1),
		(N'DT0', 4, N'Monday', 1),
		(N'DT0', 4, N'saturday', 1),
		(N'DT0', 4, N'sunday', 1),
		(N'DT0', 4, N'Thursday', 1),
		(N'DT0', 4, N'Tuesday', 1),
		(N'DT0', 5, N'Monday', 1),
		(N'DT0', 5, N'saturday', 1),
		(N'DT0', 5, N'Wednesday', 1),
		(N'DT0', 6, N'Friday', 1),
		(N'DT0', 6, N'Wednesday', 1),
		(N'DT1', 1, N'monday', 1),
		(N'DT1', 1, N'saturday', 1),
		(N'DT1', 1, N'thursday', 1),
		(N'DT1', 2, N'friday', 1),
		(N'DT1', 2, N'saturday', 1),
		(N'DT1', 2, N'sunday', 1),
		(N'DT1', 2, N'tuesday', 1),
		(N'DT1', 2, N'wednesday', 1),
		(N'DT1', 3, N'friday', 1),
		(N'DT1', 3, N'monday', 1),
		(N'DT1', 3, N'sunday', 1),
		(N'DT1', 3, N'Wednesday', 1),
		(N'DT1', 4, N'monday', 1),
		(N'DT1', 4, N'thursday', 1),
		(N'DT1', 5, N'friday', 1),
		(N'DT1', 5, N'thursday', 1),
		(N'DT1', 5, N'tuesday', 1),
		(N'DT1', 6, N'friday', 1),
		(N'DT1', 6, N'tuesday', 1),
		(N'DT2', 2, N'Friday', 1),
		(N'DT2', 3, N'Thursday', 1),
		(N'DT3', 5, N'Friday', 1),
		(N'DT4', 6, N'Saturday', 1)  



GO


INSERT Employees ([id], [username], [password], [role], [personal_name], [phone_number], [email], [image]) 
VALUES	(N'AD', N'admin', N'123admin', N'ADMIN', N'I am Admin', '0901234567', N'admin@gmail.com','assets/img/employees/patient.jpg'),  
		(N'EP0', N'nguyenducthien', N'123456Thien', N'STAFF', N'Nguyen Duc Thien', N'123456789', N'minhan@gmail.com','assets/img/employees/patient3.jpg'),
		(N'EP1', N'Nguyenthanhhoa', N'123456Hoa', N'STAFF', N'Nguyen Thanh Hoa', N'123456789', N'giavinh@gmail.com','assets/img/employees/patient2.jpg'),
		(N'EP2', N'thuyngoctoan', N'123456Toan', N'STAFF', N'Nguyen Hai Dang', N'123456789', N'haidang@gmail.com','assets/img/employees/patient4.jpg'),
		(N'EP3', N'ngoviettien', N'123456Tien', N'STAFF', N'Ngo Viet Tien', N'123456789', N'trunghieu@gmail.com','assets/img/employees/patient1.jpg')


GO

INSERT Promotions ([id], [promotion_name], [long_description], [short_description], [image], [discount_percentage], [expired_date], [status])
VALUES	(N'PR0', 'Discount 20 percentage',N'We have a special discount 20% for our dear customer', N'Monthly Discount', N'assets/img/promotions/special-discount-02.png', 0.2, '2022-08-21',1),
		(N'PR1', 'Discount 30 percentage',N'We have a special discount 30% for our dear customer', N'Monthly Discount', N'assets/img/promotions/special-discount-01.png', 0.3, '2022-07-25',0),
		(N'PR2', 'Discount 40 percentage',N'We have a special discount 40% for our dear customer', N'Monthly Discount', N'assets/img/promotions/special-discount-02.png', 0.4, '2022-08-10',1),
		(N'PR3', 'Discount 50 percentage',N'We have a special discount 50% for our dear customer', N'Monthly Discount', N'assets/img/promotions/special-discount-01.png', 0.5, '2022-07-28',0),
		(N'PR4', 'Discount 10 percentage',N'We have a special discount 10% for our dear customer', N'Monthly Discount', N'assets/img/promotions/special-discount-02.png', 0.1, '2022-08-28',1),
		(N'PR5', 'Discount 40 percentage',N'Come to our clinic during this week, you will get a discount 40%', N'Weekly Discount', N'assets/img/promotions/special-discount-02.png', 0.4, '2022-08-07',1),
		(N'PR6', 'Discount 30 percentage',N'Come to our clinic during this week, you will get a discount 30%', N'Weekly Discount', N'assets/img/promotions/special-discount-01.png', 0.3, '2022-08-07',1),
		(N'PR7', 'Discount 25 percentage',N'We have a discount 25% for you. Merry Chirstmas', N'Christmas', N'assets/img/promotions/special-discount-02.png', 0.25, '2022-12-29',1),
		(N'PR8', 'Discount 60 percentage',N'To celebrate 2th annivesary, we offer 60% discount to you', N'2th Anniversary', N'assets/img/promotions/special-discount-02.png', 0.6, '2022-10-19',1),
		(N'PR9', 'Discount 35 percentage',N'To celebrate Halloween day, we have 35% discount for everyon', N'Halloween', N'assets/img/promotions/special-discount-01.png', 0.35, '2022-10-31',1),
		(N'PR10', 'Discount 15 percentage',N'To celebrate Thanksgiving day, we have 15% discount for everyone', N'Thanksgiving', N'assets/img/promotions/special-discount-01.png', 0.35, '2022-11-26',1),
		(N'PR11', 'Discount 45 percentage',N'Happy New Year, this is a 45% discount for you', N'New Year', N'assets/img/promotions/special-discount-02.png', 0.45, '2023-01-12',1)

GO



/* ------------------- INSERT SERVICE------------------------- */

/*Service 0*/
DECLARE @SV0_short_description AS varchar(600);
DECLARE @SV0_long_description AS varchar(1000);
SET @SV0_short_description = 'A consultation with our dentist if you are seeking for advice';
SET @SV0_long_description = 'The dentist t you choose will ask questions about your health, conduct a clinical exam, take impressions of your teeth, take photos of your face and teeth, and order X-rays of the mouth and head. An appropriate treatment plan is made based on analysis of the gathered information. '
									
INSERT Services ([id], [service_name], [promotion_id], [short_description], [long_description], [price], [image], [status])
VALUES ('SV0', 'Consultation With Dentist', null, @SV0_short_description, @SV0_long_description, 25, 'assets/img/specialities/specialities-05.png', 1)


/*Service 1*/
DECLARE @SV1_short_description AS varchar(600);
DECLARE @SV1_long_description AS varchar(1000);
SET @SV1_short_description = 'More and more people are having success with clear orthodontic devices called aligners. '
SET @SV1_long_description= 'Clear orthodontic aligners are typically used for patients who have mild or moderately crowded teeth, or have minor spacing issues. Patients who have severe crowding or spacing problems � or severe underbites, overbites, or crossbites � may need more complex treatment.'
							 + 'Once a dentist or orthodontist decides how to correct your bite, they�ll make a plan for moving your teeth. If you get the clear aligners, you�ll be fitted for several versions that make slight adjustments to move your teeth over the treatment time.'
							 + 'They�re made from a clear plastic or acrylic material and fit tightly over the teeth, but can be removed for eating, brushing, and flossing. You�ll get a new aligner every few weeks to continue moving the teeth into the desired position. Treatment usually takes between 10 and 24 months.'
INSERT Services ([id], [service_name], [promotion_id], [short_description], [long_description], [price], [image], [status])
VALUES ('SV1', 'Invisible Aligners For Teeth', null, @SV1_short_description, @SV1_long_description, 700, 'assets/img/specialities/specialities-05.png', 1)


/*Service 2*/
DECLARE @SV2_short_description AS varchar(600);
DECLARE @SV2_long_description AS varchar(1000);
SET @SV2_short_description = 'Wisdom tooths (or tooth number 8) are harmful because they cause many complications.'
SET @SV2_long_description= 'Difficulty of wisdom tooth extraction depends on: Tooth shape, Anatomy of teeth ,Tooth axis: tilted near, horizontal, vertical, far inclined, Depth of underground teeth ,Bone stiffness, The extent of the patients open mouththe distance between teeth and branches on the lower jaw bone
							'
							 + '1. STEP PREPARATION BEFORE YOU DRY TOOL: Examination on mouth, Take a panoramic movie and check (take CT movie if necessary), Blood test (As directed by your doctor), Clean teeth, scrape tartar
							 '
							 + '2. PROCESS OF DISPOSING 1 MISCELLANEOUS AT UCARE:Disinfect in place according to aseptic procedure of minor surgery, Anesthetize, Slitting the gums, Dissecting gums and bones, Sharpening and cutting bone around teeth, revealing underground teeth, Split teeth, remove teeth, Scraping granulation tissue and bone fragments, Toothpaste flushing pump, Stitch hemostasis'
INSERT Services ([id], [service_name], [promotion_id], [short_description], [long_description], [price], [image], [status])
VALUES ('SV2', 'Wisdom Tooth Extraction', 'PR0', @SV2_short_description, @SV2_long_description, 180, 'assets/img/specialities/specialities-05.png', 1)


/*Service 3*/
DECLARE @SV3_short_description AS varchar(600);
DECLARE @SV3_long_description AS varchar(1000);
SET @SV3_short_description = 'When we lose one or more even permanent teeth and we do not restore those teeth by denture methods.';
SET @SV3_long_description= 'In the removable function there are 2 types: Partial removable jaw (the patient still has many teeth in the arch of the jaw) is usually metal or also called the jaw frame, Full removable jaw (when the patient loses all teeth) is usually made of plastic
							'
							 + 'The jaw frame is a semi-removable prosthesis with the main part being a metal frame, the whole alloy structure of the frame (hook, saddle, connecting rod) is molded together into one block. Replacement teeth are attached to acrylic restorations.
							 '
					 		 + 'Material made of metal frame jaw so high gloss, high gloss prevents oral fluids from getting into the denture convenient for cleaning. Compared with fixed dental porcelain prostheses, the jaw frame does not have to be sharpened and costs less, not to interfere with some intact teeth (root canal) to make prosthetic.'
INSERT Services ([id], [service_name], [promotion_id], [short_description], [long_description], [price], [image], [status])
VALUES ('SV3', 'Removable Dentures', 'PR5', @SV3_short_description, @SV3_long_description, 340, 'assets/img/specialities/specialities-05.png', 1)


/*Service 4 */
DECLARE @SV4_short_description AS varchar(600);
DECLARE @SV4_long_description AS varchar(1000);
SET @SV4_short_description = 'A root canal is a tooth treatment that attempts to save a decayed or infected tooth. '
SET @SV4_long_description= 'Root canal treatment (also called a root canal) is done when decay will likely damage or has already killed a tooth. During a root canal, a dentist or endodontist removes the pulp from the center of a tooth and fills the pulp cavity. '
							 + 'This can prevent the development of a painful infection in the pulp that may spread to other teeth. A root canal can also treat an infection that has developed into an abscessed tooth. This procedure can relieve toothache, stop infection, and promote healing.
							 '
							 + 'After the root canal, a permanent filling or crown (cap) is often needed. If a crown is needed, the dentist removes the decay and then makes an impression of the tooth. A technician uses the impression to make a crown that perfectly matches the drilled tooth. '
							 + 'The tooth may be fitted with a temporary crown until the permanent crown is made and cemented into place. ';
INSERT Services ([id], [service_name], [promotion_id], [short_description], [long_description], [price], [image], [status])
VALUES ('SV4', 'Root Canal Treatment', 'PR2', @SV4_short_description, @SV4_long_description, 120, 'assets/img/specialities/specialities-05.png', 1)


/*Service 5 */
DECLARE @SV5_short_description AS varchar(600);
DECLARE @SV5_long_description AS varchar(1000);
SET @SV5_short_description = 'Tooth decay is a fairly common disease in the early stages of tooth decay.'
SET @SV5_long_description= 'Caries on baby teeth usually start in pits and grooves. Small lesions are difficult to detect with the naked eye, but large lesions often show a hole in the occlusal surface. '
							 + 'he location of caries is usually on the side (the contact surface between teeth) and the lesions due to cavities are usually manifested on smooth surfaces (outer and inner). '
							 + 'The age of a child with tooth decay is important in the treatment of children caries. For children under 3 years of age who do not use the procedure, but require support such as restraint, anesthesia or anesthesia during fillings. '
INSERT Services ([id], [service_name], [promotion_id], [short_description], [long_description], [price], [image], [status])
VALUES ('SV5', 'Children Cavities ', 'PR4', @SV5_short_description, @SV5_long_description, 150, 'assets/img/specialities/specialities-05.png', 1)


/*Service 6 */
DECLARE @SV6_short_description AS varchar(600);
DECLARE @SV6_long_description AS varchar(1000);
SET @SV6_short_description = 'Worn neck cause unpleasant annoyances and aesthetic loss when communicating. '
SET @SV6_long_description= 'If the tooth is not treated promptly, it will cause the following consequences:'
							 + 'Teeth will lose more hard tissue to protect tooth enamel causing sensitivity, sensitivity. '
							 + 'Next is the root canal that causes the pulp to become inflamed, the inflammation around the base of the tooth spreads causing your teeth to hurt. More serious is the cause of fractures, fractures. Therefore, the early detection and treatment will be simpler. '
INSERT Services ([id], [service_name], [promotion_id], [short_description], [long_description], [price], [image], [status])
VALUES ('SV6', 'Old worn teeth', 'PR6', @SV6_short_description, @SV6_long_description, 130, 'assets/img/specialities/specialities-05.png', 1)


/*Service 7 */
DECLARE @SV7_short_description AS varchar(600);
DECLARE @SV7_long_description AS varchar(1000);
SET @SV7_short_description = 'Your dentist will explain how to care for your teeth following the procedure.';
SET @SV7_long_description= 'If you think you may have gingivitis, you can take some simple steps to reverse it. Start by looking at your oral health habits to figure out where you could do better. Do you always skip brushing before bed or forget to floss? If so, put reminder notes on the bathroom mirror. '
							 + 'Don�t wait until something gets stuck between your teeth. Daily flossing gets plaque out of places your toothbrush can�t reach. '
							 + 'Don�t like flossing? Try interdental cleaners, picks, or small brushes that fit in between teeth. Ask your dentist how to use them so you don�t damage your gums.'
INSERT Services ([id], [service_name], [promotion_id], [short_description], [long_description], [price], [image], [status])
VALUES ('SV7', 'Gingivitis', 'PR2', @SV7_short_description, @SV7_long_description, 80, 'assets/img/specialities/specialities-05.png', 1)


/*Service 8 */
DECLARE @SV8_short_description AS varchar(600);
DECLARE @SV8_long_description AS varchar(1000);
SET @SV8_short_description =  'Your dentist will explain how to care for your teeth following the procedure.';
SET @SV8_long_description= 'Gum contouring alone is considered a cosmetic procedure. Most of the time it is not medically necessary. Most people have their gums reshaped to improve the appearance of their smile. '
							 + 'However, some people undergo gum contouring surgery as part of other necessary periodontal procedures, such as crown lengthening, pocket reduction, and regenerative procedures. '
							 + 'Gum contouring surgery is performed in the dentist�s office. Currently, dentists use scalpels, lasers, and radiosurgery to perform the gum contouring procedure. Ask your dentist which technique would be the most suitable for your situation.'
INSERT Services ([id], [service_name], [promotion_id], [short_description], [long_description], [price], [image], [status])
VALUES ('SV8', 'Gum Contouring', 'PR4', @SV8_short_description, @SV8_long_description, 180, 'assets/img/specialities/specialities-05.png', 1)


/*Service 9 */
DECLARE @SV9_short_description AS varchar(600);
DECLARE @SV9_long_description AS varchar(1000);
SET @SV9_short_description = 'Your dentist will explain how to care for your teeth following the procedure.';
SET @SV9_long_description= 'Scrape tartar thoroughly into the gum, minimize pain. Scrape teeth with an ultrasonic vibrator is the most modern and convenient method today, because achieving the goal of tartar removal and creating a feeling of smoothness for patients. '
							 + 'The 25kHz frequency ultrasound, along with aseptic water flow, acts on the tartar, causing tartar to peel off and be attracted to the saliva suction tube. '
							 + 'The best dental shaver today, safe for teeth, not contagious, prolonged re-cling time of tartar'
INSERT Services ([id], [service_name], [promotion_id], [short_description], [long_description], [price], [image], [status])
VALUES ('SV9', 'Scrape tartar', 'PR0', @SV9_short_description, @SV9_long_description, 280, 'assets/img/specialities/specialities-05.png', 1)


/*Service 10 */
DECLARE @SV10_short_description AS varchar(600);
DECLARE @SV10_long_description AS varchar(1000);
SET @SV10_short_description = 'Teeth whitening done by your dentist can get teeth brighter faster.'
SET @SV10_long_description= 'The most dramatic results � teeth generally get three to eight shades brighter � usually take several 30- to 60-minute in-office visits. Some dentists use techniques that can be done in a single 2-hour appointment (e.g. the Zoom system). '
							 + 'Tray-based tooth bleaching systems. With this teeth whitening option, a mouth guard-like tray is filled with a peroxide-based bleaching gel or paste and placed over the teeth for one to several hours a day for up to four weeks. '
							 + 'You can buy tray-based tooth whitening systems over-the-counter or have one custom-fitted by your dentist.'
INSERT Services ([id], [service_name], [promotion_id], [short_description], [long_description], [price], [image], [status])
VALUES ('SV10', 'Teeth Whitening and Bleaching', null, @SV10_short_description, @SV10_long_description, 70, 'assets/img/specialities/specialities-05.png', 1)


/*Service 11 */
DECLARE @SV11_short_description AS varchar(600);
DECLARE @SV11_long_description AS varchar(1000);
SET @SV11_short_description = 'Dental implants are available for people with missing teeth were bridges and dentures.'
SET @SV11_long_description= 'Dental implants are replacement tooth roots. Implants provide a strong foundation for fixed (permanent) or removable replacement teeth that are made to match your natural teeth. There are many advantages to dental implants, including'
							 + 'Improved appearance, Improved comfort, Easier eating, Improved oral health, Convenience. '
							 + 'Success rates of dental implants vary, depending on where in the jaw the implants are placed but, in general, dental implants have a success rate of up to 98%.'
INSERT Services ([id], [service_name], [promotion_id], [short_description], [long_description], [price], [image], [status])
VALUES ('SV11', 'Dental Implants', null, @SV11_short_description, @SV11_long_description, 160, 'assets/img/specialities/specialities-05.png', 1)

/*Service 12*/
DECLARE @SV12_short_description AS varchar(600);
DECLARE @SV12_long_description AS varchar(1000);
SET @SV12_short_description = 'Braces and retainers that can help straighten teeth. ';
SET @SV12_long_description = 'The dentist or orthodontist you choose will ask questions about your health, conduct a clinical exam, take impressions of your teeth, take photos of your face and teeth, and order X-rays of the mouth and head. An appropriate treatment plan is made based on analysis of the gathered information. '
							  + 'In some cases, a removable retainer will be all that�s necessary. If braces are indeed the solution for you, the dentist or orthodontist will prescribe an appliance specific for your needs. The braces may consist of bands, wires, and other fixed or removable corrective appliances. No one method works for everyone. '
							  + 'Braces work by applying continuous pressure over a period of time to slowly move teeth in a specific direction. As the teeth move, the bone changes shape as pressure is applied.';
INSERT Services ([id], [service_name], [promotion_id], [short_description], [long_description], [price], [image], [status])
VALUES ('SV12', 'Braces and Retainers', 'PR5', @SV12_short_description, @SV12_long_description, 340, 'assets/img/specialities/specialities-05.png', 1)

/* ------------------- INSERT SERVICE------------------------- */

GO

INSERT Appointments ( [id], [dentist_id], [customer_id], [meeting_date], [dentist_note], [customer_symptom], [book_time], [book_date], [status], [payment_confirm], [dentist_confirm] )
VALUES	(N'AP21720221', N'DT0', N'US0', CAST(N'2022-07-21' AS Date), N'Remeber to brush you teeth 4 time a day', N'It''s hurt', CAST(N'14:18:01' AS Time), CAST(N'2022-07-20' AS Date), 3, 1, 1),
		(N'AP22720221', N'DT0', N'US1', CAST(N'2022-07-22' AS Date), N'', N'', CAST(N'14:40:34' AS Time), CAST(N'2022-07-21' AS Date), 3, 1, 1),
		(N'AP22720222', N'DT0', N'US2', CAST(N'2022-07-22' AS Date), N'', N'Yellow teeth', CAST(N'19:25:54' AS Time), CAST(N'2022-07-20' AS Date), 3, 1, 1),									
		(N'AP2820221', N'DT0', N'US0', CAST(N'2022-08-02' AS Date), N'Remeber to brush your teeth 3 times a day', N'I have a toothache', CAST(N'13:56:29' AS Time), CAST(N'2022-08-02' AS Date), 3, 1, 1),
		(N'AP3820221', N'DT0', N'US1', CAST(N'2022-08-03' AS Date), N'', N'', CAST(N'18:29:20' AS Time), CAST(N'2022-08-02' AS Date), 3, 1, 1),
		(N'AP29720221', N'DT0', N'US1', CAST(N'2022-07-29' AS Date), NULL, N'', CAST(N'10:00:10' AS Time), CAST(N'2022-07-28' AS Date), 1, 0, 0),
		(N'AP31720221', N'DT0', N'US1', CAST(N'2022-07-31' AS Date), NULL, N'', CAST(N'10:04:15' AS Time), CAST(N'2022-07-30' AS Date), 1, 0, 0),
		(N'AP4820221', N'DT0', N'US3', CAST(N'2022-08-04' AS Date), NULL, N'', CAST(N'16:31:51' AS Time), CAST(N'2022-08-03' AS Date), 1, 0, 0),
		(N'AP4820222', N'DT0', N'US4', CAST(N'2022-08-04' AS Date), NULL, N'my teeth is black', CAST(N'16:33:56' AS Time), CAST(N'2022-08-03' AS Date), 1, 0, 0),
		(N'AP5820221', N'DT0', N'US10', CAST(N'2022-08-05' AS Date), NULL, N'', CAST(N'16:41:27' AS Time), CAST(N'2022-08-03' AS Date), 1, 0, 0),
		(N'AP6820221', N'DT0', N'US6', CAST(N'2022-08-06' AS Date), NULL, N'My tooth is hurt', CAST(N'16:39:13' AS Time), CAST(N'2022-08-03' AS Date), 1, 0, 0)  

INSERT AppointmentDetail ( [id], [service_id], [slot] )
VALUES	(N'AP21720221', N'SV2', 3),
		(N'AP21720221', N'SV10', 4),
		(N'AP22720221', N'SV0', 1),
		(N'AP22720222', N'SV10', 2),
		(N'AP2820221', N'SV2', 2),
		(N'AP2820221', N'SV11', 3),
		(N'AP3820221', N'SV12', 1),
		(N'AP3820221', N'SV10', 2),
		(N'AP29720221', N'SV11', 1),
		(N'AP29720221', N'SV12', 2),
		(N'AP31720221', N'SV11', 2),
		(N'AP31720221', N'SV12', 3),
		(N'AP4820221', N'SV0', 1),
		(N'AP4820222', N'SV10', 3),
		(N'AP5820221', N'SV12', 1),
		(N'AP5820221', N'SV10', 2),
		(N'AP6820221', N'SV3', 4),
		(N'AP6820221', N'SV2', 5)  

INSERT Invoices ( [id], [appointment_id], [employee_id], [price], [payment_method], [creditcard_inf], [status] )
VALUES	(N'IN1', N'AP2820221', N'EP3', 306, 0, N'', 1),
		(N'IN3', N'AP21720221', N'EP3', 216, 0, N'', 1),
		(N'IN5', N'AP3820221', N'EP3', 276, 0, N'', 1),
		(N'IN6', N'AP22720222', N'EP3', 72, 0, N'', 1),
		(N'IN4', N'AP22720221', N'EP3', 27, 0, N'', 1)   


INSERT Feedbacks ( [id], [appointment_id], [dentist_rating], [dentist_message], [status] )
VALUES	(N'FB1', N'AP2820221', 5, N'Nice ', 2),
		(N'FB3', N'AP21720221', 4, N'It''s kinda hurt but it''s still a good service', 2),
		(N'FB5', N'AP22720221', 4, N'Great!!', 2),
		(N'FB6', N'AP3820221', 5, N'5 star !!', 2),
		(N'FB7', N'AP22720222', 4, N'Good service !!', 0)                                           
