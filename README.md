# Docker WebdriverIO
Using selenium hub to organize other nodes

### Configuration

#### docker-compose.yml
```yaml
version: '2'
services:
  e2e:
    image: casperlai/docker-webdriverio:latest
    depends_on:
      - chrome
      - firefox

  hub:
    image: selenium/hub
    ports:
      - 4444:4444
    container_name: hub

  firefox:
    image: selenium/node-firefox
    ports:
      - 5900
    environment:
      - HUB_PORT_4444_TCP_ADDR=hub
      - HUB_PORT_4444_TCP_PORT=4444
    depends_on:
      - hub

  chrome:
    image: selenium/node-chrome
    ports:
      - 5900
    environment:
      - HUB_PORT_4444_TCP_ADDR=hub
      - HUB_PORT_4444_TCP_PORT=4444
    depends_on:
      - hub

  # Add another service
```

#### wdio.conf.js

```js
exports.config = {
    host: 'YOUR-DOCKER-MACHINE-IP',
    port: 4444,
    ...
}
```

### Run
```shell
docker-compose up
```

