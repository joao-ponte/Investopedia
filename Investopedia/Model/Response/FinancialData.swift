//
//  FinancialData.swift
//  Investopedia
//
//  Created by João Ponte on 25/08/2023.
//

import Foundation

class FinancialData {
    
    let dictionaryJson = """
{
  "dictionary": [
    {
      "id": 1,
      "word": "Asset",
      "meaning": "Anything of value that is owned or controlled by a person, organisation, or company.",
      "example": "Cash, inventory, land, buildings, equipment, investments, patents, trademarks."
    },
    {
      "id": 2,
      "word": "Liability",
      "meaning": "A financial obligation or debt owed by an individual, organisation, or company.",
      "example": "Bank loans, outstanding bills, mortgages, salaries payable, taxes payable."
    },
    {
      "id": 3,
      "word": "Equity",
      "meaning": "The ownership interest in a company or property after deducting liabilities.",
      "example": "Common stock, retained earnings, capital contributed by shareholders."
    },
    {
      "id": 4,
      "word": "Revenue",
      "meaning": "The total income generated from the sale of goods, provision of services, or other business activities before deducting expenses or costs.",
      "example": "Sales revenue from selling products, service fees earned, rental income."
    },
    {
      "id": 5,
      "word": "Expense",
      "meaning": "The costs incurred in the process of generating revenue or conducting business operations.",
      "example": "Salaries and wages, rent expense, utilities expense, advertising expenses."
    },
    {
      "id": 6,
      "word": "Profit",
      "meaning": "The financial gain achieved when revenue exceeds expenses.",
      "example": "If a business has $100,000 in revenue and $80,000 in expenses, the profit would be $20,000."
    },
    {
      "id": 7,
      "word": "Loss",
      "meaning": "The financial deficit that occurs when expenses exceed revenue.",
      "example": "If a business has $50,000 in revenue and $60,000 in expenses, the loss would be $10,000."
    },
    {
      "id": 8,
      "word": "Balance Sheet",
      "meaning": "A financial statement that provides a snapshot of a company's assets, liabilities, and shareholder's equity at a specific point in time.",
      "example": "A company's balance sheet shows its cash balances, accounts receivable, accounts payable, long-term debt, and shareholders' equity."
    },
    {
      "id": 9,
      "word": "Income Statement",
      "meaning": "A financial statement that summarises a company's revenue, expenses, and net income over a specific period of time.",
      "example": "An income statement shows a company's sales revenue, cost of goods sold, operating expenses, and net income."
    },
    {
      "id": 10,
      "word": "Cash Flow Statement",
      "meaning": "A financial statement that shows the inflows and outflows of cash from operating, investing, and financing activities.",
      "example": "A cash flow statement includes cash received from customers, cash used for capital expenditures, and cash obtained from borrowing."
    },
    {
      "id": 11,
      "word": "Gross Margin",
      "meaning": "The difference between revenue and the cost of goods sold, indicating the profitability of a company's core operations.",
      "example": "If a company generates $100,000 in revenue and incurs $60,000 in production costs, the gross margin would be $40,000."
    },
    {
      "id": 12,
      "word": "Net Margin",
      "meaning": "The ratio of net income to revenue, indicating the profitability of a company after considering all expenses.",
      "example": "If a company has a net income of $30,000 and revenue of $200,000, the net margin would be 15%."
    },
    {
      "id": 13,
      "word": "Return on Investment (ROI)",
      "meaning": "A measure of the profitability or efficiency of an investment, expressed as a percentage.",
      "example": "If an investor spends $10,000 on a stock and sells it for $12,000, the ROI would be 20%."
    },
    {
      "id": 14,
      "word": "Return on Equity (ROE)",
      "meaning": "A measure of the profitability and efficiency of a company in generating returns for its shareholders based on the shareholders' equity.",
      "example": "If a company has a net income of $500,000 and total shareholders' equity of $2,000,000, the ROE would be 25%."
    },
    {
      "id": 15,
      "word": "Return on Assets (ROA)",
      "meaning": "A measure of how effectively a company utilises its assets to generate profits.",
      "example": "If a company has a net income of $1,000,000 and total assets of $10,000,000, the ROA would be 10%."
    },
    {
      "id": 16,
      "word": "Earnings Per Share (EPS)",
      "meaning": "A financial metric that represents the portion of a company's profit allocated to each outstanding share of common stock.",
      "example": "If a company has a net income of $5,000,000 and 1,000,000 shares of common stock outstanding, the EPS would be $5.00 per share."
    },
    {
      "id": 17,
      "word": "Dividend",
      "meaning": "A payment made by a corporation to its shareholders as a distribution of profits.",
      "example": "If a company declares a dividend of $1.00 per share and an investor owns 100 shares, they would receive a dividend payment of $100."
    },
    {
      "id": 18,
      "word": "Dividend Yield",
      "meaning": "A financial ratio that indicates the dividend return as a percentage of the current stock price.",
      "example": "If a stock has an annual dividend of $2.00 per share and the current stock price is $40.00 per share, the dividend yield would be 5% (2.00 / 40.00 * 100)."
    },
    {
      "id": 19,
      "word": "Market Capitalization",
      "meaning": "The total value of a company's outstanding shares of stock, calculated by multiplying the current stock price by the total number of shares.",
      "example": "If a company has 10,000,000 shares of stock outstanding and the current stock price is $50.00 per share, the market capitalisation would be $500,000,000 (10,000,000 * 50.00)."
    },
    {
      "id": 20,
      "word": "Stock Price",
      "meaning": "The current price at which a single share of a company's stock is traded on the stock market.",
      "example": "If a company's stock is currently trading at $100.00 per share, the stock price would be $100.00."
    },
    {
      "id": 21,
      "word": "Bond",
      "meaning": "A debt instrument issued by a company, municipality, or government entity to borrow funds from investors for a specified period, with periodic interest payments and repayment of the principal amount at maturity.",
      "example": "A company may issue a 5-year bond with a face value of $10,000 and an annual interest rate of 5%, paying $500 in interest per year until maturity."
    },
    {
      "id": 22,
      "word": "Mutual Fund",
      "meaning": "An investment vehicle that pools money from multiple investors to invest in a diversified portfolio of stocks, bonds, or other securities, managed by professional fund managers.",
      "example": "An investor may invest in a mutual fund that holds a mix of stocks, bonds, and other assets, with the goal of diversifying their investment and potentially generating returns."
    },
    {
      "id": 23,
      "word": "ETF (Exchange-Traded Fund)",
      "meaning": "An investment fund traded on stock exchanges, representing a basket of underlying assets such as stocks, bonds, or commodities.",
      "example": "An ETF may track an index, allowing investors to invest in a diversified portfolio of securities that mirror the index's performance."
    },
    {
      "id": 24,
      "word": "Index Fund",
      "meaning": "A type of mutual fund or ETF that aims to replicate the performance of a specific market index, such as the S&P 500 or Dow Jones Industrial Average.",
      "example": "An index fund may hold a proportional representation of the stocks in a particular index, providing investors with broad market exposure."
    },
    {
      "id": 25,
      "word": "Stock Exchange",
      "meaning": "A regulated marketplace where stocks, bonds, and other securities are bought and sold.",
      "example": "The New York Stock Exchange (NYSE) and Nasdaq are examples of stock exchanges where investors can trade stocks."
    },
    {
      "id": 26,
      "word": "Bull Market",
      "meaning": "A market condition characterised by a sustained rise in stock prices, generally associated with optimism, positive investor sentiment, and economic growth.",
      "example": "During a bull market, stock prices may experience a significant upward trend over an extended period, leading to overall market gains."
    },
    {
      "id": 27,
      "word": "Bear Market",
      "meaning": "A market condition characterised by a sustained decline in stock prices, generally associated with pessimism, negative investor sentiment, and economic downturns.",
      "example": "During a bear market, stock prices may experience a significant downward trend over an extended period, resulting in overall market losses."
    },
    {
      "id": 28,
      "word": "Volatility",
      "meaning": "A measure of the degree of variation or fluctuation in the price or value of a financial instrument, indicating the potential for rapid and significant price changes.",
      "example": "A highly volatile stock may experience large price swings within short periods, indicating higher risk and potential opportunities for traders."
    },
    {
      "id": 29,
      "word": "Risk",
      "meaning": "The probability or potential for loss or unfavourable outcomes associated with an investment or business decision.",
      "example": "Various risks in investments include market risk, credit risk, liquidity risk, and operational risk, among others."
    },
    {
      "id": 30,
      "word": "Diversification",
      "meaning": "A risk management strategy that involves spreading investments across different assets, sectors, or geographical regions to reduce exposure to any single investment and minimise overall risk.",
      "example": "An investor may diversify their portfolio by investing in a mix of stocks, bonds, real estate, and commodities to achieve a balance and reduce the impact of any specific investment's performance."
    },
    {
      "id": 31,
      "word": "Portfolio",
      "meaning": "A collection of investments, such as stocks, bonds, and other financial assets, held by an individual or entity.",
      "example": "An investor's portfolio may include stocks from various industries, government bonds, real estate investment trusts (REITs), and mutual funds."
    },
    {
      "id": 32,
      "word": "Asset Allocation",
      "meaning": "The process of dividing an investment portfolio among different asset classes, such as stocks, bonds, and cash, to achieve a desired risk-return balance.",
      "example": "An investor may allocate 60% of their portfolio to stocks, 30% to bonds, and 10% to cash or other low-risk investments."
    },
    {
      "id": 33,
      "word": "Capital Gains",
      "meaning": "The profits earned from the sale of a capital asset, such as stocks, real estate, or other investments, that have increased in value since their purchase.",
      "example": "If an investor buys a stock for $50 and later sells it for $75, the capital gain would be $25."
    },
    {
      "id": 34,
      "word": "Capital Losses",
      "meaning": "The losses incurred from the sale of a capital asset for less than its purchase price.",
      "example": "If an investor buys a stock for $100 and later sells it for $80, the capital loss would be $20."
    },
    {
      "id": 35,
      "word": "Inflation",
      "meaning": "The sustained increase in the general price level of goods and services in an economy over time, eroding the purchasing power of money.",
      "example": "If the inflation rate is 2%, it means that prices, on average, are increasing by 2% annually."
    },
    {
      "id": 36,
      "word": "Deflation",
      "meaning": "The sustained decrease in the general price level of goods and services in an economy over time, resulting in increased purchasing power of money.",
      "example": "During deflation, prices of goods and services may decrease, leading to a situation where consumers can buy more with the same amount of money."
    },
    {
      "id": 37,
      "word": "Interest Rate",
      "meaning": "The percentage charged or paid on the borrowed or invested amount of money, usually expressed as an annual rate.",
      "example": "A bank may offer a mortgage with an interest rate of 4%, meaning that the borrower will pay 4% of the loan amount as interest annually."
    },
    {
      "id": 38,
      "word": "Compound Interest",
      "meaning": "The interest earned on both the initial principal amount and any accumulated interest from previous periods.",
      "example": "If an individual invests $1,000 at an annual compound interest rate of 5%, the interest earned in the first year would be $50, and the following year's interest would be calculated based on the new principal of $1,050."
    },
    {
      "id": 39,
      "word": "Stock Market",
      "meaning": "A marketplace where shares of publicly traded companies are bought and sold, facilitating investment and capital raising.",
      "example": "Major stock markets include the New York Stock Exchange (NYSE), Nasdaq, London Stock Exchange (LSE), and Tokyo Stock Exchange (TSE)."
    },
    {
      "id": 40,
      "word": "Bond Market",
      "meaning": "A marketplace where debt securities, such as government bonds and corporate bonds, are bought and sold by investors.",
      "example": "The bond market enables governments and corporations to raise funds by issuing bonds that investors can purchase."
    },
    {
      "id": 41,
      "word": "Financial Analyst",
      "meaning": "A professional who evaluates financial data, analyses investment opportunities, and provides insights and recommendations to individuals or organisations.",
      "example": "A financial analyst may assess a company's financial statements, industry trends, and economic factors to provide investment recommendations."
    },
    {
      "id": 42,
      "word": "Investment Banker",
      "meaning": "A professional who works for an investment bank and advises corporations, governments, or institutional clients on various financial transactions, such as mergers and acquisitions, underwriting securities, and capital raising activities.",
      "example": "An investment banker may assist a company in issuing new shares of stock through an initial public offering (IPO) or advise on a merger and acquisition deal."
    },
    {
      "id": 43,
      "word": "Hedge Fund",
      "meaning": "An investment fund that pools capital from accredited investors and uses various strategies, including leverage and derivatives, to generate returns.",
      "example": "A hedge fund may employ strategies such as long/short equity, global macro, or event-driven investing to generate alpha and potentially deliver higher returns."
    },
    {
      "id": 44,
      "word": "Options",
      "meaning": "Financial derivatives that give the holder the right, but not the obligation, to buy or sell an underlying asset at a predetermined price within a specified period.",
      "example": "A call option gives the holder the right to buy 100 shares of a stock at a predetermined price, while a put option gives the holder the right to sell 100 shares of a stock at a predetermined price."
    },
    {
      "id": 45,
      "word": "Futures",
      "meaning": "Financial contracts that obligate the buyer to purchase or the seller to sell an asset at a predetermined price on a future date.",
      "example": "A futures contract for crude oil might specify the purchase or sale of 1,000 barrels of oil at a set price to be delivered in a specific month."
    },
    {
      "id": 46,
      "word": "IPO (Initial Public Offering)",
      "meaning": "The process through which a private company offers its shares to the public for the first time, allowing it to raise capital and become a publicly traded company.",
      "example": "When a company decides to go public, it may issue shares to investors through an IPO, enabling them to buy and sell the company's stock on a stock exchange."
    },
    {
      "id": 47,
      "word": "Mergers and Acquisitions (M&A)",
      "meaning": "The consolidation of companies through various transactions such as mergers, acquisitions, or takeovers, resulting in the combination of assets, operations, and ownership.",
      "example": "Company A acquiring Company B through a merger, where the two companies integrate their operations and become a single entity."
    },
    {
      "id": 48,
      "word": "Valuation",
      "meaning": "The process of determining the economic value of an asset, company, investment, or financial instrument.",
      "example": "Conducting a valuation of a company may involve analysing its financial statements, market position, cash flows, and comparable transactions to estimate its worth."
    },
    {
      "id": 49,
      "word": "Price-to-Earnings (P/E) Ratio",
      "meaning": "A valuation ratio that measures the price investors are willing to pay for each dollar of earnings generated by a company.",
      "example": "If a company's stock price is $50 per share, and its earnings per share (EPS) is $5, the P/E ratio would be 10x ($50 / $5)."
    },
    {
      "id": 50,
      "word": "Debt-to-Equity Ratio",
      "meaning": "A financial ratio that compares a company's total debt to its shareholders' equity, indicating the proportion of debt financing relative to equity financing.",
      "example": "If a company has total debt of $1,000,000 and shareholders' equity of $500,000, the debt-to-equity ratio would be 2:1 ($1,000,000 / $500,000)."
    },
    {
      "id": 51,
      "word": "Liquidity",
      "meaning": "The ability of an asset, security, or market to be easily bought or sold without causing significant price changes or affecting its value.",
      "example": "Cash is considered the most liquid asset since it can be readily used for transactions, while real estate is less liquid due to longer selling periods."
    },
    {
      "id": 52,
      "word": "Solvency",
      "meaning": "The ability of a company to meet its long-term financial obligations and remain financially stable in the long run.",
      "example": "A company is considered solvent if its assets exceed its liabilities, indicating it has the capacity to settle its debts as they become due."
    },
    {
      "id": 53,
      "word": "Cash Flow",
      "meaning": "The movement of money into or out of a business, reflecting the inflows and outflows of cash resulting from operating activities, investing activities, and financing activities.",
      "example": "Positive cash flow occurs when a business receives more cash inflows than outflows, while negative cash flow indicates more cash outflows than inflows."
    },
    {
      "id": 54,
      "word": "Working Capital",
      "meaning": "The difference between a company's current assets (e.g., cash, accounts receivable) and its current liabilities (e.g., accounts payable, short-term debt), representing the funds available for day-to-day operations.",
      "example": "If a company has current assets of $500,000 and current liabilities of $300,000, the working capital would be $200,000 ($500,000 - $300,000)."
    },
    {
      "id": 55,
      "word": "Free Cash Flow",
      "meaning": "The cash generated by a business after accounting for capital expenditures necessary to maintain or expand its asset base.",
      "example": "If a company has $1,000,000 in cash from operations and spends $300,000 on capital expenditures, the free cash flow would be $700,000."
    },
    {
      "id": 56,
      "word": "Treasury Stock",
      "meaning": "Shares of a company's own stock that it has repurchased and holds in its treasury.",
      "example": "A company may buy back its own shares on the open market, reducing the number of outstanding shares and potentially increasing the ownership stake of remaining shareholders."
    },
    {
      "id": 57,
      "word": "Capital Expenditure",
      "meaning": "The funds invested by a company in long-term assets, such as property, plant, equipment, or other fixed assets, to support its operations and generate future benefits.",
      "example": "A manufacturing company investing in new machinery or a retail company renovating its store locations would incur capital expenditures."
    },
    {
      "id": 58,
      "word": "Depreciation",
      "meaning": "The systematic allocation of the cost of a tangible asset over its useful life to reflect the wear and tear, obsolescence, or decrease in value over time.",
      "example": "A company purchasing a delivery vehicle for $50,000 and depreciating it over 5 years would expense $10,000 per year as depreciation."
    },
    {
      "id": 59,
      "word": "Amortisation",
      "meaning": "The gradual reduction of an intangible asset's cost over its useful life, such as patents, copyrights, or trademarks.",
      "example": "A company acquiring a patent for $100,000 and amortising it over 10 years would expense $10,000 per year as amortisation."
    },
    {
      "id": 60,
      "word": "Audit",
      "meaning": "A systematic examination and verification of a company's financial records, transactions, and statements by an independent auditor to ensure accuracy, compliance, and reliability.",
      "example": "A certified public accountant (CPA) conducting an audit of a company's financial statements to express an opinion on their fairness and compliance with accounting principles."
    },
    {
      "id": 61,
      "word": "Compliance",
      "meaning": "The adherence to laws, regulations, standards, and ethical practices relevant to a specific industry or jurisdiction.",
      "example": "A company ensuring it complies with tax laws, labour regulations, environmental standards, and industry-specific regulations to avoid penalties and maintain legal and ethical practices."
    },
    {
      "id": 62,
      "word": "Financial Planning",
      "meaning": "The process of setting and achieving financial goals through the assessment of an individual's or organisation's current financial situation, creating a plan, and implementing strategies to meet those goals.",
      "example": "Creating a budget, saving for retirement, investing in diversified assets, and planning for major expenses like buying a house are part of financial planning."
    },
    {
      "id": 63,
      "word": "Risk Management",
      "meaning": "The identification, assessment, and mitigation of potential risks that could impact an individual's or organisation's financial goals by implementing strategies to minimise, avoid, or transfer those risks.",
      "example": "Purchasing insurance to protect against property damage or liability claims, diversifying investment portfolios, and implementing internal controls to prevent fraud are risk management practices."
    },
    {
      "id": 64,
      "word": "Corporate Governance",
      "meaning": "The system of rules, practices, and processes by which a company is directed, controlled, and operated to ensure accountability, transparency, and protection of stakeholders' interests.",
      "example": "Establishing a board of directors, defining roles and responsibilities, and implementing policies and procedures for ethical conduct and financial reporting are key aspects of corporate governance."
    },
    {
      "id": 65,
      "word": "Corporate Social Responsibility (CSR)",
      "meaning": "The commitment of a company to operate in an ethical and sustainable manner by considering the social, environmental, and economic impacts of its actions and taking responsibility for them.",
      "example": "Implementing environmentally friendly practices, supporting community initiatives, ensuring fair labour practices, and promoting diversity and inclusion are CSR efforts."
    },
    {
      "id": 66,
      "word": "Insider Trading",
      "meaning": "The illegal practice of trading stocks or other securities based on material, non-public information that is not available to the general public.",
      "example": "If an executive of a company purchases shares of the company's stock based on confidential information about a forthcoming positive earnings report, it would be considered insider trading."
    },
    {
      "id": 67,
      "word": "Initial Margin",
      "meaning": "The amount of funds or collateral required by a broker or exchange to initiate a leveraged investment position, such as trading futures or options.",
      "example": "If an investor wants to trade futures contracts, they may be required to deposit an initial margin amount, typically a percentage of the total contract value, with the broker."
    },
    {
      "id": 68,
      "word": "Maintenance Margin",
      "meaning": "The minimum amount of funds or collateral that must be maintained in a leveraged investment account to avoid a margin call or liquidation of positions.",
      "example": "If the value of investments in a margin account falls below the maintenance margin level, the investor may need to deposit additional funds to meet the requirement."
    },
    {
      "id": 69,
      "word": "Stop-Loss Order",
      "meaning": "An order placed by an investor to sell a security automatically if it reaches a predetermined price level, limiting potential losses.",
      "example": "An investor may set a stop-loss order at $50 for a stock they purchased at $60, meaning that if the stock price falls to $50, it will be sold to prevent further losses."
    },
    {
      "id": 70,
      "word": "Limit Order",
      "meaning": "An order placed by an investor to buy or sell a security at a specified price or better.",
      "example": "If a stock is trading at $100, an investor may place a limit order to buy it at $95 or less, specifying the maximum price they are willing to pay."
    },
    {
      "id": 71,
      "word": "Market Order",
      "meaning": "An order placed by an investor to buy or sell a security at the current market price.",
      "example": "If an investor wants to sell a stock immediately and is willing to accept the prevailing market price, they can place a market order to sell the stock."
    },
    {
      "id": 72,
      "word": "Short Selling",
      "meaning": "The practice of selling borrowed securities with the expectation that their price will decline, allowing the seller to buy them back at a lower price in the future and profit from the difference.",
      "example": "An investor borrows shares of a company from a broker and sells them at $100 per share. If the price later drops to $80, the investor can buy back the shares at the lower price, return them to the broker, and pocket the $20 difference."
    },
    {
      "id": 73,
      "word": "Fundamental Analysis",
      "meaning": "The evaluation of a company's financial statements, industry trends, management, competitive position, and other fundamental factors to assess its intrinsic value and make investment decisions.",
      "example": "Analysing a company's revenue growth, profitability ratios, debt levels, and competitive advantages to determine its financial health and investment potential is fundamental analysis."
    },
    {
      "id": 74,
      "word": "Technical Analysis",
      "meaning": "The evaluation of historical price and volume data, chart patterns, and other market indicators to forecast future price movements and make investment decisions.",
      "example": "Using trend lines, moving averages, and other technical indicators to identify patterns and trends in stock prices and determine potential buy or sell signals."
    },
    {
      "id": 75,
      "word": "EBITDA (Earnings Before Interest, Taxes, Depreciation, and Amortisation)",
      "meaning": "A measure of a company's operating performance that reflects its profitability before deducting interest, taxes, depreciation, and amortisation expenses.",
      "example": "If a company has $10 million in revenue, $2 million in operating expenses, $1 million in depreciation, and no interest or taxes, the EBITDA would be $7 million."
    },
    {
      "id": 76,
      "word": "Gross Domestic Product (GDP)",
      "meaning": "The monetary value of all final goods and services produced within a country's borders during a specific period, typically a year.",
      "example": "If a country's GDP is $1 trillion, it represents the total value of goods and services produced within the country's economy in that year."
    },
    {
      "id": 77,
      "word": "Consumer Price Index (CPI)",
      "meaning": "A measure of the average change in prices of a basket of goods and services consumed by households, used to gauge inflation or deflation.",
      "example": "If the CPI increases by 2% in a year, it indicates that the average prices of goods and services included in the CPI basket have risen by 2%."
    },
    {
      "id": 78,
      "word": "Producer Price Index (PPI)",
      "meaning": "A measure of the average change in prices received by domestic producers for their output over time, used to track inflationary pressures in the production process.",
      "example": "An increase in the PPI for raw materials suggests rising costs for producers, which may lead to higher consumer prices in the future."
    },
    {
      "id": 79,
      "word": "Treasury Bond",
      "meaning": "A debt security issued by the government to finance its borrowing needs, typically with a fixed interest rate and a maturity of more than 10 years.",
      "example": "The U.S. Treasury issues Treasury bonds, also known as T-bonds, which are backed by the full faith and credit of the U.S. government and are considered relatively safe investments."
    },
    {
      "id": 80,
      "word": "Junk Bond",
      "meaning": "A high-yield, speculative bond issued by a company with a lower credit rating, indicating a higher risk of default.",
      "example": "Company X issues bonds with a credit rating below investment grade (BB or lower), offering higher interest rates to compensate investors for the higher risk associated with investing in junk bonds."
    },
    {
      "id": 81,
      "word": "Blue Chip Stocks",
      "meaning": "Shares of well-established, financially stable companies with a long track record of reliable performance and often considered safe investments.",
      "example": "Stocks of companies like Apple, Microsoft, or Coca-Cola, which are leaders in their respective industries and have a history of stable earnings and dividend payments, are considered blue-chip stocks."
    },
    {
      "id": 82,
      "word": "Growth Stocks",
      "meaning": "Stocks of companies that are expected to grow at an above-average rate compared to the overall market, often characterised by higher earnings growth rates.",
      "example": "Technology companies in emerging industries, such as electric vehicles or cloud computing, that have strong revenue and earnings growth prospects are considered growth stocks."
    },
    {
      "id": 83,
      "word": "Value Stocks",
      "meaning": "Stocks that are believed to be undervalued or trading at a price lower than their intrinsic value, presenting an opportunity for potential gains.",
      "example": "Stocks of mature companies with stable earnings, trading at a low price-to-earnings (P/E) ratio or below their book value, are considered value stocks."
    },
    {
      "id": 84,
      "word": "Dividend Stocks",
      "meaning": "Stocks of companies that regularly distribute a portion of their profits to shareholders in the form of dividends.",
      "example": "Companies like Johnson & Johnson or Procter & Gamble, which have a history of paying consistent dividends, are considered dividend stocks."
    },
    {
      "id": 85,
      "word": "Beta",
      "meaning": "A measure of a stock's volatility in relation to the overall market, indicating the sensitivity of the stock's price movements to market fluctuations.",
      "example": "A stock with a beta of 1 indicates that its price tends to move in line with the market, while a beta greater than 1 suggests the stock is more volatile than the market, and a beta less than 1 indicates lower volatility."
    },
    {
      "id": 86,
      "word": "Alpha",
      "meaning": "A measure of an investment's excess return relative to its expected return, indicating the investment manager's skill in generating returns above the market benchmark.",
      "example": "If an investment portfolio generates a return of 12% while the benchmark index returns 10%, the portfolio's alpha would be +2%."
    },
    {
      "id": 87,
      "word": "Efficient Market Hypothesis (EMH)",
      "meaning": "A theory that states that financial markets are efficient and that prices fully reflect all available information, making it difficult to consistently outperform the market.",
      "example": "According to EMH, it would be challenging to consistently beat the market by identifying mispriced securities because all relevant information is already incorporated into stock prices."
    },
    {
      "id": 88,
      "word": "Capital Asset Pricing Model (CAPM)",
      "meaning": "A financial model that estimates the expected return of an investment based on its systematic risk (beta) and the risk-free rate of return.",
      "example": "CAPM uses a formula to calculate the required return on an investment by considering the risk-free rate, market risk premium, and the beta of the investment."
    },
    {
      "id": 89,
      "word": "Black-Scholes Model",
      "meaning": "A mathematical model used to calculate the theoretical price of options, taking into account factors such as the current stock price, strike price, time to expiration, interest rates, and volatility.",
      "example": "The Black-Scholes model is commonly used by options traders and investors to determine fair values for options contracts."
    },
    {
      "id": 90,
      "word": "Yield Curve",
      "meaning": "A graphical representation of interest rates for bonds of varying maturities, showing the relationship between the yield (or interest rate) and the time to maturity.",
      "example": "A normal yield curve slopes upward, indicating that longer-term bonds have higher yields than shorter-term bonds. In contrast, an inverted yield curve slopes downward, indicating that shorter-term bonds have higher yields than longer-term bonds."
    },
    {
      "id": 92,
      "word": "Financial Leverage",
      "meaning": "The use of borrowed funds or debt to finance investments, with the aim of magnifying returns and potentially increasing profits or losses.",
      "example": "A company is borrowing funds to expand its operations or make acquisitions, with the expectation that the returns generated from the investments will exceed the cost of borrowing."
    },
    {
      "id": 93,
      "word": "Operating Leverage",
      "meaning": "The degree to which a company's fixed costs and variable costs affect its operating income or earnings before interest and taxes (EBIT).",
      "example": "A company with high fixed costs and low variable costs has high operating leverage, meaning small changes in sales can have a significant impact on its profitability."
    },
    {
      "id": 94,
      "word": "WACC (Weighted Average Cost of Capital)",
      "meaning": "The average rate of return required by a company to finance its operations and investments, taking into account the cost of debt and equity capital weighted by their respective proportions in the company's capital structure.",
      "example": "WACC is used to determine the minimum acceptable return on investments and helps in evaluating the feasibility of projects or acquisitions."
    },
    {
      "id": 95,
      "word": "IPO Underwriter",
      "meaning": "A financial institution or investment bank that facilitates the initial public offering (IPO) process by acting as an intermediary between the issuing company and the investing public.",
      "example": "An IPO underwriter helps the company determine the offering price, prepares the necessary documents, coordinates with regulatory authorities, and markets the IPO to potential investors."
    },
    {
      "id": 96,
      "word": "Credit Rating",
      "meaning": "An assessment of the creditworthiness of a company or issuer of debt securities, indicating the likelihood of timely repayment of principal and interest.",
      "example": "Credit rating agencies such as Moody's, Standard & Poor's (S&P), and Fitch assign ratings such as AAA, BBB, or D to indicate the credit quality of bonds or issuers."
    },
    {
      "id": 97,
      "word": "Price-Earnings-to-Growth (PEG) Ratio",
      "meaning": "A valuation ratio that compares a company's price-to-earnings (P/E) ratio with its expected earnings growth rate, providing a measure of a stock's relative value in relation to its growth prospects.",
      "example": "A PEG ratio of less than 1 suggests that a stock may be undervalued relative to its growth potential, while a PEG ratio greater than 1 indicates potential overvaluation."
    },
    {
      "id": 98,
      "word": "Cost of Goods Sold (COGS)",
      "meaning": "The direct costs incurred in producing or acquiring the goods or services sold by a company, including the cost of raw materials, direct labour, and manufacturing overhead.",
      "example": "In a manufacturing company, COGS includes the cost of raw materials used to produce finished goods, direct labour costs, and any other directly attributable production costs."
    },
    {
      "id": 99,
      "word": "401(k)",
      "meaning": "A retirement savings plan offered by employers in the United States, allowing employees to contribute a portion of their salary to a tax-advantaged investment account for retirement.",
      "example": "An employee may contribute a percentage of their salary, such as 5%, to their 401(k) account, with the employer potentially matching a portion of the contribution."
    },
    {
      "id": 100,
      "word": "Roth IRA",
      "meaning": "An individual retirement account (IRA) that allows individuals to contribute after-tax income, with qualified withdrawals in retirement being tax-free.",
      "example": "An individual may contribute up to a certain annual limit to a Roth IRA using funds that have already been taxed, and any earnings generated within the account can be withdrawn tax-free in retirement."
    },
    {
      "id": 101,
      "word": "Corporate Bond",
      "meaning": "A debt security issued by a corporation to raise capital, typically paying periodic interest to bondholders and returning the principal at maturity.",
      "example": "A company might issue corporate bonds with a face value of $1,000 and a fixed interest rate, paying interest semi-annually until the bond's maturity date when the principal is returned to the bondholder."
    },
    {
      "id": 102,
      "word": "Callable Bond",
      "meaning": "A bond that can be redeemed or \"called\" by the issuer before its maturity date, often giving the issuer the flexibility to refinance the debt at a lower interest rate.",
      "example": "A company may issue callable bonds with a provision allowing them to redeem the bonds at a specific price before the stated maturity date."
    },
    {
      "id": 103,
      "word": "Intrinsic Value",
      "meaning": "The estimated true value of an asset or investment, based on its underlying characteristics, cash flows, and potential future returns.",
      "example": "An analyst estimating the intrinsic value of a stock may consider factors such as the company's financial performance, growth prospects, and industry comparables to determine its fair value."
    },
    {
      "id": 104,
      "word": "Liquidity Ratio",
      "meaning": "A financial ratio that measures a company's ability to meet its short-term obligations using its most liquid assets.",
      "example": "The current ratio and quick ratio are liquidity ratios that assess a company's ability to cover its current liabilities with its current assets."
    },
    {
      "id": 105,
      "word": "Solvency Ratio",
      "meaning": "A financial ratio that evaluates a company's long-term financial health and its ability to meet its long-term obligations.",
      "example": "The debt-to-equity ratio and interest coverage ratio are solvency ratios that assess a company's long-term debt and its ability to cover interest payments."
    },
    {
      "id": 106,
      "word": "Cash Ratio",
      "meaning": "A liquidity ratio that measures a company's ability to pay off its current liabilities using only its cash and cash equivalents.",
      "example": "If a company has $100,000 in cash and cash equivalents and $200,000 in current liabilities, the cash ratio would be 0.5 ($100,000 / $200,000)."
    },
    {
      "id": 107,
      "word": "Quick Ratio",
      "meaning": "A liquidity ratio that assesses a company's ability to cover its current liabilities with its most liquid assets, excluding inventory.",
      "example": "If a company has $200,000 in current assets, excluding inventory, and $100,000 in current liabilities, the quick ratio would be 2.0 ($200,000 / $100,000)."
    },
    {
      "id": 108,
      "word": "Current Ratio",
      "meaning": "A liquidity ratio that measures a company's ability to cover its current liabilities with its current assets, including inventory.",
      "example": "If a company has $300,000 in current assets, including $100,000 in inventory, and $150,000 in current liabilities, the current ratio would be 2.0 ($300,000 / $150,000)."
    },
    {
      "id": 109,
      "word": "Debt Ratio",
      "meaning": "A financial ratio that measures the proportion of a company's total assets financed by debt.",
      "example": "If a company has $500,000 in total debt and $1,000,000 in total assets, the debt ratio would be 0.5 ($500,000 / $1,000,000)."
    },
    {
      "id": 110,
      "word": "Equity Ratio",
      "meaning": "A financial ratio that measures the proportion of a company's total assets financed by shareholders' equity.",
      "example": "If a company has $400,000 in shareholders' equity and $1,000,000 in total assets, the equity ratio would be 0.4 ($400,000 / $1,000,000)."
    },
    {
      "id": 111,
      "word": "Profit Margin",
      "meaning": "A financial ratio that measures a company's profitability by calculating the percentage of each dollar of revenue that translates into profit.",
      "example": "If a company generates $1,000,000 in revenue and $200,000 in net income, the profit margin would be 20% ($200,000 / $1,000,000)."
    },
    {
      "id": 112,
      "word": "Operating Margin",
      "meaning": "A financial ratio that measures a company's operating efficiency by calculating the percentage of each dollar of revenue remaining after subtracting operating expenses.",
      "example": "If a company generates $1,000,000 in revenue and $400,000 in operating expenses, the operating margin would be 60% ($600,000 / $1,000,000)."
    },
    {
      "id": 113,
      "word": "Gross Margin",
      "meaning": "A financial ratio that measures a company's profitability by calculating the percentage of each dollar of revenue remaining after subtracting the cost of goods sold.",
      "example": "If a company generates $1,000,000 in revenue and $600,000 in cost of goods sold, the gross margin would be 40% ($400,000 / $1,000,000)."
    },
    {
      "id": 114,
      "word": "Asset Turnover Ratio",
      "meaning": "A financial ratio that measures a company's efficiency in generating sales revenue from its total assets.",
      "example": "If a company generates $2,000,000 in revenue and has $1,000,000 in total assets, the asset turnover ratio would be 2.0 ($2,000,000 / $1,000,000)."
    },
    {
      "id": 115,
      "word": "Inventory Turnover Ratio",
      "meaning": "A financial ratio that measures how efficiently a company manages and sells its inventory by calculating the number of times inventory is sold and replaced within a specific period.",
      "example": "If a company sells $1,000,000 worth of inventory and has an average inventory balance of $200,000, the inventory turnover ratio would be 5.0 ($1,000,000 / $200,000)."
    },
    {
      "id": 116,
      "word": "Dividend Payout Ratio",
      "meaning": "A financial ratio that measures the proportion of earnings distributed to shareholders in the form of dividends.",
      "example": "If a company has $500,000 in net income and pays $200,000 in dividends, the dividend payout ratio would be 0.4 or 40% ($200,000 / $500,000)."
    },
    {
      "id": 117,
      "word": "FTSE 100",
      "meaning": "The Financial Times Stock Exchange 100 Index, commonly referred to as the FTSE 100, is a market index that represents the performance of the 100 largest publicly traded companies listed on the London Stock Exchange (LSE).",
      "example": "If the FTSE 100 index is at 7,500 points, it means that the combined value of the 100 constituent companies' shares is considered to be at that level."
    },
    {
      "id": 118,
      "word": "London Stock Exchange",
      "meaning": "The London Stock Exchange (LSE) is a stock exchange located in London, England, where buyers and sellers trade various financial instruments, including stocks, bonds, and derivatives.",
      "example": "Companies like BP, HSBC, and Unilever are listed on the London Stock Exchange, and their shares can be bought and sold through the exchange."
    },
    {
      "id": 119,
      "word": "Bank of England",
      "meaning": "The Bank of England is the central bank of the United Kingdom responsible for maintaining monetary stability, issuing currency, regulating banks, and implementing monetary policy.",
      "example": "The Bank of England sets interest rates, such as the base rate, which influence borrowing costs and impact the economy."
    },
    {
      "id": 120,
      "word": "Pound Sterling (GBP)",
      "meaning": "Pound Sterling, often referred to as the British Pound or GBP, is the official currency of the United Kingdom.",
      "example": "If the exchange rate between the pound sterling and the US dollar is 1.4, it means that one pound is equivalent to 1.4 US dollars."
    },
    {
      "id": 121,
      "word": "UK GDP",
      "meaning": "UK GDP (Gross Domestic Product) is a measure of the total value of all goods and services produced within the United Kingdom during a specific period, often used as an indicator of economic growth.",
      "example": "If the UK GDP for a year is £2 trillion, it means that the total economic output within the UK during that period was valued at £2 trillion."
    },
    {
      "id": 122,
      "word": "UK inflation rate",
      "meaning": "The UK inflation rate measures the percentage change in the average price level of goods and services in the United Kingdom over time, reflecting the rate of inflation.",
      "example": "If the UK inflation rate is 2.5%, it means that, on average, prices for goods and services increased by 2.5% over a specific period."
    },
    {
      "id": 123,
      "word": "Financial Conduct Authority (FCA) UK",
      "meaning": "The Financial Conduct Authority (FCA) is the regulatory body responsible for overseeing the conduct of financial firms and markets in the United Kingdom to ensure consumer protection, market integrity, and fair competition.",
      "example": "The FCA sets rules and regulations for financial services companies, such as banks, investment firms, and insurance providers, to ensure they operate ethically and within legal boundaries."
    },
    {
      "id": 124,
      "word": "Financial Services Compensation Scheme (FSCS) UK",
      "meaning": "The Financial Services Compensation Scheme (FSCS) is a UK statutory fund that provides protection to customers of authorised financial services firms in the event of the firm's failure, covering deposits, investments, insurance policies, and other financial products up to specified limits.",
      "example": "If a bank covered by the FSCS fails and is unable to return customers' deposits, the FSCS may compensate eligible depositors up to a certain limit per person."
    },
    {
      "id": 125,
      "word": "Mortgage",
      "meaning": "A mortgage is a loan provided by a lender, typically a bank or financial institution, to finance the purchase of a property, with the property itself serving as collateral for the loan.",
      "example": "A person may take out a mortgage to buy a house, borrowing a specific amount of money from a bank and repaying it over time with interest."
    },
    {
      "id": 126,
      "word": "Pension",
      "meaning": "A pension is a retirement savings plan that individuals contribute to throughout their working years to accumulate funds for retirement income.",
      "example": "An employee may contribute a portion of their salary to a pension plan, and upon reaching retirement age, they can receive regular pension payments based on their accumulated savings."
    },
    {
      "id": 127,
      "word": "ISA (Individual Savings Account) UK",
      "meaning": "An Individual Savings Account (ISA) is a tax-efficient savings and investment account available to UK residents, allowing them to save or invest money without paying tax on the interest, dividends, or capital gains earned.",
      "example": "An individual may open a Cash ISA to save money in a tax-efficient manner, with any interest earned on the savings being tax-free."
    },
    {
      "id": 128,
      "word": "Capital gains tax",
      "meaning": "Capital gains tax is a tax imposed on the profits generated from the sale of certain assets, such as stocks, property, or valuable possessions.",
      "example": "If an individual sells a stock and realises a capital gain of £10,000, they may be required to pay capital gains tax on that amount, subject to applicable exemptions and allowances."
    },
    {
      "id": 129,
      "word": "Stamp duty UK",
      "meaning": "Stamp duty is a tax levied on certain transactions, such as the purchase of property or shares, based on the transaction value.",
      "example": "When buying a property in the UK, the buyer may need to pay stamp duty, the amount of which varies depending on the property value and applicable rates set by the government."
    },
    {
      "id": 130,
      "word": "Bank rate",
      "meaning": "The bank rate, also known as the base rate, is the interest rate at which the Bank of England lends to commercial banks, influencing borrowing costs throughout the economy.",
      "example": "If the Bank of England raises the bank rate, it becomes more expensive for commercial banks to borrow money, which can lead to higher borrowing costs for businesses and consumers."
    },
    {
      "id": 131,
      "word": "Preferred Stock",
      "meaning": "Preferred stock represents a class of ownership in a company that typically has a higher claim on assets and earnings than common stock.",
      "example": "Preferred stockholders have priority over common stockholders in receiving dividends and liquidation proceeds."
    },
    {
      "id": 132,
      "word": "Market Capitalization",
      "meaning": "Market capitalisation, or market cap, is the total value of a company's outstanding shares of stock, calculated by multiplying the stock's current price by the total number of shares.",
      "example": "If a company has 1 million shares outstanding and the stock is trading at $50 per share, the market capitalisation would be $50 million ($50 x 1 million)."
    },
    {
      "id": 133,
      "word": "Stock Split",
      "meaning": "A stock split is a corporate action in which a company divides its existing shares into multiple shares, effectively increasing the number of shares outstanding.",
      "example": "In a 2-for-1 stock split, each existing share is split into two shares, and shareholders receive an additional share for each share they own."
    },
    {
      "id": 134,
      "word": "Dividend Reinvestment Plan (DRIP)",
      "meaning": "A dividend reinvestment plan (DRIP) is a program offered by some companies that allow shareholders to automatically reinvest their cash dividends by purchasing additional shares or fractional shares.",
      "example": "Instead of receiving cash dividends, shareholders in a DRIP receive additional shares, which can compound their investment over time."
    },
    {
      "id": 135,
      "word": "Cyclical Stocks",
      "meaning": "Cyclical stocks are shares of companies whose performance is closely tied to the overall business cycle, with their earnings and stock prices tending to rise and fall in line with economic cycles.",
      "example": "Automobile manufacturers and homebuilders are examples of cyclical stocks."
    },
    {
      "id": 136,
      "word": "Defensive Stocks",
      "meaning": "Defensive stocks refer to shares of companies that are considered relatively resistant to economic downturns, as they provide essential products or services that consumers continue to demand even during recessions.",
      "example": "Companies in industries such as healthcare, utilities, and consumer staples are often considered defensive stocks."
    },
    {
      "id": 137,
      "word": "Value Added Tax (VAT)",
      "meaning": "Value Added Tax (VAT) is a consumption tax imposed on the sale of goods and services in the UK, added at each stage of the supply chain.",
      "example": "When purchasing goods or services subject to VAT, the buyer pays the VAT amount, which is then collected by the seller and remitted to the government."
    },
    {
      "id": 138,
      "word": "Income tax",
      "meaning": "Income tax is a tax imposed on the income earned by individuals, including salaries, wages, and other sources of income.",
      "example": "Individuals in the UK are required to pay income tax on their taxable income, with the tax rates varying based on income brackets and allowances."
    },
    {
      "id": 139,
      "word": "Dividend tax",
      "meaning": "Dividend tax is a tax levied on the income received from dividends distributed by companies to their shareholders.",
      "example": "If an individual receives dividends from their investments, they may be subject to dividend tax, with the rate determined by the individual's income tax bracket."
    },
    {
      "id": 140,
      "word": "Capital gains tax allowance",
      "meaning": "Capital gains tax allowance refers to the tax-free allowance or exemption for capital gains realised from the sale of certain assets within a tax year.",
      "example": "In the UK, individuals have a tax-free capital gains allowance, which means they can realise capital gains up to a certain threshold without being liable for capital gains tax."
    },
    {
      "id": 141,
      "word": "Pensions tax relief UK",
      "meaning": "Pensions tax relief is a tax incentive provided by the government to encourage individuals to save for retirement by offering tax benefits on pension contributions.",
      "example": "When making contributions to a pension scheme, individuals can receive tax relief, whereby their contributions are deducted from their taxable income, reducing their overall tax liability."
    },
    {
      "id": 142,
      "word": "Financial Year UK",
      "meaning": "The financial year, also known as the fiscal year or accounting period, is a specific period used by companies and organisations for financial reporting and tax purposes.",
      "example": "In the UK, the financial year typically runs from April 1st to March 31st of the following year."
    },
    {
      "id": 143,
      "word": "Financial Services Compensation Scheme (FSCS) UK",
      "meaning": "The Financial Services Compensation Scheme (FSCS) is a UK statutory fund that provides protection to customers of authorised financial services firms in the event of the firm's failure, covering deposits, investments, insurance policies, and other financial products up to specified limits.",
      "example": "If a bank covered by the FSCS fails and is unable to return customers' deposits, the FSCS may compensate eligible depositors up to a certain limit per person."
    },
    {
      "id": 144,
      "word": "HM Revenue and Customs (HMRC) UK",
      "meaning": "HM Revenue and Customs (HMRC) is the UK government department responsible for collecting taxes, administering tax-related policies, and enforcing tax regulations.",
      "example": "Individuals and businesses interact with HMRC for various tax-related matters, such as filing tax returns, paying taxes, and seeking guidance on tax obligations."
    },
    {
      "id": 145,
      "word": "Office for National Statistics (ONS) UK",
      "meaning": "The Office for National Statistics (ONS) is the UK's national statistical institute responsible for collecting, analysing, and publishing statistical information about the economy, population, and society.",
      "example": "The ONS provides data on various economic indicators, such as GDP, inflation rates, employment figures, and demographic trends."
    },
    {
      "id": 146,
      "word": "Money Purchase Annual Allowance (MPAA) UK",
      "meaning": "The Money Purchase Annual Allowance (MPAA) is a reduced annual allowance for pension contributions that applies to individuals who have flexibly accessed their defined contribution pension savings.",
      "example": "Once an individual has accessed their pension flexibly, such as by taking a taxable income or withdrawing a lump sum, their MPAA is triggered, and their annual allowance for further pension contributions is reduced."
    },
    {
      "id": 147,
      "word": "Lifetime ISA UK",
      "meaning": "The Lifetime ISA is a savings and investment account available to individuals in the UK that offers a government bonus for those saving towards their first home purchase or retirement.",
      "example": "Individuals can contribute up to a specified annual limit to their Lifetime ISA and receive a government bonus of a certain percentage on their contributions."
    },
    {
      "id": 148,
      "word": "Help to Buy Scheme UK",
      "meaning": "The Help to Buy Scheme is a UK government initiative that aims to help first-time buyers and home movers to purchase a property with a smaller deposit by providing equity loans or mortgage guarantees.",
      "example": "Under the Help to Buy Scheme, eligible individuals can benefit from a government equity loan or mortgage guarantee, making it easier for them to secure a mortgage and buy a home."
    },
    {
      "id": 149,
      "word": "Real Estate Investment Trust (REIT)",
      "meaning": "A Real Estate Investment Trust (REIT) is a company or investment vehicle that owns, operates, or finances income-generating real estate properties, allowing investors to access real estate assets and potential income streams.",
      "example": "Investors can buy shares of a REIT listed on the stock exchange, providing them with exposure to a diversified portfolio of real estate properties, such as commercial buildings, residential complexes, or retail spaces."
    },
    {
      "id": 150,
      "word": "Enterprise Investment Scheme (EIS)",
      "meaning": "The Enterprise Investment Scheme (EIS) is a UK government scheme designed to encourage investment in small, high-risk businesses by offering tax incentives to individual investors.",
      "example": "Investors who contribute funds to eligible EIS companies can benefit from income tax relief, capital gains tax deferral, and capital gains tax exemption if certain conditions are met."
    },
    {
      "id": 151,
      "word": "Seed Enterprise Investment Scheme (SEIS)",
      "meaning": "The Seed Enterprise Investment Scheme (SEIS) is a UK government scheme aimed at promoting investment in early-stage, high-risk startup companies by providing tax incentives to individual investors.",
      "example": "Investors who invest in eligible SEIS companies can benefit from income tax relief, capital gains tax exemptions, and loss relief if the investment fails."
    },
    {
      "id": 152,
      "word": "Small and Medium-sized Enterprises (SMEs) UK",
      "meaning": "Small and Medium-sized Enterprises (SMEs) refer to businesses that fall within a certain size threshold, typically based on factors such as employee count, turnover, or balance sheet total.",
      "example": "SMEs play a crucial role in the UK economy, accounting for a significant portion of employment and contributing to economic growth and innovation."
    },
    {
      "id": 153,
      "word": "Angel Investor",
      "meaning": "An angel investor is an individual who provides capital or funding to startups or early-stage companies in exchange for equity ownership.",
      "example": "Angel investors often support entrepreneurs and startups by providing seed capital, mentorship, and industry expertise to help them grow and succeed."
    },
    {
      "id": 154,
      "word": "Venture Capital",
      "meaning": "Venture capital is a form of private equity investment that provides funding to high-growth potential startups or early-stage companies in exchange for equity ownership.",
      "example": "Venture capital firms invest in promising startups and provide not only financial support but also strategic guidance and industry connections to help them scale and achieve success."
    },
    {
      "id": 155,
      "word": "Crowdfunding",
      "meaning": "Crowdfunding is a method of raising funds from a large number of individuals, typically through online platforms, to finance a project, business venture, or social cause.",
      "example": "Entrepreneurs or creators may use crowdfunding platforms to gather financial support from the public to launch a new product, produce a film, or support a charitable initiative."
    },
    {
      "id": 156,
      "word": "Corporate governance code UK",
      "meaning": "A corporate governance code is a set of principles, guidelines, and best practices that outline the framework for how a company should be directed, managed, and controlled to ensure transparency, accountability, and responsible decision-making.",
      "example": "The UK Corporate Governance Code provides guidelines for listed companies on various aspects, including board composition, executive remuneration, and shareholder rights."
    },
    {
      "id": 157,
      "word": "Accounting Standards UK",
      "meaning": "Accounting Standards refer to a set of principles, rules, and procedures that govern the preparation and presentation of financial statements by companies.",
      "example": "In the UK, companies follow accounting standards set by the Financial Reporting Council (FRC), such as the Generally Accepted Accounting Practice (GAAP), to ensure consistency and comparability in financial reporting."
    },
    {
      "id": 158,
      "word": "Takeover Panel UK",
      "meaning": "The Takeover Panel is an independent regulatory body in the UK responsible for overseeing the rules and procedures relating to takeovers and mergers of public companies.",
      "example": "The Takeover Panel ensures that takeovers and mergers are conducted in a fair and transparent manner, protecting the interests of shareholders and maintaining market integrity."
    },
    {
      "id": 159,
      "word": "Working Tax Credit UK",
      "meaning": "Working Tax Credit is a UK government benefit aimed at providing financial support to low-income individuals or families who are in work but have a low income.",
      "example": "Working Tax Credit is designed to supplement the income of individuals or families on low wages, helping them meet living expenses and support their work."
    },
    {
      "id": 160,
      "word": "Child Tax Credit UK",
      "meaning": "Child Tax Credit is a UK government benefit that provides financial support to families with dependent children, helping with the cost of raising children.",
      "example": "Child Tax Credit is based on various factors, such as the number of children, household income, and individual circumstances, and is aimed at providing assistance to eligible families."
    },
    {
      "id": 161,
      "word": "Inheritance Tax UK",
      "meaning": "Inheritance Tax is a tax imposed on the estate (property, money, and possessions) of a deceased person above a certain threshold, transferred to beneficiaries after their death.",
      "example": "If the total value of an individual's estate exceeds the inheritance tax threshold, currently set at £325,000in the UK, inheritance tax may be payable on the excess amount."
    },
    {
      "id": 162,
      "word": "Private Limited Company (Ltd)",
      "meaning": "A Private Limited Company (Ltd) is a type of company where ownership is limited to a specific number of shareholders, and shares are not publicly traded on a stock exchange.",
      "example": "Private Limited Companies are often used for small to medium-sized businesses and provide limited liability protection to shareholders."
    },
    {
      "id": 163,
      "word": "Financial Reporting Council (FRC)",
      "meaning": "The Financial Reporting Council (FRC) is the UK's independent regulator responsible for promoting high-quality corporate governance, financial reporting, and audit standards.",
      "example": "The FRC sets accounting and auditing standards, oversees the work of professional accountancy and audit bodies, and takes regulatory action when necessary to ensure compliance with standards and regulations."
    }
  ]
}
"""
}