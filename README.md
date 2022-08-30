# docker_scrapyd
## docker compose build

## scrapy deploy
```
$docker-compose exec scrapyd bash

#scrapy startproject <<PROJECT_NAME>>
ex. #scrapy startproject quotes_mysql

#cd quotes_mysql

#genspider <<SPIDER_NAME>> <<TARGET_HOST>>
ex. #scrapy genspider quotes quotes.toscrape.com
```

```
[deploy]
url = http://db:6800/
```

## mysql setting
```
CREATE TABLE test_database.quotes (
	id INT UNSIGNED auto_increment NOT NULL,
	`text` TEXT NULL,
	author TEXT NULL,
	tags TEXT NULL,
	CONSTRAINT quotes_PK PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;
```