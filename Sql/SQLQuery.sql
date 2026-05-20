create database ola
use ola
select * from Bookings


/* #1 Retrive all successful booking data*/
CREATE VIEW Successful_Bookings as
select * from bookings
where Booking_Status = 'success'

select * from Successful_Bookings



/* #2 find the average ride distance for each vehicle type */
create view ride_distance_for_each_vehicle as
select vehicle_type, avg(ride_distance)
as avg_distance from Bookings
group by Vehicle_Type

select * from ride_distance_for_each_vehicle

/* #3 Get the total number of cancelled rides by customers:*/
create view cancelled_rides_by_customer as
select count(*) as total_cancled_rides
from Bookings
where Booking_Status = 'canceled by customer'

select * from cancelled_rides_by_customer


/* #4. List the top 5 customers who booked the highest number of rides*/
create view Top_5_Customer as
select top 5 Customer_ID, count(Booking_ID) as total_rides
from Bookings
group by Customer_ID
order by total_rides DESC 

select * from Top_5_Customer


/* #5 Get the number of rides cancelled by drivers due to personal and car-related issues*/
create view rides_cancelled_by_driver as
select count(*) as count
from Bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue'
select * from rides_cancelled_by_driver

/*6. Find the maximum and minimum driver ratings for Prime Sedan bookings */
create view max_min_driver_rating as
select MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
from Bookings 
where Vehicle_Type = 'Prime Sedan'

select * from max_min_driver_rating

/* 7. Retrieve all rides where payment was made using UPI:*/
create view payment_by_upi as
select * from Bookings
where Payment_Method = 'UPI'

select * from payment_by_upi

/*8. Find the average customer rating per vehicle type:*/
create view avg_customer_rating_per_vehicle as
select Vehicle_Type , AVG(Customer_Rating) as avg_customer_ratings
from Bookings
group by Vehicle_Type

select * from avg_customer_rating_per_vehicle

/*9. Calculate the total booking value of rides completed successfully:*/
create view total_values as
select SUM(Booking_Value) as total_successful_values
from Bookings
where Booking_Status = 'Success'\

select * from total_values

/*10. List all incomplete rides along with the reason:*/
create view incomplete_rides_with_reason as
select Booking_ID, Incomplete_Rides_Reason
from Bookings
where Incomplete_Rides = 1

 