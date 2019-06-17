KLkNN <- function(x,y,K, bits = TRUE, method = "chebyshev"){
  # load library for knn calculation
  library('KernelKnn')
  # put x and y into data frames
    x <- data.frame(x); y <- data.frame(y)
  # calculate number of observations of x and y  
  Nx <- nrow(x)
  Ny <- nrow(y)
  if (Nx == Ny){# only calculate MI if x and y have same number of observations
    DX <-  knn.index.dist(data.frame(x), TEST_data = NULL, k = Nx-1, method = method, threads = 4, transf_categ_cols = F);
    DY <-  knn.index.dist(data.frame(y), TEST_data = NULL, k = Nx-1, method = method, threads = 4, transf_categ_cols = F);
    DXY <- knn.index.dist(cbind(x,y)   , TEST_data = NULL, k = K,    method = method, threads = 4, transf_categ_cols = F);
    newVar <- digamma(K) + digamma(Nx) - mean(digamma(rowSums(DX$train_knn_dist < DXY$train_knn_dist[,K])) + digamma(rowSums(DY$train_knn_dist < DXY$train_knn_dist[,K])))
    if (bits == TRUE){ # convert MI to bit (DEFAULT)
      newVar <- newVar/log(2) # convert output to bits
    }
    return(newVar)
  } else { # output error message if number of observations is different
    warning("Variables do not have same number of observations")
  }
}