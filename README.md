# docker_scrapyd
## docker compose build
```
docker-compose build --no-cache
docker-compose up -d
```

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
	quote TEXT NULL,
	author TEXT NULL,
	CONSTRAINT quotes_PK PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;
```

``` scrapy settings.py
ITEM_PIPELINES = {
    '<<PROJECT_NAME>>.pipelines.QuotesMysqlPipeline': 300,
}
```

## use splash
```scrapy settings.py
# Enable or disable downloader middlewares
# See https://docs.scrapy.org/en/latest/topics/downloader-middleware.html
DOWNLOADER_MIDDLEWARES = {
    'scrapy_splash.SplashCookiesMiddleware': 723,
    'scrapy_splash.SplashMiddleware': 725,
    'scrapy.downloadermiddlewares.httpcompression.HttpCompressionMiddleware': 810
}

SPLASH_URL = 'http://splash:8050/'

DUPEFILTER_CLASS = 'scrapy_splash.SplashAwareDupeFilter'
HTTPCACHE_STORAGE = 'scrapy_splash.SplashAwareFSCacheStorage'
```