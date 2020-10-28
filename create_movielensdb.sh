#!/bin/bash

beeline -u 'jdbc:hive2://headnodehost:10001/;transportMode=http' -f ./hql/clean.hql

beeline -u 'jdbc:hive2://headnodehost:10001/;transportMode=http' -f ./hql/create.hql


cd ~
mkdir movielens
cd movielens

wget "http://files.grouplens.org/datasets/movielens/ml-25m.zip"

unzip ml-25m.zip -d ./


hdfs dfs -copyFromLocal ./ml-25m/links.csv /hive/warehouse/external/movielens.db/links/
hdfs dfs -copyFromLocal ./ml-25m/tags.csv /hive/warehouse/external/movielens.db/tags_tmp/
hdfs dfs -copyFromLocal ./ml-25m/movies.csv /hive/warehouse/external/movielens.db/movies/
hdfs dfs -copyFromLocal ./ml-25m/ratings.csv /hive/warehouse/external/movielens.db/ratings_tmp/
hdfs dfs -copyFromLocal ./ml-25m/genome-tags.csv /hive/warehouse/external/movielens.db/genome-tags/
hdfs dfs -copyFromLocal ./ml-25m/genome-scores.csv /hive/warehouse/external/movielens.db/genome-scores/


beeline -u 'jdbc:hive2://headnodehost:10001/;transportMode=http' -f fixtimestamp.hql