USE movielens;
INSERT INTO ratings 
SELECT
 userId,
 movieId,
 rating,
 CAST(from_unixtime(createdOn,"yyyy-MM-dd HH:mm:ss") as TIMESTAMP) AS createdOn
FROM ratings_tmp;

INSERT INTO tags 
SELECT
 userId,
 movieId,
 tag,
 CAST(from_unixtime(createdOn,"yyyy-MM-dd HH:mm:ss") as TIMESTAMP) AS createdOn
FROM tags_tmp;
