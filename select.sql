--количество исполнителей в каждом жанре;
SELECT g.genre_name, COUNT(s.id) count FROM Genre g
JOIN singergenre sg ON g.id = sg.genre_id
JOIN singer s ON sg.singer_id = s.id
GROUP BY  g.genre_name
ORDER BY  count DESC;

--количество треков, вошедших в альбомы 2019-2020 годов;
SELECT COUNT(t.id) count FROM album a
JOIN track t ON t.album_id = a.id
WHERE a.a_pub_date >= 2019
AND a.a_pub_date <= 2020;

--средняя продолжительность треков по каждому альбому;
SELECT a.album_name, AVG(t.duration) avg FROM album a
JOIN track t ON t.album_id = a.id
GROUP by a.album_name
ORDER BY avg DESC;

--все исполнители, которые не выпустили альбомы в 2020 году;
SELECT s.singer_alias FROM singer s
JOIN singeralbum sa ON s.id = sa.singer_id
JOIN album a ON sa.album_id = a.id
WHERE NOT EXISTS(SELECT * FROM singer WHERE a.a_pub_date = 2020)
GROUP BY s.singer_alias
ORDER BY s.singer_alias;

--названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
SELECT c.collection_name FROM collection c
JOIN collectiontrack ct ON c.id = ct.collection_id
JOIN track t ON ct.track_id = t.id
JOIN album a ON t.album_id = a.id
JOIN singeralbum sa ON a.id = sa.album_id
JOIN singer s on s.id = sa.singer_id
WHERE s.singer_alias = 'Mudvayne'
GROUP BY c.collection_name
ORDER BY c.collection_name;

--название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT a.album_name FROM album a
JOIN singeralbum sa ON a.id = sa.album_id
JOIN singer s ON sa.singer_id = s.id
JOIN singergenre sg ON sg.singer_id = s.id
JOIN genre g ON sg.genre_id = g.id
GROUP BY a.album_name
HAVING COUNT(g.id) > 1;

--наименование треков, которые не входят в сборники;
SELECT t.track_name FROM track t
LEFT JOIN collectiontrack ct ON ct.track_id = t.id 
WHERE ct.collection_id IS NULL
GROUP BY t.track_name;

--исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
SELECT s.singer_alias FROM singer s
JOIN singeralbum sa ON s.id = sa.singer_id
JOIN album a ON sa.album_id = a.id
JOIN track t ON t.album_id = a.id
WHERE t.duration = (SELECT MIN(duration) from track)
GROUP BY s.singer_alias
ORDER BY s.singer_alias;

--название альбомов, содержащих наименьшее количество треков.
SELECT a.album_name from track t 
JOIN album a ON a.id = t.album_id
GROUP BY a.album_name 
HAVING COUNT(t.id) = (SELECT MIN(count) FROM 
                                (SELECT album.album_name, COUNT(track.id) count FROM track
                                JOIN album ON album.id = track.album_id
                                GROUP BY album.album_name) as c
                            )