INSERT INTO Genre(id, genre_name)
	VALUES
	(1, 'Indie'),
	(2, 'Rock'),
	(3, 'Metal'),
	(4, 'Rap'),
	(5, 'New Wave');

INSERT INTO Singer(id, singer_alias)
	VALUES 
	(11, 'Mudvayne' ),
	(12, 'Lorde' ),
	(13, 'Seether' ),
	(14, 'Lil Xtra' ),
	(15, 'The Midnight' ),
	(16, 'W O L F C L U B' ),
	(17, 'The Wombats' ),
	(18, 'Godsmack' );
	
INSERT INTO SingerGenre(singergenre_id, singer_id, genre_id)
	VALUES
	(60, 11, 3),
	(61, 12, 1),	
	(62, 13, 2),	
	(63, 14, 4),	
	(64, 15, 5),
	(65, 16, 5),
	(66, 17, 1),
	(67, 18, 3);

INSERT INTO Album(id, album_name, a_pub_date)
	VALUES
	(21, 'Pure Heroine', 2010),
	(22, 'Lost and found', 2006),
	(23, 'Finding Beauty In Negative Spaces', 2008),
	(24, 'Spring never comes', 2018),
	(25, 'Nocturnal', 2017),
	(26, 'IV', 2006),
	(27, 'Beautiful People Will Ruin Your Life', 2019),
	(28, 'Chasing the storm', 2020);
	
INSERT INTO SingerAlbum(singeralbum_id, singer_id, album_id)
	VALUES
	(70, 11,22),
	(71, 12,21),
	(72, 13,23),
	(73, 14,24),
	(74, 15,25),
	(75, 16,28),
	(76, 17,27),
	(77, 18,26);

INSERT INTO Track(id, track_name, duration, track_year, album_id)
	VALUES
	(31, 'Say My Name', '00:03:44', 2006, 26),
	(32, 'A World Alone', '00:03:38', 2012, 21),
	(33, 'Lemon to a knife fight', '00:03:15', 2018, 27),
	(34, 'FMLYHM', '00:04:15', 2008, 23),
	(35, 'Happy?', '00:03:05', 2005, 22),
	(36, 'Cant stop falling in Love', '00:04:44', 2011, 28),
	(37, 'Sunset', '00:04:49', 2018, 25),
	(38, 'Days of Thunder', '00:05:12', 2020, 25),
	(39, 'Still Sane', '00:03:25', 2010, 21),
	(40, 'Say My Name', '00:03:44', 2014, 26),
	(41, 'Anxiety', '00:02:12', 2015, 24),
	(42, 'Rise Above this', '00:03:29', 2004, 23),
	(43, 'Forget To Remember', '00:03:36', 2005, 22),
	(44, 'Straight Out Of Line', '00:04:08', 2003, 26),
	(45, 'Hide', '00:02:40', 2019, 24);
	
INSERT INTO Collection(id, collection_name, c_pub_date)
	VALUES
	(51, 'Mega', 2021),
	(52, 'Giga', 2018),
	(53, 'Ultra', 2020),
	(54, 'Super', 2020),
	(55, 'Giga', 2020),
	(56, 'Nano', 2019),
	(57, 'Uber', 2020),
	(58, 'Hot', 2018);
	
INSERT INTO CollectionTrack(collectiontrack_id, track_id, collection_id)
	VALUES(80, 31, 57),
	(81, 31, 52),
	(82, 32, 52),
	(83, 32, 53),
	(84, 33, 58),
	(85, 34, 57),
	(86, 35, 51),
	(87, 36, 53),
	(88, 36, 51),
	(89, 37, 54),
	(90, 38, 55),
	(91, 39, 55),
	(92, 40, 54),
	(93, 40, 57),
	(94, 41, 53),
	(95, 42, 52),
	(96, 43, 56),
	(97, 41, 57),
	(98, 45, 58);