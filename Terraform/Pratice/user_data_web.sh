#!/bin/bash
sudo yum install httpd
sudo cat > /test.txt << EOF
{
  "A" : "B"
} EOF
