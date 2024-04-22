create database virtualartgallery;
use virtualartgallery;

-- Create the Artists table :
create table artists ( 
artist_id int primary key,
name varchar(255) not null, 
biography text, 
nationality varchar(100)); 


-- Create the Categories table :
create table categories ( 
category_id int primary key, 
name varchar(100) not null);

-- Create the Artworks table:
create table artworks ( 
artwork_id int primary key,
title varchar(255) not null, 
artist_id int, 
category_id int,
year int, 
description text, 
image_url varchar(255), 
Foreign key(artist_id) references artists(artist_id), 
Foreign key(category_id) references categories(category_id));

-- Create the Exhibitions table :
create table exhibitions ( 
exhibition_id int primary key, 
title varchar(255) not null, 
start_date date, 
end_date date, 
description text);

-- Create a table to associate artworks with exhibitions :
create table exhibition_artworks ( 
exhibition_id int, 
artwork_id int, 
primary key(exhibition_id, artwork_id), 
Foreign key(exhibition_id) references exhibitions (exhibition_id), 
Foreign key(artwork_id) references artworks(artwork_id));


-- Insert sample data into the Artists table:

insert into artists (artist_id, name, biography, nationality)values 
(1, 'Pablo Picasso', 'Renowned Spanish painter and sculptor.', 'Spanish'), 
(2, 'Vincent van Gogh', 'Dutch post-impressionist painter.', 'Dutch'), 
(3, 'Leonardo da Vinci', 'Italian polymath of the Renaissance.', 'Italian');

-- Insert sample data into the Categories table 
insert into categories (category_id, name) values 
(1, 'Painting'), 
(2, 'Sculpture'), 
(3, 'Photography'); 

-- Insert sample data into the Artworks table :
insert into artworks (artwork_id, title, artist_id, category_id, year, description, image_url) values 
(1, 'Starry Night', 2, 1, 1889, 'A famous painting by Vincent van Gogh.', 'starry_night.jpg'), 
(2, 'Mona Lisa', 3, 1, 1503, 'The iconic portrait by Leonardo da Vinci.', 'mona_lisa.jpg'), 
(3, 'Guernica', 1, 1, 1937, 'Pablo Picasso\'s powerful anti-war mural.', 'guernica.jpg');

-- Insert sample data into the Exhibitions table: 
insert into exhibitions (exhibition_id, title, start_date, end_date, description) values 
(1, 'Modern Art Masterpieces', '2023-01-01', '2023-03-01', 'A collection of modern art masterpieces.'), 
(2, 'Renaissance Art', '2023-04-01', '2023-06-01', 'A showcase of Renaissance art treasures.'); 

-- Insert artworks into exhibitions:
insert into exhibition_artworks (exhibition_id, artwork_id) values 
(1, 1), 
(1, 2), 
(1, 3), 
(2, 2);
