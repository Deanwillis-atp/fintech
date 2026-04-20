# S&P 500 Financial Data Pipeline

## Overview
This is a data pipeline taking information from https://www.sp500live.co/companies, cleaning the data in python pandas by removing 'UNCH' values and 'M' from marketcap which are 'non-numeric' data exc. Then using MySQL to query data and to give information on what stocks might be added to a diversified portfolio. Using python pandas to query and create a new Excel spread sheet 's&p_500_analysis.xlsx' with the results of said queries.

## Tools Used
- Python (pandas)
- MySQL
- Excel

## Pipeline
1. Raw S&P 500 data sourced from Excel
2. Cleaned and normalized using Python/pandas
3. Loaded into MySQL database
4. Queried for financial analysis

## Queries
**Dip Buys** — Stocks down >2% on the day but up >1% on the month. Potential short-term buying opportunities.

**Avg Price per Sector** — Average price and monthly change grouped by sector.

**Top Market Cap** — Top 10 largest companies in the index by market cap.

**PE Ratio by Sector (High Beta)** — Average PE ratio by sector for stocks with Beta > 1.

**One Year Change by Sector** — Best and worst performing sectors over the past year.

**Top Sellers** — Stocks with daily volume exceeding 100 million shares sold.

## How to Run
1. Clone the repo
2. Install dependencies: `pip install pandas sqlalchemy pymysql mysql-connector-python openpyxl`
3. Update the file path in `project_1.py`
4. Run `project_1.py` to load data into MySQL
5. Open `queries.sql` in your MySQL client
