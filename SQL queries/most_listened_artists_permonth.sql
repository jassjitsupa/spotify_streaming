-- for running in BigQuery
-- Most listened artists per month (can change the LIMIT to show the number of artist per month to show)


-- create a table
CREATE TABLE spotify1.most_artist_monthly(
      month STRING,
      artist_name STRING,
      ms_played FLOAT64);

--insert Jun 2021
INSERT `spotify-354203.spotify1.most_artist_monthly` (month, artist_name, ms_played)
WITH months AS (SELECT artist_name, FORMAT_DATETIME("%b %Y", endtime) AS Month, sum(ms_played)/60000 AS sum_ms
FROM `spotify-354203.spotify1.stream_hist`
GROUP BY artist_name, Month),
per_month AS(
SELECT Month, artist_name, GREATEST (sum_ms)
FROM months
WHERE month = "Jun 2021" AND artist_name != "Untitled Case" AND artist_name != "Was jetzt?" AND artist_name != "Der tagesschau Zukunfts-Podcast: mal angenommen"
GROUP BY artist_name, Month, sum_ms
ORDER BY sum_ms DESC
LIMIT 5)
SELECT *
FROM per_month;

--insert Jul 2021
INSERT `spotify-354203.spotify1.most_artist_monthly` (month, artist_name, ms_played)
WITH months AS (SELECT artist_name, FORMAT_DATETIME("%b %Y", endtime) AS Month, sum(ms_played)/60000 AS sum_ms
FROM `spotify-354203.spotify1.stream_hist`
GROUP BY artist_name, Month),
per_month AS(
SELECT Month, artist_name, GREATEST (sum_ms)
FROM months
WHERE month = "Jul 2021" AND artist_name != "Untitled Case" AND artist_name != "Was jetzt?" AND artist_name != "Der tagesschau Zukunfts-Podcast: mal angenommen"
GROUP BY artist_name, Month, sum_ms
ORDER BY sum_ms DESC
LIMIT 5)
SELECT *
FROM per_month;

--insert Aug 2021
INSERT `spotify-354203.spotify1.most_artist_monthly` (month, artist_name, ms_played)
WITH months AS (SELECT artist_name, FORMAT_DATETIME("%b %Y", endtime) AS Month, sum(ms_played)/60000 AS sum_ms
FROM `spotify-354203.spotify1.stream_hist`
GROUP BY artist_name, Month),
per_month AS(
SELECT Month, artist_name, GREATEST (sum_ms)
FROM months
WHERE month = "Aug 2021" AND artist_name != "Untitled Case" AND artist_name != "Was jetzt?" AND artist_name != "Der tagesschau Zukunfts-Podcast: mal angenommen"
GROUP BY artist_name, Month, sum_ms
ORDER BY sum_ms DESC
LIMIT 5)
SELECT *
FROM per_month;

--insert Sep 2021
INSERT `spotify-354203.spotify1.most_artist_monthly` (month, artist_name, ms_played)
WITH months AS (SELECT artist_name, FORMAT_DATETIME("%b %Y", endtime) AS Month, sum(ms_played)/60000 AS sum_ms
FROM `spotify-354203.spotify1.stream_hist`
GROUP BY artist_name, Month),
per_month AS(
SELECT Month, artist_name, GREATEST (sum_ms)
FROM months
WHERE month = "Sep 2021" AND artist_name != "Untitled Case" AND artist_name != "Was jetzt?" AND artist_name != "Der tagesschau Zukunfts-Podcast: mal angenommen"
GROUP BY artist_name, Month, sum_ms
ORDER BY sum_ms DESC
LIMIT 5)
SELECT *
FROM per_month;

--insert Oct 2021
INSERT `spotify-354203.spotify1.most_artist_monthly` (month, artist_name, ms_played)
WITH months AS (SELECT artist_name, FORMAT_DATETIME("%b %Y", endtime) AS Month, sum(ms_played)/60000 AS sum_ms
FROM `spotify-354203.spotify1.stream_hist`
GROUP BY artist_name, Month),
per_month AS(
SELECT Month, artist_name, GREATEST (sum_ms)
FROM months
WHERE month = "Oct 2021" AND artist_name != "Untitled Case" AND artist_name != "Was jetzt?" AND artist_name != "Der tagesschau Zukunfts-Podcast: mal angenommen"
GROUP BY artist_name, Month, sum_ms
ORDER BY sum_ms DESC
LIMIT 5)
SELECT *
FROM per_month;

--insert Nov 2021
INSERT `spotify-354203.spotify1.most_artist_monthly` (month, artist_name, ms_played)
WITH months AS (SELECT artist_name, FORMAT_DATETIME("%b %Y", endtime) AS Month, sum(ms_played)/60000 AS sum_ms
FROM `spotify-354203.spotify1.stream_hist`
GROUP BY artist_name, Month),
per_month AS(
SELECT Month, artist_name, GREATEST (sum_ms)
FROM months
WHERE month = "Nov 2021" AND artist_name != "Untitled Case" AND artist_name != "Was jetzt?" AND artist_name != "Der tagesschau Zukunfts-Podcast: mal angenommen"
GROUP BY artist_name, Month, sum_ms
ORDER BY sum_ms DESC
LIMIT 5)
SELECT *
FROM per_month;

--insert Dec 2021
INSERT `spotify-354203.spotify1.most_artist_monthly` (month, artist_name, ms_played)
WITH months AS (SELECT artist_name, FORMAT_DATETIME("%b %Y", endtime) AS Month, sum(ms_played)/60000 AS sum_ms
FROM `spotify-354203.spotify1.stream_hist`
GROUP BY artist_name, Month),
per_month AS(
SELECT Month, artist_name, GREATEST (sum_ms)
FROM months
WHERE month = "Dec 2021" AND artist_name != "Untitled Case" AND artist_name != "Was jetzt?" AND artist_name != "Der tagesschau Zukunfts-Podcast: mal angenommen"
GROUP BY artist_name, Month, sum_ms
ORDER BY sum_ms DESC
LIMIT 5)
SELECT *
FROM per_month;

--insert Jan 2022
INSERT `spotify-354203.spotify1.most_artist_monthly` (month, artist_name, ms_played)
WITH months AS (SELECT artist_name, FORMAT_DATETIME("%b %Y", endtime) AS Month, sum(ms_played)/60000 AS sum_ms
FROM `spotify-354203.spotify1.stream_hist`
GROUP BY artist_name, Month),
per_month AS(
SELECT Month, artist_name, GREATEST (sum_ms)
FROM months
WHERE month = "Jan 2022" AND artist_name != "Untitled Case" AND artist_name != "Was jetzt?" AND artist_name != "Der tagesschau Zukunfts-Podcast: mal angenommen"
GROUP BY artist_name, Month, sum_ms
ORDER BY sum_ms DESC
LIMIT 5)
SELECT *
FROM per_month;

--insert Feb 2022
INSERT `spotify-354203.spotify1.most_artist_monthly` (month, artist_name, ms_played)
WITH months AS (SELECT artist_name, FORMAT_DATETIME("%b %Y", endtime) AS Month, sum(ms_played)/60000 AS sum_ms
FROM `spotify-354203.spotify1.stream_hist`
GROUP BY artist_name, Month),
per_month AS(
SELECT Month, artist_name, GREATEST (sum_ms)
FROM months
WHERE month = "Feb 2022" AND artist_name != "Untitled Case" AND artist_name != "Was jetzt?" AND artist_name != "Der tagesschau Zukunfts-Podcast: mal angenommen"
GROUP BY artist_name, Month, sum_ms
ORDER BY sum_ms DESC
LIMIT 5)
SELECT *
FROM per_month;

--insert Mar 2022
INSERT `spotify-354203.spotify1.most_artist_monthly` (month, artist_name, ms_played)
WITH months AS (SELECT artist_name, FORMAT_DATETIME("%b %Y", endtime) AS Month, sum(ms_played)/60000 AS sum_ms
FROM `spotify-354203.spotify1.stream_hist`
GROUP BY artist_name, Month),
per_month AS(
SELECT Month, artist_name, GREATEST (sum_ms)
FROM months
WHERE month = "Mar 2022" AND artist_name != "Untitled Case" AND artist_name != "Was jetzt?" AND artist_name != "Der tagesschau Zukunfts-Podcast: mal angenommen"
GROUP BY artist_name, Month, sum_ms
ORDER BY sum_ms DESC
LIMIT 5)
SELECT *
FROM per_month;

--insert Apr 2022
INSERT `spotify-354203.spotify1.most_artist_monthly` (month, artist_name, ms_played)
WITH months AS (SELECT artist_name, FORMAT_DATETIME("%b %Y", endtime) AS Month, sum(ms_played)/60000 AS sum_ms
FROM `spotify-354203.spotify1.stream_hist`
GROUP BY artist_name, Month),
per_month AS(
SELECT Month, artist_name, GREATEST (sum_ms)
FROM months
WHERE month = "Apr 2022" AND artist_name != "Untitled Case" AND artist_name != "Was jetzt?" AND artist_name != "Der tagesschau Zukunfts-Podcast: mal angenommen"
GROUP BY artist_name, Month, sum_ms
ORDER BY sum_ms DESC
LIMIT 5)
SELECT *
FROM per_month;

--insert May 2022
INSERT `spotify-354203.spotify1.most_artist_monthly` (month, artist_name, ms_played)
WITH months AS (SELECT artist_name, FORMAT_DATETIME("%b %Y", endtime) AS Month, sum(ms_played)/60000 AS sum_ms
FROM `spotify-354203.spotify1.stream_hist`
GROUP BY artist_name, Month),
per_month AS(
SELECT Month, artist_name, GREATEST (sum_ms)
FROM months
WHERE month = "May 2022" AND artist_name != "Untitled Case" AND artist_name != "Was jetzt?" AND artist_name != "Der tagesschau Zukunfts-Podcast: mal angenommen"
GROUP BY artist_name, Month, sum_ms
ORDER BY sum_ms DESC
LIMIT 5)
SELECT *
FROM per_month;

--insert Jun 2022
INSERT `spotify-354203.spotify1.most_artist_monthly` (month, artist_name, ms_played)
WITH months AS (SELECT artist_name, FORMAT_DATETIME("%b %Y", endtime) AS Month, sum(ms_played)/60000 AS sum_ms
FROM `spotify-354203.spotify1.stream_hist`
GROUP BY artist_name, Month),
per_month AS(
SELECT Month, artist_name, GREATEST (sum_ms)
FROM months
WHERE month = "Jun 2022" AND artist_name != "Untitled Case" AND artist_name != "Was jetzt?" AND artist_name != "Der tagesschau Zukunfts-Podcast: mal angenommen"
GROUP BY artist_name, Month, sum_ms
ORDER BY sum_ms DESC
LIMIT 5)
SELECT *
FROM per_month;

SELECT *
FROM spotify1.most_artist_monthly
ORDER BY month, ms_played;

-- Below query would work outside Google BigQuery
--WITH trying AS (
--      SELECT artist_name,
--       FORMAT_DATETIME("%b %Y", endtime) AS Month,
--       sum(ms_played)/60000 AS sum_ms
--      FROM `spotify-354203.spotify1.stream_hist`
--      GROUP BY artist_name, Month)
--SELECT Month, artist_name, MAX(sum_ms)
--FROM trying
--GROUP BY Month