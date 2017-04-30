Requirements:

	* Docker community edition version 1.11 or higher
	* docker-compose 1.12.0

	* Github personal token with access to public repositories
	* Transifex credentials

# How-to

```
	# cp .env.template .env
	# ... edit .env , set github and transifex credentials ...
	# ./build.sh
	# docker-compose up -d
```
