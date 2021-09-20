Docker container for running the get_iplayer script: https://github.com/get-iplayer/get_iplayer

## Configuration and output

The image uses two volume mounts. One which saves the configuration data, and one which stores the downloaded programmes. The mounting points of these are:
```
config: /root/.get-iplayer
downloads: /data/output
```

## Usage

For full instructions please refer to the get_iplayer documentation: https://github.com/get-iplayer/get_iplayer/wiki

### Docker & Docker-compose

The Web PVR manager is exposed on port 1935, so ensure you map this port when starting the container.

A typical docker run command could look like this:
`docker build -t <your tag> .`
`docker run -it -p 1935:1935 -v /path/to/config:/root/.get-iplayer -v /path/to/download:/data/output <your tag>`

If you use docker-compose, the yaml file is already setup with these, so amend the file to suit your folder locations, and then build and run in one go with:
`docker-compose up --build -d`

### Get-iplayer basic functions

```
# View help
docker run -v $(pwd)/data:/data barwell/get-iplayer -h

# Search for 'news'
docker run -v $(pwd)/data:/data barwell/get-iplayer news

# Download programme at index 1234
docker run -v $(pwd)/data:/data barwell/get-iplayer --get 1234

# Download programme with PID b06z12ab
docker run -v $(pwd)/data:/data barwell/get-iplayer --pid b06z12ab

# Download radio programme with PID b06z34cd
docker run -v $(pwd)/data:/data barwell/get-iplayer --type radio --pid b06z34cd

# Download programme from iPlayer website URL
docker run -v $(pwd)/data:/data barwell/get-iplayer --url https://www.bbc.co.uk/iplayer/episode/<id>/<name>
```
