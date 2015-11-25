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

-- find all pixar movies
-- find all movies published by pixar or disney
-- find all movies not published by pixar
-- find all movies released after 2004
-- find all movies released between 1982 and 2003 - Inclusive
-- sort all movies by descending title
-- sort all movies by ascending title
-- sort all movies by descending release date
-- sort all movies by ascending release date
-- sort all movies by preferred studios and release date ascending
