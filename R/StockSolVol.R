StockSolVol <- function(StockSolConc, NewSolConc, NewSolVol) {
  return((NewSolConc*NewSolVol)/StockSolConc)
}