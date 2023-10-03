# learn_sql

Smattering of content from [LearnSQL.com](https://learnsql.com/) (née [Vertabelo Academy](https://academy.vertabelo.com/)).

## Setup
* Install
  * [editorconfig](https://editorconfig.org/)
  * [asdf](https://asdf-vm.com/guide/getting-started.html#_2-download-asdf)
  * [poetry](https://python-poetry.org/docs/)
  * [docker-compose](https://docs.docker.com/compose/install/)

## Quickstart
```bash
# install python
asdf install python 3.11.5

# install poetry
asdf install poetry 1.6.1

# spin up database container
λ ./bin/bootstrap
Which database do you want to use?
1) mysql
2) postgres
Enter your choice: 1
MySQL is already running. Skipping...
Starting container...
Creating database...
Setting up database...
Connecting to database...
mysql> 

#!DANGER WILL ROBINSON!: replaces existing table and values
# import csv
λ poetry shell
λ ./bin/import_data.py ./course/insert-update-delete/intro/dish.csv dish
<mysql.connector.connection_cext.CMySQLConnection object at 0x10630d3d0>
Data imported successfully

# connect to db
λ docker exec -it some-mysql bash
root@6c778a74e8a3:/# mysql -u root -p -h localhost
Enter password:
<SNIP>

mysql> USE db;
mysql> SELECT * FROM dish;
+------+-------------+-----------------+-------+
| id   | type        | name            | price |
+------+-------------+-----------------+-------+
|    1 | starter     | Prawn Salad     |    13 |
|    2 | starter     | Spring Scrolls  |    11 |
|    3 | main course | Asian Noodles   |    25 |
|    4 | main course | Pork Roast      |    32 |
|    5 | main course | Chicken Nuggets |    24 |
|    6 | main course | Pizza Italiana  |    30 |
|    7 | dessert     | Peach Cobbler   |    10 |
|    8 | dessert     | Cherry Brownies |    12 |
+------+-------------+-----------------+-------+
8 rows in set (0.01 sec)

mysql> exit;
Bye
```

## TODO
* Finish course(s)
* Python
  * Add properties test (hypothesis)
* Test postgres
* Add docker shim

## Further Reading
[mysql - Official Image | Docker Hub](https://hub.docker.com/_/mysql/)

[postgres - Official Image | Docker Hub](https://hub.docker.com/_/postgres)

[Python Database Tutorials – Real Python](https://realpython.com/tutorials/databases/)

[TablePlus | Modern, Native Tool for Database Management](https://tableplus.com/)
