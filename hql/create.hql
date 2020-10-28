CREATE DATABASE IF NOT EXISTS movielens
LOCATION '/hive/warehouse/external/movielens.db';

USE movielens;

CREATE EXTERNAL TABLE IF NOT EXISTS genome_tags (
	tagId INT,
	tag STRING
)
ROW FORMAT
DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/hive/warehouse/external/movielens.db/genome-tags'
TBLPROPERTIES('skip.header.line.count'='1');

CREATE EXTERNAL TABLE  IF NOT EXISTS genome_scores(
  	movieId INT,
	tagId INT,
	relevance DOUBLE
)
ROW FORMAT
DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/hive/warehouse/external/movielens.db/genome-scores'
TBLPROPERTIES('skip.header.line.count'='1');

CREATE EXTERNAL TABLE  IF NOT EXISTS links (
  	movieId INT,
	imdbId STRING,
  	TmbId STRING
)
ROW FORMAT
DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/hive/warehouse/external/movielens.db/links'
TBLPROPERTIES('skip.header.line.count'='1');

CREATE EXTERNAL TABLE IF NOT EXISTS movies (
  	movieId INT,
	title STRING,
  	geners STRING
)
ROW FORMAT
DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/hive/warehouse/external/movielens.db/movies'
TBLPROPERTIES('skip.header.line.count'='1');


CREATE EXTERNAL TABLE  IF NOT EXISTS ratings_tmp (
  	userId INT,
  	movieId INT,
	rating DOUBLE,
  	createdOn BIGINT
)
ROW FORMAT
DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/hive/warehouse/external/movielens.db/ratings_tmp'
TBLPROPERTIES('skip.header.line.count'='1');

CREATE EXTERNAL TABLE  IF NOT EXISTS ratings (
  	userId INT,
  	movieId INT,
	rating DOUBLE,
  	createdOn TIMESTAMP
)
ROW FORMAT
DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/hive/warehouse/external/movielens.db/ratings'
TBLPROPERTIES('skip.header.line.count'='1');

CREATE EXTERNAL TABLE  IF NOT EXISTS tags_tmp (
  	userId INT,
  	movieId INT,
	tag STRING,
  	createdOn BIGINT
)
ROW FORMAT
DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/hive/warehouse/external/movielens.db/tags_tmp'
TBLPROPERTIES('skip.header.line.count'='1');


CREATE EXTERNAL TABLE  IF NOT EXISTS tags (
  	userId INT,
  	movieId INT,
	tag STRING,
  	createdOn TIMESTAMP
)
ROW FORMAT
DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/hive/warehouse/external/movielens.db/tags'
TBLPROPERTIES('skip.header.line.count'='1');