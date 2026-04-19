import pandas as pd
import mysql.connector
from sqlalchemy import create_engine


conn = mysql.connector.connect( 
    host='localhost',
    user='root' ,
    password='',
    database=' fintech'
)


df = pd.read_excel('/Users/dean/Desktop/Quota/fintech/s&p_500.xlsx')
df['Change_1D'] = pd.to_numeric(df['Change_1D'], errors='coerce')
df['MarketCap'] = df['MarketCap'].str.replace(',', '').str.replace('M', '').astype(float)
df['Beta'] = pd.to_numeric(df['Beta'],errors ='coerce')
engine = create_engine('mysql+pymysql://root@localhost/fintech')
df.to_sql('sp500', con=engine, if_exists='replace', index=False)
print(df['MarketCap'].head(10))



# print(df.dtypes)


# negitive_change_day = df[df['Change_1D'] <= -0.02]
# positive_change_month = df[df['Change_1M'] >= 0.01]
# stocks_to_buy = df[(df['Change_1D'] <= -0.02) & (df['Change_1M'] >= 0.01)]
# # print(stocks_to_buy)
# print(stocks_to_buy[['Ticker','Price']])