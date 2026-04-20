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
# print(df['MarketCap'].head(10))


buy_dips = pd.read_sql("SELECT Ticker , AVG(Price) FROM sp500 WHERE Change_1D < -0.02 AND Change_1M > 0.01 GROUP BY Ticker",con=engine)
avg_price_sector = pd.read_sql("SELECT Sector, AVG(Price), AVG(Change_1M) FROM sp500 GROUP BY Sector",con=engine)
top_marketcap = pd.read_sql("SELECT Ticker, Company, MarketCap FROM sp500 ORDER BY MarketCap DESC LIMIT 10",con= engine)
with pd.ExcelWriter('/Users/dean/Desktop/Quota/fintech/s&p_500_analysis.xlsx') as writer:
    buy_dips.to_excel(writer,sheet_name='Buy Dips',index=False)
    avg_price_sector.to_excel(writer,sheet_name='Avg Price per Sector',index=False)
    top_marketcap.to_excel(writer,sheet_name='Top Market Cap',index=False)
print('done')

# negitive_change_day = df[df['Change_1D'] <= -0.02]
# positive_change_month = df[df['Change_1M'] >= 0.01]
# stocks_to_buy = df[(df['Change_1D'] <= -0.02) & (df['Change_1M'] >= 0.01)]
# # print(stocks_to_buy)
# print(stocks_to_buy[['Ticker','Price']])