#!/bin/bash

yay -Sy docker
sudo usermod -aG docker ${USER}
systemctl enable docker
systemctl start docker
