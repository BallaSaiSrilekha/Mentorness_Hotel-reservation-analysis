#Q1 What is the total number of reservations in the dataset?
select count(booking_id) as total_no_of_reservations from hotelreserv.hotelreservation; #700

#Q2 Which meal plan is the most popular among guests?
select type_of_meal_plan from hotelreserv.hotelreservation group by 1 order by count(booking_id) desc limit 1; #Meal Plan 1 ,527

#Q3 What is the average price per room for reservations involving children?
select avg_price_per_room from hotelreserv.hotelreservation where no_of_children !=0;

#Q4 How many reservations were made for the year 20XX (replace XX with the desired year)?
#For 2017
select count(booking_id) as booking_count from hotelreserv.hotelreservation where right(arrival_date,4) =2017; #123
#For 2018
select count(booking_id) as booking_count from hotelreserv.hotelreservation where right(arrival_date,4) =2018; #577

#Q5 What is the most commonly booked room type?
select room_type_reserved from hotelreserv.hotelreservation group by 1 order by count(booking_id) desc limit 1; #Room_Type_1 534

#Q6 How many reservations fall on a weekend?
select count(booking_id) as booking_count from hotelreserv.hotelreservation where no_of_weekend_nights!=0; # 383

#Q7 What is the highest and lowest lead time for reservations?
select max(lead_time) as highest_lead_time,min(lead_time) as lowest_lead_time from hotelreserv.hotelreservation; #443 , 0

#Q8 What is the most common market segment type for reservations?
select market_segment_type from hotelreserv.hotelreservation group by 1 order by count(Booking_ID) desc limit 1; #Online

#Q9 How many reservations have a booking status of "Confirmed"?
select count(booking_id) as booking_count from hotelreserv.hotelreservation where booking_status="Not_Canceled"; #493

#Q10 What is the total number of adults and children across all reservations?
select sum(no_of_adults) as adult_count,sum(no_of_children) as children_count from hotelreserv.hotelreservation; #1316, 69

#Q11 What is the average number of weekend nights for reservations involving children?
select avg(no_of_weekend_nights) as avg_no_of_weekend_nights from hotelreserv.hotelreservation where no_of_children!=0; #1

#Q12 How many reservations were made in each month of the year?
select right(arrival_date,7)as month_year,count(Booking_ID) as booking_count from hotelreserv.hotelreservation group by 1 order by 1 desc; 

#Q13 What is the average number of nights (both weekend and weekday) spent by guests for each room type?
select room_type_reserved,avg(no_of_weekend_nights+no_of_week_nights) as avg_number_of_nights from hotelreserv.hotelreservation group by 1;

#Q14 For reservations involving children, what is the most common room type, and what is the average
#price for that room type?
select room_type_reserved,avg_price_per_room from hotelreserv.hotelreservation where no_of_children!=0 group by 1,2 order by count(Booking_ID) desc limit 1; #Here Room_Type_1 with avg_price_per_room 150 and 121.5 are most commonly booked

#Q15 Find the market segment type that generates the highest average price per room.
select market_segment_type from hotelreserv.hotelreservation group by 1 order by max(avg_price_per_room) desc limit 1; #Online







