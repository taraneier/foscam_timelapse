#!/bin/bash

env=$(curl -s "http://192.168.0.59/dhtcsv")
datestamp=$(date +'%Y/%m/%d')
timestamp=$(date +'%H:%M')

echo "$datestamp, $timestamp, $env"
