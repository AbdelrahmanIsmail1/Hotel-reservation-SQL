--1) Total Number of Reservations
Select Count(Booking_ID) as TotalReservations
  FROM dbo.[Hotel Reservation Dataset]

  --2) Which meal plan is the most popular among guests?
Select type_of_meal_plan,Count(Booking_ID) as popular_meal
  FROM dbo.[Hotel Reservation Dataset]
  group by type_of_meal_plan
  order by Count(Booking_ID) Desc;

   --3) What is the average price per room for reservations involving children?
Select Booking_ID,avg_price_per_room
  FROM dbo.[Hotel Reservation Dataset]
  where no_of_children != '0';

  --4) How many reservations were made each year?
   Select right(arrival_date,4) as year , Count(Booking_ID) as reservation_count
  FROM dbo.[Hotel Reservation Dataset]
 group by right(arrival_date,4)
  order by Count(Booking_ID) Desc;

  --5)What is the most commonly booked room type?
  Select top 1 
    room_type_reserved as most_common_type,Count(Booking_ID) as reservation_count
  FROM dbo.[Hotel Reservation Dataset]
  group by room_type_reserved
  order by Count(Booking_ID) Desc;

  --6)How many reservations fall on a weekend (no_of_weekend_nights > 0)?
  Select count(Booking_ID) as reservation_count
  FROM dbo.[Hotel Reservation Dataset]
  where no_of_weekend_nights > 0
  order by Count(Booking_ID) Desc;

  --7)What is the highest and lowest lead time for reservations?
  Select max(lead_time) as max_lead,min(lead_time) as min_lead
  FROM dbo.[Hotel Reservation Dataset]
 

  --8)What is the most common market segment type for reservations?
  Select top 1
  market_segment_type,count(Booking_ID) as reservation_count
  FROM dbo.[Hotel Reservation Dataset]
  group by market_segment_type
  order by Count(Booking_ID) Desc;

  
  --9)How many reservations have a booking status of "Confirmed"?
  Select count(Booking_ID) as reservation_count
  FROM dbo.[Hotel Reservation Dataset]
  where booking_status= 'Not_Canceled';


  --10)What is the total number of adults and children across all reservations?
  Select sum(no_of_adults) as adults_Num,sum(no_of_children) as children_Num
  FROM dbo.[Hotel Reservation Dataset]
 

 --11)What is the average number of weekend nights for reservations involving children?
  Select avg(no_of_weekend_nights) as avg_weekends
  FROM dbo.[Hotel Reservation Dataset]
  where no_of_children != '0';

  --12)How many reservations were made in each month of the year?
  Select MONTH(lead_time),count(Booking_ID) as reservation_count
  FROM dbo.[Hotel Reservation Dataset]
  group by MONTH(lead_time);


 --13)What is the average number of nights (both weekend and weekday) spent by guests for each room type?

  Select room_type_reserved,avg(no_of_weekend_nights) as avg_weekends, avg(no_of_week_nights) as avg_week_nights
  FROM dbo.[Hotel Reservation Dataset]
  group by room_type_reserved;


  --14)For reservations involving children, what is the most common room type, and what is the average price for that room type?

  Select top 1
  room_type_reserved,count(Booking_ID),avg(avg_price_per_room)
  FROM dbo.[Hotel Reservation Dataset]
  where no_of_children != '0'
  group by room_type_reserved
  order by count(Booking_ID) desc;

  --15)Find the market segment type that generates the highest average price per room.
	  Select top 1  market_segment_type,avg(avg_price_per_room)
	  FROM dbo.[Hotel Reservation Dataset]
	  group by market_segment_type
	  order by avg(avg_price_per_room) desc;