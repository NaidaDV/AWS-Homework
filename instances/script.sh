#!/bin/bash
yum -y update
yum -y install nginx
service nginx restart 
