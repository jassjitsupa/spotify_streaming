-- for running in Google Bigquery
-- Most listened genre per month (change the LIMIT for the number of genres to show per month)


-- create a table
CREATE TABLE spotify1.top_fivegenre_monthly(
      month STRING,
      genre STRING,
      total_mins FLOAT64);

-- insert Jun 21
INSERT `spotify-354203.spotify1.top_fivegenre_monthly` (month, genre, total_mins)
WITH monthly_genres AS (SELECT FORMAT_DATETIME("%b %Y", endtime) AS month, genre, sum(ms_played)/60000 AS MS
FROM `spotify-354203.spotify1.streamhist_genres`
GROUP BY 1, 2
ORDER BY 1)
SELECT month, genre, sum(MS) AS Total_mins
FROM monthly_genres
WHERE month = "Jun 2021"
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 5;

-- insert Jul 21
INSERT `spotify-354203.spotify1.top_fivegenre_monthly` (month, genre, total_mins)
WITH monthly_genres AS (SELECT FORMAT_DATETIME("%b %Y", endtime) AS month, genre, sum(ms_played)/60000 AS MS
FROM `spotify-354203.spotify1.streamhist_genres`
GROUP BY 1, 2
ORDER BY 1)
SELECT month, genre, sum(MS) AS Total_mins
FROM monthly_genres
WHERE month = "Jul 2021"
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 5;

-- insert Jun 21
INSERT `spotify-354203.spotify1.top_fivegenre_monthly` (month, genre, total_mins)
WITH monthly_genres AS (SELECT FORMAT_DATETIME("%b %Y", endtime) AS month, genre, sum(ms_played)/60000 AS MS
FROM `spotify-354203.spotify1.streamhist_genres`
GROUP BY 1, 2
ORDER BY 1)
SELECT month, genre, sum(MS) AS Total_mins
FROM monthly_genres
WHERE month = "Jun 2021"
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 5;

-- insert Aug 21
INSERT `spotify-354203.spotify1.top_fivegenre_monthly` (month, genre, total_mins)
WITH monthly_genres AS (SELECT FORMAT_DATETIME("%b %Y", endtime) AS month, genre, sum(ms_played)/60000 AS MS
FROM `spotify-354203.spotify1.streamhist_genres`
GROUP BY 1, 2
ORDER BY 1)
SELECT month, genre, sum(MS) AS Total_mins
FROM monthly_genres
WHERE month = "Aug 2021"
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 5;

-- insert Sep 21
INSERT `spotify-354203.spotify1.top_fivegenre_monthly` (month, genre, total_mins)
WITH monthly_genres AS (SELECT FORMAT_DATETIME("%b %Y", endtime) AS month, genre, sum(ms_played)/60000 AS MS
FROM `spotify-354203.spotify1.streamhist_genres`
GROUP BY 1, 2
ORDER BY 1)
SELECT month, genre, sum(MS) AS Total_mins
FROM monthly_genres
WHERE month = "Sep 2021"
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 5;


-- insert Oct 21
INSERT `spotify-354203.spotify1.top_fivegenre_monthly` (month, genre, total_mins)
WITH monthly_genres AS (SELECT FORMAT_DATETIME("%b %Y", endtime) AS month, genre, sum(ms_played)/60000 AS MS
FROM `spotify-354203.spotify1.streamhist_genres`
GROUP BY 1, 2
ORDER BY 1)
SELECT month, genre, sum(MS) AS Total_mins
FROM monthly_genres
WHERE month = "Oct 2021"
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 5;


-- insert Nov 21
INSERT `spotify-354203.spotify1.top_fivegenre_monthly` (month, genre, total_mins)
WITH monthly_genres AS (SELECT FORMAT_DATETIME("%b %Y", endtime) AS month, genre, sum(ms_played)/60000 AS MS
FROM `spotify-354203.spotify1.streamhist_genres`
GROUP BY 1, 2
ORDER BY 1)
SELECT month, genre, sum(MS) AS Total_mins
FROM monthly_genres
WHERE month = "Nov 2021"
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 5;


-- insert Dec 21
INSERT `spotify-354203.spotify1.top_fivegenre_monthly` (month, genre, total_mins)
WITH monthly_genres AS (SELECT FORMAT_DATETIME("%b %Y", endtime) AS month, genre, sum(ms_played)/60000 AS MS
FROM `spotify-354203.spotify1.streamhist_genres`
GROUP BY 1, 2
ORDER BY 1)
SELECT month, genre, sum(MS) AS Total_mins
FROM monthly_genres
WHERE month = "Dec 2021"
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 5;

-- insert Jan 22
INSERT `spotify-354203.spotify1.top_fivegenre_monthly` (month, genre, total_mins)
WITH monthly_genres AS (SELECT FORMAT_DATETIME("%b %Y", endtime) AS month, genre, sum(ms_played)/60000 AS MS
FROM `spotify-354203.spotify1.streamhist_genres`
GROUP BY 1, 2
ORDER BY 1)
SELECT month, genre, sum(MS) AS Total_mins
FROM monthly_genres
WHERE month = "Jan 2022"
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 5;


-- insert Feb 22
INSERT `spotify-354203.spotify1.top_fivegenre_monthly` (month, genre, total_mins)
WITH monthly_genres AS (SELECT FORMAT_DATETIME("%b %Y", endtime) AS month, genre, sum(ms_played)/60000 AS MS
FROM `spotify-354203.spotify1.streamhist_genres`
GROUP BY 1, 2
ORDER BY 1)
SELECT month, genre, sum(MS) AS Total_mins
FROM monthly_genres
WHERE month = "Feb 2022"
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 5;


-- insert Mar 22
INSERT `spotify-354203.spotify1.top_fivegenre_monthly` (month, genre, total_mins)
WITH monthly_genres AS (SELECT FORMAT_DATETIME("%b %Y", endtime) AS month, genre, sum(ms_played)/60000 AS MS
FROM `spotify-354203.spotify1.streamhist_genres`
GROUP BY 1, 2
ORDER BY 1)
SELECT month, genre, sum(MS) AS Total_mins
FROM monthly_genres
WHERE month = "Mar 2022"
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 5;


-- insert Apr 22
INSERT `spotify-354203.spotify1.top_fivegenre_monthly` (month, genre, total_mins)
WITH monthly_genres AS (SELECT FORMAT_DATETIME("%b %Y", endtime) AS month, genre, sum(ms_played)/60000 AS MS
FROM `spotify-354203.spotify1.streamhist_genres`
GROUP BY 1, 2
ORDER BY 1)
SELECT month, genre, sum(MS) AS Total_mins
FROM monthly_genres
WHERE month = "Apr 2022"
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 5;


-- insert May 22
INSERT `spotify-354203.spotify1.top_fivegenre_monthly` (month, genre, total_mins)
WITH monthly_genres AS (SELECT FORMAT_DATETIME("%b %Y", endtime) AS month, genre, sum(ms_played)/60000 AS MS
FROM `spotify-354203.spotify1.streamhist_genres`
GROUP BY 1, 2
ORDER BY 1)
SELECT month, genre, sum(MS) AS Total_mins
FROM monthly_genres
WHERE month = "May 2022"
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 5;


-- insert Jun 22
INSERT `spotify-354203.spotify1.top_fivegenre_monthly` (month, genre, total_mins)
WITH monthly_genres AS (SELECT FORMAT_DATETIME("%b %Y", endtime) AS month, genre, sum(ms_played)/60000 AS MS
FROM `spotify-354203.spotify1.streamhist_genres`
GROUP BY 1, 2
ORDER BY 1)
SELECT month, genre, sum(MS) AS Total_mins
FROM monthly_genres
WHERE month = "Jun 2022"
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 5;
