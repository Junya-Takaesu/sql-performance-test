# docker build -t sql-research .
# -v /mysql/config/:/etc/mysql/conf.d
FROM mysql:8.0.31-debian
ENV MYSQL_ROOT_PASSWORD=my-secret-pw

# コンテナ内で日本語が打てるようにlocalを変更といらないファイル削除
RUN apt-get update \
    && apt-get install -y locales \
    && sed -i -E 's/# (ja_JP.UTF-8)/\1/' /etc/locale.gen \
    && locale-gen \
    && update-locale LANG=ja_JP.UTF-8 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
ENV LC_ALL ja_JP.UTF-8

COPY ./migration.sql /docker-entrypoint-initdb.d/
