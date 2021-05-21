create table if not exists Genre(
	Id serial primary key,
	genre_name varchar(100) not null
);

create table if not exists Singer(
	Id serial primary key,
	singer_alias varchar(100) not null
);

create table if not exists SingerGenre(
	singergenre_id serial primary key,
	singer_id integer not null references Singer(Id),
	genre_id integer not null references Genre(Id)
);

create table if not exists Album(
	Id serial primary key,
	album_name varchar(100) not null,
	a_pub_date integer not null
);

create table if not exists SingerAlbum(
	singeralbum_id serial primary key,
	singer_id integer not null references Singer(Id),
	album_id integer not null references Album(Id)	
);

create table if not exists Track(
	Id serial primary key,
	track_year integer not null,
	track_name varchar(100) not null,
	duration time not null,
	album_id integer not null references Album(Id)
);

create table if not exists Collection(
	Id serial primary key,
	collection_name varchar(100) not null,
	c_pub_date integer not null
);

create table if not exists CollectionTrack(
	collectiontrack_id serial primary key,
	track_id integer not null references Track(Id),
	collection_id integer not null references Collection(Id)
);