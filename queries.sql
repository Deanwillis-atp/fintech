
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| test               |
+--------------------+
5 rows in set (0.113 sec)

mysql> CREATE DATABASE fintech;
Query OK, 1 row affected (0.017 sec)

mysql> USE fintech;
Database changed
mysql> use fintech;
Database changed
mysql> show databases
    -> ;
+--------------------+
| Database           |
+--------------------+
| fintech            |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| test               |
+--------------------+
6 rows in set (0.002 sec)

mysql> use fintech;
Database changed
mysql> show tables;
+-------------------+
| Tables_in_fintech |
+-------------------+
| sp500             |
+-------------------+
1 row in set (0.002 sec)

mysql> select * from sp500 limit 5;
+--------+------------------+------------+--------+--------+-----------+-----------+-----------+-----------+-----------+----------+------+------------------------+--------------------------------------------+
| Ticker | Company          | MarketCap  | Price  | Weight | Change_1D | Change_1M | Change_1Y | Change_5Y | Volume_1D | PE_Ratio | Beta | Sector                 | Industry                                   |
+--------+------------------+------------+--------+--------+-----------+-----------+-----------+-----------+-----------+----------+------+------------------------+--------------------------------------------+
| NVDA   | NVIDIA Corp      |    4900824 | 201.68 | 0.0757 |    0.0168 |    0.1086 |     0.852 |     14.11 | 147784255 |    41.14 | 2.31 | Information Technology | Semiconductors                             |
| GOOGL  | Alphabet Class A | 4133302.96 | 341.68 |  0.032 |    0.0168 |    0.0989 |     1.152 |      2.31 |  23460601 |    31.61 | 1.15 | Communication Services | Interactive Media & Services               |
| GOOG   | Alphabet Class C |  4105721.8 |  339.4 | 0.0318 |    0.0199 |    0.0969 |      1.11 |      2.28 |  17897038 |    31.44 | 1.15 | Communication Services | Interactive Media & Services               |
| AAPL   | Apple Inc        | 3967284.37 | 270.23 | 0.0613 |    0.0259 |    0.0629 |     0.272 |      1.21 |  53864425 |    34.33 | 1.08 | Information Technology | Technology Hardware, Storage & Peripherals |
| MSFT   | Microsoft Corp   | 3139482.06 | 422.79 | 0.0485 |     0.006 |    0.0585 |      0.07 |      0.79 |  43518272 |    26.45 | 1.12 | Information Technology | Systems Software                           |
+--------+------------------+------------+--------+--------+-----------+-----------+-----------+-----------+-----------+----------+------+------------------------+--------------------------------------------+
5 rows in set (0.000 sec)

mysql> select Ticker, Price from sp500  where Change_1D < -0.02 AND Change_1M > 0.01;
+--------+--------+
| Ticker | Price  |
+--------+--------+
| NFLX   |  97.31 |
| CBOE   | 299.94 |
| HAL    |  37.15 |
| ALB    | 197.75 |
| CNC    |  38.17 |
+--------+--------+
5 rows in set (0.004 sec)

mysql> select sector, avg(price), avg(change_1M) from sp500 group by sector;
+------------------------+--------------------+-----------------------+
| sector                 | avg(price)         | avg(change_1M)        |
+------------------------+--------------------+-----------------------+
| Information Technology |  289.3555714285715 |   0.08805428571428578 |
| Communication Services |  140.1904347826087 |   0.03989565217391304 |
| Consumer Discretionary |  395.5564583333334 |   0.03132708333333334 |
| Consumer Staples       | 107.34583333333336 | -0.021833333333333333 |
| Financials             |           198.3796 |   0.07409466666666664 |
| Health Care            |  242.7369491525423 |  0.018183050847457628 |
| Energy                 | 121.00818181818181 |  -0.04628181818181818 |
| Industrials            | 309.98088607594934 |   0.03410126582278482 |
| Materials              |  167.1161538461538 |  0.045823076923076925 |
| Utilities              |  98.39451612903224 | -0.009887096774193548 |
| Real Estate            | 144.01806451612902 |   0.04221290322580645 |
| --                     |            341.615 |                  NULL |
+------------------------+--------------------+-----------------------+
12 rows in set (0.001 sec)

mysql> select * from sp500 order by marketcap DESC limit 5;
+--------+------------------+------------+--------+--------+-----------+-----------+-----------+-----------+-----------+----------+------+------------------------+--------------------------------------------+
| Ticker | Company          | MarketCap  | Price  | Weight | Change_1D | Change_1M | Change_1Y | Change_5Y | Volume_1D | PE_Ratio | Beta | Sector                 | Industry                                   |
+--------+------------------+------------+--------+--------+-----------+-----------+-----------+-----------+-----------+----------+------+------------------------+--------------------------------------------+
| NVDA   | NVIDIA Corp      |    4900824 | 201.68 | 0.0757 |    0.0168 |    0.1086 |     0.852 |     14.11 | 147784255 |    41.14 | 2.31 | Information Technology | Semiconductors                             |
| GOOGL  | Alphabet Class A | 4133302.96 | 341.68 |  0.032 |    0.0168 |    0.0989 |     1.152 |      2.31 |  23460601 |    31.61 | 1.15 | Communication Services | Interactive Media & Services               |
| GOOG   | Alphabet Class C |  4105721.8 |  339.4 | 0.0318 |    0.0199 |    0.0969 |      1.11 |      2.28 |  17897038 |    31.44 | 1.15 | Communication Services | Interactive Media & Services               |
| AAPL   | Apple Inc        | 3967284.37 | 270.23 | 0.0613 |    0.0259 |    0.0629 |     0.272 |      1.21 |  53864425 |    34.33 | 1.08 | Information Technology | Technology Hardware, Storage & Peripherals |
| MSFT   | Microsoft Corp   | 3139482.06 | 422.79 | 0.0485 |     0.006 |    0.0585 |      0.07 |      0.79 |  43518272 |    26.45 | 1.12 | Information Technology | Systems Software                           |
+--------+------------------+------------+--------+--------+-----------+-----------+-----------+-----------+-----------+----------+------+------------------------+--------------------------------------------+
5 rows in set (0.001 sec)

mysql> SELECT sector ,avg(PE_ratio) from sp500 where beta > 1 GROUP BY sector;
+------------------------+---------------------+
| sector                 | avg(PE_ratio)       |
+------------------------+---------------------+
| Information Technology |   18.04903846153846 |
| Communication Services | -37.870999999999995 |
| Consumer Discretionary |   39.90382352941177 |
| Financials             |  24.845757575757577 |
| Industrials            |   40.64217391304349 |
| Health Care            |   30.49368421052631 |
| Real Estate            |             59.1525 |
| Utilities              |   52.64666666666667 |
| Materials              |  17.087692307692308 |
| --                     |              322.24 |
| Consumer Staples       |             -179.93 |
+------------------------+---------------------+
11 rows in set (0.001 sec)

mysql> 