-- for running in Google BigQuery

-- joining 'mylibrary' & 'track_artists' -> 'mylibrary_joined'
SELECT mylibrary.album, mylibrary.artist_name, mylibrary.track, mylibrary.track_id, track_artists.track_id 
FROM `spotify-354203.spotify1.mylibrary` AS mylibrary
LEFT JOIN `spotify-354203.spotify1.track_artists` AS track_artists
ON mylibrary.track_id = track_artists.track_id;

-- joining 'mylibrary_joined' & 'all_features' -> 'mylibrary_features'
SELECT mylibrary_joined.album,
        mylibrary_joined.artist_id,
        mylibrary_joined.artist_name,
        mylibrary_joined.track,
        mylibrary_joined.track_id,
        all_features.acousticness,
        all_features.danceability,
        all_features.duration_ms,
        all_features.energy,
        all_features.instrumentalness,
        all_features.key,
        all_features.liveness,
        all_features.loudness,
        all_features.mode,
        all_features.speechiness,
        all_features.tempo,
        all_features.time_signature,
        all_features.valence
FROM `spotify-354203.spotify1.mylibrary_joined` AS mylibrary_joined
 LEFT JOIN `spotify-354203.spotify1.all_features` AS all_features
  ON mylibrary_joined.track_id = all_features.track_id

-- joining 'my_library_joined' & 'genre_unpivot' -> to know the genres in my library
SELECT *
FROM `spotify-354203.spotify1.mylibrary_joined` AS mylibrary_joined
LEFT JOIN `spotify-354203.spotify1.genre_unpivot` AS genre_unpivot
 ON mylibrary_joined.artist_id = genre_unpivot.artist_id 

-- joining 'stream_hist' & 'mylibrary_joined' to get ONLY artist ID, then join it again with 'genre_unpivot' to
-- get genres for each streamed track in my library
WITH streamhist_artistid_joined AS (SELECT stream_hist.endtime, stream_hist.artist_name, list_uniqueartists.artist_id, stream_hist.track, stream_hist.ms_played
FROM `spotify-354203.spotify1.stream_hist` AS stream_hist
LEFT JOIN `spotify-354203.spotify1.list_uniqueartists` AS list_uniqueartists
 ON stream_hist.artist_name = list_uniqueartists.artist_name)
SELECT *
FROM streamhist_artistid_joined
LEFT JOIN `spotify-354203.spotify1.genre_unpivot` AS genre_unpivot
  ON streamhist_artistid_joined.artist_id = genre_unpivot.artist_id

-- joining'stream_hist' & 'mylibrary_features' to get featurs of all streamed tracks in my library
SELECT *
FROM `spotify-354203.spotify1.stream_hist` AS stream_hist
LEFT JOIN `spotify-354203.spotify1.mylibrary_features` AS mylibrary_features
  ON stream_hist.track = mylibrary_features.track










