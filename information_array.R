information <- function(data, K = 1, bits = TRUE, entropy = FALSE, method = "chebyshev"){
  # load needed libraries
  library('KernelKnn')
  
  # extract variable numbers and names
  temp <- dim(data)
  nobser <- temp[1]
  nvars <- temp[2]; rm(temp)
  Var_names <- colnames(data)
  
  # create variable for output of information matrix
  information <- array(0, c(nvars,nvars))
  colnames(information) <- Var_names
  rownames(information) <- Var_names
  
  # create variables and save kNN information
  DX <- array(NA, c(nobser,nobser-1,nvars))
  for (i in 1:nvars){
    temp <- knn.index.dist(data.frame(data[i]), 
                           TEST_data = NULL, 
                           k = nobser-1, 
                           method = method, 
                           threads = 4, 
                           transf_categ_cols = F);
    DX[ , ,i] <-  temp$train_knn_dist
    rm(temp)
  }
  
  # calculate MI
  for (i in 1:(nvars-1)){
    for (j in (i+1):nvars){
      DXY <- knn.index.dist(data.frame(cbind(data[i],data[j]))              ,
                            TEST_data = NULL, 
                            k = K,   
                            method = method, 
                            threads = 4)
      information[i,j] <- digamma(K) + digamma(nobser) - 
        mean(digamma(1+rowSums(DX[,,i] < DXY$train_knn_dist[,K])) + 
             digamma(1+rowSums(DX[,,j] < DXY$train_knn_dist[,K])))
      }
  }
  information <- information + t(information)
  
  # calculate entropy along diagonals
  if (entropy == TRUE){
    for (i in 1:nvars){
      information[i,i] <- log(nobser) - digamma(K) + log(2) + mean(log(DX[,K,i]))
    }
  } else {
    diag(information <- NA)
  }
  
  # output in bits
  if (bits == TRUE){
    information <- information/log(2)
  }
  
  return(information)
}
