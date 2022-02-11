-- write your queries here

-- 1. Join the two tables so that every column and record appears, regardless of if there is not an owner_id. 
    SELECT *
    FROM owners o
    FULL JOIN vehicles v
    ON o.id = v.owner_id;

-- 2. Count the number of cars for each owner. Display the owners first_name, last_name and count of vehicles. The first_name should be ordered in ascending order. 

    SELECT o.first_name, o.last_name, COUNT(*) 
    FROM vehicles v
    JOIN owners o
    ON v.owner_id = o.id
    GROUP BY v.owner_id, o.first_name, o.last_name
    ORDER BY COUNT;

-- 3. Count the number of cars for each owner and display the average price for each of the cars as integers. Display the owners first_name, last_name, average price and count of vehicles. The first_name should be ordered in descending order. Only display results with more than one vehicle and an average price greater than 10000. 

    SELECT o.first_name, o.last_name, ROUND(AVG(price)) AS average_price, COUNT(*)
    FROM vehicles v 
    JOIN owners o
    ON v.owner_id = o.id
    GROUP BY v.owner_id, o.first_name, o.last_name
    HAVING COUNT(*) > 1 AND ROUND(AVG(price)) > 10000
    ORDER BY COUNT desc;
    
