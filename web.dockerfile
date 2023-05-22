FROM nginx

# RUN apt-get update -y \
#   && apt-get install -y \
#   apache2-utils \
#   && rm -rf /var/lib/apt/lists/*

# ENV FORWARD_PORT=80

# WORKDIR /app

ADD nginx.conf /etc/nginx/conf.d/default.conf