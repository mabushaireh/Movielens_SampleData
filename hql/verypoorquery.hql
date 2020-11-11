USE movielens;

SELECT *
FROM genome_scores gs, ratings r, movies m
WHERE gs.movieId = r.movieId AND m.movieId = gs.movieId
LIMIT 100;