#!/bin/bash

/usr/hdp/4.1.2.5/hive/bin/hive.distro -f ./hql/clean.hql

/usr/hdp/4.1.2.5/hive/bin/hive.distro -f ./hql/create.hql


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

cd ..
/usr/hdp/4.1.2.5/hive/bin/hive.distro -f ./hql/fixtimestamp.hql