#!/bin/bash
echo "Ola amigos! Criado pelo Terraform no Linode!!" > index.html
nohup busybox httpd -f -p 80 &