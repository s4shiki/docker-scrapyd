# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html


# useful for handling different item types with a single interface
import pymysql


class ExamplePipeline:
    def open_spider(self, spider):
        self.connection = pymysql.connect(
            host="db",
            user="docker",  # DBにあわせて変更
            passwd="docker",  # DBにあわせて変更
            database="test_database",
            charset="utf8mb4"
        )
        self.cursor = self.connection.cursor()

    def process_item(self, item, spider):
        insert_qry = "INSERT INTO `quotes` (`quote`, `author`) VALUES (%s, %s)"
        self.cursor.execute(
            insert_qry, (item["quote"], item["author"]))
        self.connection.commit()

        return item

    def close_spider(self, spider):
        self.connection.close()
