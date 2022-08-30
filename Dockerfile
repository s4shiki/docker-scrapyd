FROM python:3.8.6

USER root

RUN apt-get update && \
  apt-get -y install locales && \
  localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 && \
  mkdir py-work

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9

# python package
RUN pip install --upgrade pip && \
  pip install pymysql==1.0.2 && \
  # pip install requests && \
  # pip install bs4 && \
  pip install scrapy==2.6.2 && \
  pip install scrapyd==1.3.0 && \
  pip install scrapyd-client==1.2.2 && \
  pip install scrapy_splash==0.8.0

COPY ./scrapyd.conf /etc/scrapyd/
VOLUME /etc/scrapyd/ /var/lib/scrapyd/
EXPOSE 6800

CMD ["scrapyd"]