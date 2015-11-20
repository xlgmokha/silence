CREATE TABLE movies (
  id integer NOT NULL,
  title character varying(255),
  studio_id integer,
  year integer
);

CREATE TABLE studios (
  id integer NOT NULL,
  title character varying(255)
);

-- COPY studios (id, title) FROM stdin;
-- 1	Castle Rock
-- 2	MiramaxFilms
-- 3	RegencyEnterprises
-- 4	Pixar
-- 5	Disney
-- \.

-- Can find all pixar movies
-- Can find all movies published by pixar or disney
-- Can find all movies not published by pixar
-- Can find all movies released after 2004
-- Can find all movies released between 1982 and 2003 - Inclusive
-- Sorts all movies by descending title
-- Sorts all movies by ascending title
-- Sorts all movies by descending release date
-- Sorts all movies by ascending release date
-- Sorts all movies by preferred studios and release date ascending
