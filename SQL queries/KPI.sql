-- for running in Google BigQuery
-- for KPIs

-- totalhour_permonth -- Total hour per month
SELECT FORMAT_DATETIME("%b-%Y", endtime) AS Month, round(sum(ms_played)/3600000, 2) AS Hours_per_month
FROM `spotify-354203.spotify1.stream_hist`
WHERE artist_name != "Untitled Case" AND artist_name != "Was jetzt?" AND artist_name != "Der tagesschau Zukunfts-Podcast: mal angenommen"
GROUP BY 1
ORDER BY PARSE_DATE('%b-%Y', Month);


-- totalmins_perartist -- Most listened artists
SELECT artist_name, sum(ms_played)/60000 as mins
FROM `spotify-354203.spotify1.stream_hist`
WHERE artist_name != "Untitled Case" AND artist_name != "Was jetzt?" AND artist_name != "Der tagesschau Zukunfts-Podcast: mal angenommen"
GROUP BY 1
ORDER BY 2 DESC;

-- minsperartist_permonth -- Most listened artist of the month
WITH most_listened_artists AS (
      SELECT 
      FORMAT_DATETIME("%b %Y", endtime) AS Month,
      artist_name,
      sum(ms_played)/60000 AS total_mins
FROM `spotify-354203.spotify1.stream_hist`
WHERE artist_name != "Untitled Case" AND artist_name != "Was jetzt?" AND artist_name != "Der tagesschau Zukunfts-Podcast: mal angenommen" AND ms_played >= 60000
GROUP BY 1, 2
ORDER BY 1)

SELECT *
FROM most_listened_artists;

-- mins_per_day -- how long i listen to music per day
SELECT FORMAT_DATETIME("%D", endtime) AS Day, sum(ms_played)/60000
FROM `spotify-354203.spotify1.stream_hist`
GROUP BY 1
ORDER BY 1;

-- top genres of the year
SELECT artist_name, genre, sum(ms_played)/60000 AS Total_mins
FROM `spotify1.streamhist_genres`
GROUP BY artist_name, genre
ORDER BY 2 DESC;

-- avg min per day
WITH avg_perday AS (SELECT FORMAT_DATETIME("%D", endtime) AS Day, sum(ms_played)/60000 as daily_mins
FROM `spotify-354203.spotify1.stream_hist`
GROUP BY 1
ORDER BY 1)
SELECT round(avg(daily_mins/60), 2)
FROM avg_perday;

-- the dayofweek & timeofday that I listen to music the most (avg. hr for that day of week)
WITH avg_perday AS (
      SELECT 
      FORMAT_DATETIME("%u", endtime) AS dayofweek,
      FORMAT_DATETIME("%R", endtime) AS timeofday,
      sum(ms_played)/60000 as dayofweek_mins
FROM `spotify-354203.spotify1.stream_hist`
GROUP BY 1, 2
ORDER BY 1, 2)
SELECT dayofweek, timeofday, dayofweek_mins,
 CASE
  WHEN timeofday BETWEEN "01:00" AND "02:00" THEN "1AM - 2AM"
  WHEN timeofday BETWEEN "02:00" AND "03:00" THEN "2AM - 3AM"
  WHEN timeofday BETWEEN "03:00" AND "04:00" THEN "3AM - 4AM"
  WHEN timeofday BETWEEN "04:00" AND "05:00" THEN "4AM - 5AM"
  WHEN timeofday BETWEEN "05:00" AND "06:00" THEN "5AM - 6AM"
  WHEN timeofday BETWEEN "06:00" AND "07:00" THEN "6AM - 7AM"
  WHEN timeofday BETWEEN "07:00" AND "08:00" THEN "7AM - 8AM"
  WHEN timeofday BETWEEN "08:00" AND "09:00" THEN "8AM - 9AM"
  WHEN timeofday BETWEEN "09:00" AND "10:00" THEN "9AM - 10AM"
  WHEN timeofday BETWEEN "10:00" AND "11:00" THEN "10AM - 11AM"
  WHEN timeofday BETWEEN "11:00" AND "12:00" THEN "11AM - 12AM"
  WHEN timeofday BETWEEN "12:00" AND "13:00" THEN "12PM - 1PM"
  WHEN timeofday BETWEEN "13:00" AND "14:00" THEN "1PM - 2PM"
  WHEN timeofday BETWEEN "14:00" AND "15:00" THEN "2PM - 3PM"
  WHEN timeofday BETWEEN "15:00" AND "16:00" THEN "3PM - 4PM"
  WHEN timeofday BETWEEN "16:00" AND "17:00" THEN "4PM - 5PM"
  WHEN timeofday BETWEEN "17:00" AND "18:00" THEN "5PM - 6PM"
  WHEN timeofday BETWEEN "18:00" AND "19:00" THEN "6PM - 7PM"
  WHEN timeofday BETWEEN "19:00" AND "20:00" THEN "7PM - 8PM"
  WHEN timeofday BETWEEN "20:00" AND "21:00" THEN "8PM - 9PM"
  WHEN timeofday BETWEEN "21:00" AND "22:00" THEN "9PM - 10PM"
  WHEN timeofday BETWEEN "22:00" AND "23:00" THEN "10PM - 11PM"
  WHEN timeofday BETWEEN "23:00" AND "24:00" THEN "11PM - 12PM"
  WHEN timeofday BETWEEN "00:00" AND "01:00" THEN "12PM - 1AM"
  ELSE "00:00"
END AS timerange,
CASE
  WHEN dayofweek = "1" THEN "Monday"
  WHEN dayofweek = "2" THEN "Tuesday"
  WHEN dayofweek = "3" THEN "Wednesday"
  WHEN dayofweek = "4" THEN "Thursday"
  WHEN dayofweek = "5" THEN "Friday"
  WHEN dayofweek = "6" THEN "Saturday"
  WHEN dayofweek = "7" THEN "Sunday"
 ELSE "unknown"
END AS day
FROM avg_perday;


-- see how many miniutes listened for every hour of the day
WITH avg_perday AS (
      SELECT 
      FORMAT_DATETIME("%u", endtime) AS dayofweek,
      FORMAT_DATETIME("%R", endtime) AS timeofday,
      sum(ms_played)/60000 as dayofweek_mins
FROM `spotify-354203.spotify1.stream_hist`
GROUP BY 1, 2
ORDER BY 1, 2),
day_time_listen AS (SELECT dayofweek, timeofday, dayofweek_mins,
 CASE
  WHEN timeofday BETWEEN "01:00" AND "02:00" THEN "1AM - 2AM"
  WHEN timeofday BETWEEN "02:00" AND "03:00" THEN "2AM - 3AM"
  WHEN timeofday BETWEEN "03:00" AND "04:00" THEN "3AM - 4AM"
  WHEN timeofday BETWEEN "04:00" AND "05:00" THEN "4AM - 5AM"
  WHEN timeofday BETWEEN "05:00" AND "06:00" THEN "5AM - 6AM"
  WHEN timeofday BETWEEN "06:00" AND "07:00" THEN "6AM - 7AM"
  WHEN timeofday BETWEEN "07:00" AND "08:00" THEN "7AM - 8AM"
  WHEN timeofday BETWEEN "08:00" AND "09:00" THEN "8AM - 9AM"
  WHEN timeofday BETWEEN "09:00" AND "10:00" THEN "9AM - 10AM"
  WHEN timeofday BETWEEN "10:00" AND "11:00" THEN "10AM - 11AM"
  WHEN timeofday BETWEEN "11:00" AND "12:00" THEN "11AM - 12AM"
  WHEN timeofday BETWEEN "12:00" AND "13:00" THEN "12PM - 1PM"
  WHEN timeofday BETWEEN "13:00" AND "14:00" THEN "1PM - 2PM"
  WHEN timeofday BETWEEN "14:00" AND "15:00" THEN "2PM - 3PM"
  WHEN timeofday BETWEEN "15:00" AND "16:00" THEN "3PM - 4PM"
  WHEN timeofday BETWEEN "16:00" AND "17:00" THEN "4PM - 5PM"
  WHEN timeofday BETWEEN "17:00" AND "18:00" THEN "5PM - 6PM"
  WHEN timeofday BETWEEN "18:00" AND "19:00" THEN "6PM - 7PM"
  WHEN timeofday BETWEEN "19:00" AND "20:00" THEN "7PM - 8PM"
  WHEN timeofday BETWEEN "20:00" AND "21:00" THEN "8PM - 9PM"
  WHEN timeofday BETWEEN "21:00" AND "22:00" THEN "9PM - 10PM"
  WHEN timeofday BETWEEN "22:00" AND "23:00" THEN "10PM - 11PM"
  WHEN timeofday BETWEEN "23:00" AND "24:00" THEN "11PM - 12PM"
  WHEN timeofday BETWEEN "00:00" AND "01:00" THEN "12PM - 1AM"
  ELSE "00:00"
 END AS timerange,
 CASE
  WHEN dayofweek = "1" THEN "Monday"
  WHEN dayofweek = "2" THEN "Tuesday"
  WHEN dayofweek = "3" THEN "Wednesday"
  WHEN dayofweek = "4" THEN "Thursday"
  WHEN dayofweek = "5" THEN "Friday"
  WHEN dayofweek = "6" THEN "Saturday"
  WHEN dayofweek = "7" THEN "Sunday"
 ELSE "unknown"
END AS day
FROM avg_perday)
SELECT dayofweek, day, timerange, sum(dayofweek_mins) AS mins_perdayhour
FROM day_time_listen
GROUP BY 1, 2, 3
ORDER BY 1;

-- average features with 0-1
SELECT ROUND(AVG(danceability), 4) AS avg_danceability,
        ROUND(AVG(energy), 4) AS avg_energy,
        ROUND(AVG(key), 4) AS avg_key,
        ROUND(AVG(mode), 4) AS avg_mode,
        ROUND(AVG(speechiness), 4) AS avg_speechiness,
        ROUND(AVG(acousticness), 4) AS avg_acousticness,
        ROUND(AVG(instrumentalness), 4) AS avg_instrumentalness,
        ROUND(AVG(liveness), 4) AS avg_liveness,
        ROUND(AVG(valence), 4) AS avg_valence
FROM `spotify-354203.spotify1.streamhist_features`;


-- average features with 0-1 (monthly)
SELECT FORMAT_DATETIME("%b %Y", endtime) AS Month,
        ROUND(AVG(danceability), 4) AS avg_danceability,
        ROUND(AVG(energy), 4) AS avg_energy,
        ROUND(AVG(key), 4) AS avg_key,
        ROUND(AVG(mode), 4) AS avg_mode,
        ROUND(AVG(speechiness), 4) AS avg_speechiness,
        ROUND(AVG(acousticness), 4) AS avg_acousticness,
        ROUND(AVG(instrumentalness), 4) AS avg_instrumentalness,
        ROUND(AVG(liveness), 4) AS avg_liveness,
        ROUND(AVG(valence), 4) AS avg_valence
FROM `spotify-354203.spotify1.streamhist_features`
GROUP BY Month;

-- danceability
SELECT danceability, COUNT(DISTINCT danceability)
FROM `spotify-354203.spotify1.streamhist_features`
GROUP BY danceability;


-- add a new column called 'play_count' then save as a new query file 'streamhist_features_playcount'
--WITH add_playcount AS (SELECT *,
--  CASE
--    WHEN ms_played > 0 THEN (ms_played/60000) / (duration_ms/60000)
--    ELSE 0
--  END AS play_count
--FROM spotify-354203.spotify1.streamhist_features)
--SELECT *
--FROM add_playcount

--songs that were played the most
SELECT track, artist_name, sum(play_count) AS sum_playcount, 
      AVG(danceability) AS avgdance, 
      AVG(energy) AS avgenergy, 
      AVG(key) AS avgkey, 
      AVG(mode) AS avgmode, 
      AVG(speechiness) AS avgspeechiness,
      AVG(acousticness) AS avgacousticness, 
      AVG(instrumentalness) AS avginstrumetalness, 
      AVG(liveness) AS avgliveness, 
      AVG(valence) AS avgvalence
FROM `spotify-354203.spotify1.streamhist_features_playcount`
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 10;

--create ranking column
SELECT 
  RANK() OVER (ORDER BY sum(play_count) DESC) AS Ranking,
  track, artist_name, sum(play_count) AS sum_playcount,
  AVG(danceability) AS avgdance, 
      AVG(energy) AS avgenergy, 
      AVG(key) AS avgkey, 
      AVG(mode) AS avgmode, 
      AVG(speechiness) AS avgspeechiness,
      AVG(acousticness) AS avgacousticness, 
      AVG(instrumentalness) AS avginstrumetalness, 
      AVG(liveness) AS avgliveness, 
      AVG(valence) AS avgvalence
FROM `spotify-354203.spotify1.streamhist_features_playcount`
GROUP BY 2, 3
ORDER BY 1
LIMIT 10;





