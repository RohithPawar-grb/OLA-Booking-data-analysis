create database ola;

use ola;

select * from bookings;

-- 1. Retrieve all successful bookings:
create view successful_bookings as
select * from bookings
where booking_status = 'Success';

select * from successful_bookings;

-- 2. Find the average ride distance for each vehicle type:
create view average_ride_distance_for_each_vehicle_type as
select vehicle_type,round(avg(Ride_Distance),2) as Average_Distance
from bookings
group by vehicle_type;

select * from average_ride_distance_for_each_vehicle_type ;

-- 3. Get the total number of cancelled rides by customers:
create view No_of_cancelledride as
select count(booking_id) as No_of_cancelledride
from bookings
where Booking_status = 'Canceled by Customer';

select * from No_of_cancelledride ;


-- 4. List the top 5 customers who booked the highest number of rides:
create view top5_customers as
SELECT customer_id,
       COUNT(booking_id) AS total_rides
FROM bookings
WHERE customer_id IS NOT NULL
  AND customer_id <> ''
GROUP BY customer_id
ORDER BY total_rides DESC
LIMIT 5;

select * from top5_customers;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view cancelled_by_drivers as
select count(Booking_Status) as Ride_Cancelled
from bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from cancelled_by_drivers;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view prime_sedan_driver_ratings as
select max(Driver_Ratings) as max_rating,min(Driver_Ratings) as min_rating
from bookings
where Vehicle_Type = 'Prime Sedan';

select * from prime_sedan_driver_ratings ;

-- 7. Retrieve all rides where payment was made using UPI:
create view upi_rides as
select * from bookings
where payment_method =  'UPI';

select * from upi_rides ;

-- 8. Find the average customer rating per vehicle type:
create view average_customer_rating as
select vehicle_type, round(avg(Customer_Rating),1) as avg_customer_rating
from bookings
where vehicle_type is not null and vehicle_type <>''
group by vehicle_type;

select * from average_customer_rating ;

-- 9. Calculate the total booking value of rides completed successfully:
create view total_booking_values as
select sum(Booking_Value) as total_booking_values
from bookings
where Booking_Status = 'Success';

select * from total_booking_values;

-- 10. List all incomplete rides along with the reason:
create view incomplete_rides as
 select Booking_ID,Incomplete_Rides_Reason
 from bookings
where Incomplete_Rides = 'Yes';

select  * from incomplete_rides;



