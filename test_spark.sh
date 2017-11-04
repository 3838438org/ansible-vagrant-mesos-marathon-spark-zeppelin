#!/bin/bash
# test_spark.sh: Script to execute test example job on Spark on Mesos

# ssh ubuntu@master01 "/usr/lib/spark/bin/run-example SparkPi 10"

ssh ubuntu@master01 "/usr/lib/spark/bin/spark-submit \
  --class org.apache.spark.examples.SparkPi \
  --master mesos://zk://master01:2181/mesos \
  --supervise \
  --executor-memory 512m \
  /usr/lib/spark/examples/jars/spark-examples_2.11-2.1.0.jar \
  10000"
