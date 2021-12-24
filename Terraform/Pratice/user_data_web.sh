#! /bin/bash
sudo yum install httpd
sudo vi /test.txt << EOF
{
  "A" : "B"
} EOF
