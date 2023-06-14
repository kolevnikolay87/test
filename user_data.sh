#!/bin/bash
    amazon-linux-extras install -y nginx1
    systemctl enable nginx --now
    sudo amazon-linux-extras install epel -y
    sudo yum install stress -y
    sudo rm /usr/share/nginx/html/index.html
    echo '<html><style>body {font-size: 20px;}</style><body><p>Server: Ace!! &#x1F0A1;</p></body></html>' | sudo tee /usr/share/nginx/html/index.html
    stress --cpu 80