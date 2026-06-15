-- Query 1
SELECT
  *
FROM
  matches
WHERE
  tournament_category = 'Champions League'
  AND match_status = 'Available';

-- Query 2
SELECT
  *
FROM
  users
WHERE
  full_name LIKE 'Tanvir%'
  OR full_name ILIKE '%Haque%';

-- Query 3
SELECT
  booking_id,
  user_id,
  match_id,
  COALESCE(payment_status, 'Action Required') as systematic_status
FROM
  bookings
WHERE
  payment_status IS NULL;

-- Query 4
SELECT
  booking_id,
  full_name,
  fixture,
  total_cost
FROM
  bookings as b
  INNER JOIN users as u ON b.user_id = u.user_id
  INNER JOIN matches as m ON b.match_id = m.match_id;

-- Query 5
SELECT
  u.user_id,
  full_name,
  booking_id
FROM
  users as u
  LEFT JOIN bookings as b ON u.user_id = b.user_id;

-- Query 6
SELECT
  booking_id,
  match_id,
  total_cost
FROM
  bookings
WHERE
  total_cost > (
    SELECT
      AVG(total_cost)
    FROM
      bookings
  );

-- Query 7
SELECT
  match_id,
  fixture,
  base_ticket_price
FROM
  matches
ORDER BY
  base_ticket_price DESC
OFFSET
  1
LIMIT
  2;