# S&P 500 Financial Data Pipeline

## Overview
This is a data pipeline taking information from https://www.sp500live.co/companies, cleaning the data in python pandas by removing 'UNCH' values and 'M'
from marketcap which are no numeric data exc. Then using MySQL to query data and to give information on what stocks might be added to a diversified portfolio. 

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
**Stocks down on the day but up on the month**
Identifies potential dip-buying opportunities.

**Average price and monthly change by sector**
Sector-level performance comparison.

**Top 5 stocks by market cap**
Largest companies in the index.

**Average PE ratio by sector (Beta > 1)**
Valuation analysis for high-volatility stocks.

## How to Run
1. Clone the repo
2. Install dependencies: `pip install pandas sqlalchemy pymysql mysql-connector-python openpyxl`
3. Update the file path in `project_1.py`
4. Run `project_1.py` to load data into MySQL
5. Open `queries.sql` in your MySQL client
