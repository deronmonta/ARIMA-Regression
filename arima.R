

library("xlsx")
library("ggplot2")
library("forecast")
library("cowplot")


tsSales = read.xlsx('/home/la-haoyuy/Documents/data-for-r-2-copy.xlsx',sheetIndex = 2,header=TRUE) # Read the second sheet for time series data
tsSales$NA. <-NULL
tsSales <- ts(tsSales)# Transform to time series data

lamdaX <- BoxCox.lambda(tsSales)
fitX_ARIMA <- auto.arima(tsSales[1,], lambda = lamdaX, D = 1)

fcstX_ARIMA <- forecast(fitX_ARIMA, h = 5) 
write.csv(as.data.frame(fcstX_ARIMA), " fcstX_ARIMA.csv")

plotFcstARIMA <- autoplot(fcstX_ARIMA, ylab = "Sales Volume of X") + theme(legend.position = "bottom", plot.title = element_text(hjust = 0.5))
