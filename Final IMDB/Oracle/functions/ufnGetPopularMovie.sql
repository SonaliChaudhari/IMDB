CREATE TYPE POPULARMOVIEBGENRE AS OBJECT (GENRE VARCHAR(50), BOXOFFICECOLLECTION INT);

CREATE TYPE POPULARMOVIEBYGENRE IS TABLE OF POPULARMOVIEBGENRE;

CREATE or REPLACE FUNCTION ufnPopularMoviesByGenre
RETURN POPULARMOVIEBYGENRE PIPELINED IS
BEGIN
FOR I IN (SELECT MG.Genre , 
              SUM(BOC.CollectionAmount) AS BOXOFFICECOLLECTION 
        FROM BoxOfficeCollectionOfMovie BOC, 
           Movie MM,
           Genre MG,
           MovieTVGenre MTG
        WHERE MM.MovieID = MTG.MovieID AND
            MG.GenreID = MTG.GenreID AND
            BOC.MovieID = MM.MovieID
        GROUP BY MG.Genre)
LOOP
PIPE ROW (POPULARMOVIEBGENRE(I.GENRE, I.BOXOFFICECOLLECTION));
END LOOP;
RETURN;
END;
/