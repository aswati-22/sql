DROP  table  if exists Ride_Bookings 
  CREATE TABLE Ride_Bookings (
 Date TIMESTAMP,
   Time TIME,		
    Booking_ID VARCHAR(20),
    Booking_Status VARCHAR(50),
     Customer_ID	VARCHAR(10),
    Vehicle_Type VARCHAR(20),
   Pickup_Location VARCHAR(50),
  Drop_Location  VARCHAR(50),
    V_TAT INTEGER,
  C_TAT  INTEGER,
   Canceled_Rides_by_Customer VARCHAR(100),
    Canceled_Rides_by_Driver VARCHAR(100),
    Incomplete_Rides VARCHAR(10),
    Incomplete_Rides_Reason VARCHAR(100),
   	Booking_Value NUMERIC(10,2),
    Payment_Method VARCHAR(20),
    Ride_Distance NUMERIC(10,2),
    Driver_Ratings Numeric(3,1),
    Customer_Rating Numeric(3,1)
);
select * from Ride_Bookings
copy Ride_Bookings (
‪Date , Time ,Booking_ID,Booking_Status,Customer_ID,Vehicle_Type,Pickup_Location,Drop_Location,V_TAT,C_TAT,Canceled_Rides_by_Customer,
Canceled_Rides_by_Driver,Incomplete_Rides,Incomplete_Rides_Reason,Booking_Value,Payment_Method,Ride_Distance,Driver_Ratings,
Customer_Rating
)
FROM 'D:Ride_Bookings.csv'              
DELIMITER ','
CSV HEADER;

Retrieve all successfull bookings.
create view Successful_Booking as
select * from Ride_Bookings 
where booking_status = 'Success';

select * from Successful_Booking


Find the average ride distance for each vehicle type .

create  view average_ride_distance_for_each_vehicle_type  as
select vehicle_type ,avg(ride_distance) from Ride_Bookings 
group by  vehicle_type
select * from average_ride_distance_for_each_vehicle_type


Get the total number of cancelled rides by customers.

create view total_number_of_cancelled_rides_by_customers as
select count(*)from Ride_Bookings
where booking_status ='Canceled by Customer';
select * from total_number_of_cancelled_rides_by_customers


select * from Ride_Bookings 

List the top 5 customers who booked the highest number of rides.

create view customers_who_booked_highest_number_of_rides as
select customer_ID , COUNT(booking_id)as total_rides from Ride_Bookings 
group by customer_ID
order by total_rides  desc limit 5;
select * from customers_who_booked_highest_number_of_rides 

 
select * from Ride_Bookings 

Get the number of rides cancelled by drivers due to personal and car- related issues.

create view cancelled_by_driver as
select count(*)from Ride_Bookings 
where  canceled_rides_by_driver ='Personal & Car related issue'; 
select * from  cancelled_by_driver 

select * from Ride_Bookings 

Find the maximum and minimum  driver rating for Prime Sedan bookings.
create view Max_Min_Driver_rating as
select max (driver_ratings) as max_rating, min (driver_ratings)as min_rating from Ride_Bookings 
where  vehicle_type =' Prime Sedan'
select * from Max_Min_Driver_rating 

Retrieve all rides where payement was made using UPI
create view UPI_Payement as
select  * from Ride_Bookings 
where payment_method ='UPI'
select * from UPI_Payement 


Find the avg customer rating  per vehicle type
create view avg_cust_rating as
select vehicle_type ,avg (customer_rating)as avg_customer_rating from ride_bookings
group by vehicle_type
select * from avg_cust_rating


Calculate the Total booking value of rides completed succesfully;
create view  total_successfully_ride_value as
Select sum(booking_value) as total_successfuly_value from  ride_bookings
where booking_status ='Success'
select * from total_successfully_ride_value

select * from Ride_Bookings 

List all incomplete rides along with the reason:
create view incomplete_rides_reason as
Select booking_id , incomplete_rides_reason from ride_bookings
where incomplete_rides ='Yes'
select * from incomplete_rides_reason



1.Retrieve all successfull bookings.
select * from Successful_Booking 

2.Find the average ride distance for each vehicle type .
select * from average_ride_distance_for_each_vehicle_type

3.Get the total number of cancelled rides by customers.
select * from  cancelled_by_driver 


4.List the top 5 customers who booked the highest number of rides.
select * from customers_who_booked_highest_number_of_rides 


5.Get the number of rides cancelled by drivers due to personal and car- related issues.
select * from  cancelled_by_driver 

6.Find the maximum and minimum  driver rating for Prime Sedan bookings.
select * from Max_Min_Driver_rating 

7.Retrieve all rides where payement was made using UPI.
select * from UPI_Payement 

8.Find the avg customer rating  per vehicle type.
select * from avg_cust_rating

9..Calculate the Total booking value of rides completed succesfully.
select * from total_successfully_ride_value

10.List all incomplete rides along with the reason.
select * from incomplete_rides_reason
 











































































































































































