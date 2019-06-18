

# information_estimation
The codes contained in this repository implement k-nearest neighbor estimators for mutual information and differential entropy for data drawn from a continuous distribution.  

<html>
 <base target="_blank" />

<h2> Estimating mutual information </h2>
<p>The codes KLkNN.R and information.R implement <a href = 'https://arxiv.org/abs/cond-mat/0305641'> Kraskov et al (2004)</a> Eq. 8 for all mutual information estimates.  For details on the differential entropy estimator in information.R, see <a href = "https://arxiv.org/abs/1904.05850 ">Young and Dunson (2019).</a></p>

<h3> KLkNN.R  </h3>
<h4> Usage    </h4>
KLkNN(x, y, K, bits = TRUE, method = "chebyshev")
<h4> Output </h4>
The estimated mutual information of x and y
<h4> Arguments </h4>
<dl>
  <dt> x,y </dt>  
  <dd><p> Data frames containing paired observations of continuous random variables.  x and y must have the same number of observations where corresponding entries are the paired samples of (x,y).
  </p></dd>
  
  <dt> K </dt>
  <dd><p> The number of nearest neighbors to use in estimation.  Default is 1. </p></dd>
  
  <dt> bits </dt>
  <dd><p> logical; if TRUE (DEFAULT) output mutual information in bits.  Otherwise, output in nats.  
  </dd> 
  
  <dt> method </dt>
  <dd><p> Metric to use for k-nearest neighbor distance.  For more details see <a href = 'https://cran.r-project.org/web/packages/KernelKnn/KernelKnn.pdf'>KernelKNN documentation. </a> </p></dd>
<h4> Dependencies </h4>
Library 'KernelKNN' is needed for k-nearest neighbor calculations. 

<h3> information.R </h3>
<h4> Usage </h4>
information(X, K = 1, bits = TRUE, entropy = FALSE, method = "chebyshev")
<h4> Output </h4>
A dim(X) by dim(X) matrix with entry (i,j) corresponding to the mutual information of the ith and jth variable of X.  If entropy = TRUE, the differential entropy of the ith variable is displayed in the ith diagonal entry.
<h4> Arguments </h4> 
<dl>
  <dt> X </dt>  
  <dd><p> Data frame containing paired observations of continuous random variables.
  </p></dd>
  
  <dt> K </dt>
  <dd><p> The number of nearest neighbors to use in estimation.  Default is 1. </p></dd>
  
  <dt> bits </dt>
  <dd><p> logical; if TRUE (DEFAULT) output mutual information in bits.  Otherwise, output in nats.  
  </dd> 
  
  <dt> entropy </dt>
  <dd><p> logical; if TRUE output differential entropy on diagonal.  DEFAULT = FALSE
  
  <dt> method </dt>
  <dd><p> Metric to use for k-nearest neighbor distance.  For more details see <a href = 'https://cran.r-project.org/web/packages/KernelKnn/KernelKnn.pdf'>KernelKNN documentation. </a> </p></dd>
  
<h4> Dependencies </h4>
Library <a href = "">'KernelKNN'</a> is needed for k-nearest neighbor calculations. 




<h2> Mathematical background </h2>

Let <a href="https://www.codecogs.com/eqnedit.php?latex=\inline&space;X" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\inline&space;X" title="X" /></a> and <a href="https://www.codecogs.com/eqnedit.php?latex=\inline&space;Y" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\inline&space;Y" title="Y" /></a>
be random variables with joint density <a href="https://www.codecogs.com/eqnedit.php?latex=\inline&space;f(x,y)" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\inline&space;f(x,y)" title="f(x,y)" /></a> and marginal densities 


<a href="https://www.codecogs.com/eqnedit.php?latex=\begin{align*}&space;f_X(x)&space;&=&space;\int&space;f(x,y)dy\\&space;f_Y(y)&space;&=&space;\int&space;f(x,y)dx&space;\end{align*}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\begin{align*}&space;f_X(x)&space;&=&space;\int&space;f(x,y)dy\\&space;f_Y(y)&space;&=&space;\int&space;f(x,y)dx.&space;\end{align*}" title="\begin{align*} f_X(x) &= \int f(x,y)dy\\ f_Y(y) &= \int f(x,y)dx. \end{align*}" /></a>


The mutual information of <a href="https://www.codecogs.com/eqnedit.php?latex=\inline&space;X" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\inline&space;X" title="X" /></a>  and <a href="https://www.codecogs.com/eqnedit.php?latex=\inline&space;Y" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\inline&space;Y" title="Y" /></a> is defined as

<a href="https://www.codecogs.com/eqnedit.php?latex=I(X,Y)&space;=&space;\int&space;f(x,y)&space;\log&space;\bigg(&space;\frac{f(x,y)}{f_X(x)f_Y(y)}\bigg)&space;dx&space;dy" target="_blank"><img src="https://latex.codecogs.com/gif.latex?I(X,Y)&space;=&space;\int&space;f(x,y)&space;\log&space;\bigg(&space;\frac{f(x,y)}{f_X(x)f_Y(y)}\bigg)&space;dx&space;dy" title="I(X,Y) = \int f(x,y) \log \bigg( \frac{f(x,y)}{f_X(x)f_Y(y)}\bigg) dx dy" /></a>

and the differential entropy of <a href="https://www.codecogs.com/eqnedit.php?latex=\inline&space;X" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\inline&space;X" title="X" /></a> is

<a href="https://www.codecogs.com/eqnedit.php?latex=h(X)&space;=&space;-&space;\int&space;f_X(x)\log&space;f_X(x)&space;dx" target="_blank"><img src="https://latex.codecogs.com/gif.latex?h(X)&space;=&space;-&space;\int&space;f_X(x)\log&space;f_X(x)&space;dx." title="h(X) = - \int f_X(x)\log f_X(x) dx." /></a>

A similar definition holds for <a href="https://www.codecogs.com/eqnedit.php?latex=h(Y)." target="_blank"><img src="https://latex.codecogs.com/gif.latex?h(Y)." title="h(Y)" /></a>
    
</html>
