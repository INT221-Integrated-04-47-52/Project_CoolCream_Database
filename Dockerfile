FROM mysql:8.0.23 as mysql
COPY ./scriptCool ./scriptCool
ENV  MYSQL_ROOT_PASSWORD=Coolcream044752
EXPOSE 3306