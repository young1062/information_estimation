# information_estimation
The codes contained in this repository implement the k-nearest neighbor for mutual information and differential entropy for data drawn from a continuous distribution.  


<h2> Estimating mutual information </h2>

<h3> Definition of estimator </h3>
For mutual information, see Kraskov et al (2004) Eq. 19, which uses the estimator 

<h3> Implementation in codes </h3> 

<h2> Estimating differential entropy </h2> 

<h3> Definition of estimator </h3>
For differential entropy, see Berrett et al (2019).  In this case, we use the

<h3> Implementation in codes </h3>


<h2> Mathematical background </h2>

Let <a href="https://www.codecogs.com/eqnedit.php?latex=\inline&space;X" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\inline&space;X" title="X" /></a> and <a href="https://www.codecogs.com/eqnedit.php?latex=\inline&space;Y" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\inline&space;Y" title="Y" /></a>
be random variables with joint density <a href="https://www.codecogs.com/eqnedit.php?latex=\inline&space;f(x,y)" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\inline&space;f(x,y)" title="f(x,y)" /></a> and marginal densities 


<a href="https://www.codecogs.com/eqnedit.php?latex=\begin{align*}&space;f_X(x)&space;&=&space;\int&space;f(x,y)dy\\&space;f_Y(y)&space;&=&space;\int&space;f(x,y)dx&space;\end{align*}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\begin{align*}&space;f_X(x)&space;&=&space;\int&space;f(x,y)dy\\&space;f_Y(y)&space;&=&space;\int&space;f(x,y)dx.&space;\end{align*}" title="\begin{align*} f_X(x) &= \int f(x,y)dy\\ f_Y(y) &= \int f(x,y)dx. \end{align*}" /></a>


The mutual information of <a href="https://www.codecogs.com/eqnedit.php?latex=\inline&space;X" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\inline&space;X" title="X" /></a>  and <a href="https://www.codecogs.com/eqnedit.php?latex=\inline&space;Y" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\inline&space;Y" title="Y" /></a> is defined as

<a href="https://www.codecogs.com/eqnedit.php?latex=I(X,Y)&space;=&space;\int&space;f(x,y)&space;\log&space;\bigg(&space;\frac{f(x,y)}{f_X(x)f_Y(y)}\bigg)&space;dx&space;dy" target="_blank"><img src="https://latex.codecogs.com/gif.latex?I(X,Y)&space;=&space;\int&space;f(x,y)&space;\log&space;\bigg(&space;\frac{f(x,y)}{f_X(x)f_Y(y)}\bigg)&space;dx&space;dy" title="I(X,Y) = \int f(x,y) \log \bigg( \frac{f(x,y)}{f_X(x)f_Y(y)}\bigg) dx dy" /></a>

and the differential entropy of <a href="https://www.codecogs.com/eqnedit.php?latex=\inline&space;X" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\inline&space;X" title="X" /></a> is

<a href="https://www.codecogs.com/eqnedit.php?latex=h(X)&space;=&space;-&space;\int&space;f_X(x)\log&space;f_X(x)&space;dx" target="_blank"><img src="https://latex.codecogs.com/gif.latex?h(X)&space;=&space;-&space;\int&space;f_X(x)\log&space;f_X(x)&space;dx." title="h(X) = - \int f_X(x)\log f_X(x) dx." /></a>

A similar definition holds for <a href="https://www.codecogs.com/eqnedit.php?latex=h(Y)." target="_blank"><img src="https://latex.codecogs.com/gif.latex?h(Y)." title="h(Y)" /></a>
