services:
  homeassistant:
    container_name: ha
    image: ghcr.io/home-assistant/home-assistant:stable
    ports:
      - "8123:8123"
    volumes:
      - ./config:/config
      - /etc/localtime:/etc/localtime:ro
    environment:
      - TZ=Europe/Berlin
    restart: unless-stopped
    networks:
      - nginx_proxy
    # Optional: Expose port for local access (not needed if fully behind Nginx Proxy)
    # ports:
    #   - "8123:8123"

networks:
  nginx_proxy:
    external: true
