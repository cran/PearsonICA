\name{PearsonICA}
\alias{PearsonICA}
\concept{independent component analysis}
\concept{principal component analysis}
\concept{blind source separation}
\concept{signal separation}
\title{Pearson-ICA Algorithm for Independent Component Analysis (ICA)}
\description{
The Pearson-ICA algorithm is a mutual information-based method for blind separation of statistically independent source signals.
It has been shown that the minimization of mutual information leads to iterative use of score functions, i.e. derivatives of log densities. 
The Pearson system allows adaptive modeling of score functions. The flexibility of the Pearson system makes it possible to model a wide range 
of source distributions including asymmetric distributions. The algorithm is designed especially for problems with asymmetric sources 
but it works for symmetric sources as well.
}
\usage{
PearsonICA(X, n.comp = 0, row.norm = FALSE, maxit = 200, tol = 1e-04, 
           border.base = c(2.6, 4), border.slope = c(0, 1), verbose = FALSE, 
		   w.init = NULL, na.rm = FALSE, whitening.only = FALSE, PCA.only = FALSE)
}
\arguments{
  \item{X}{input data. Each column contains one signal.}
  \item{n.comp}{number of components to be extracted.}
  \item{row.norm}{a logical value indicating whether rows of the data matrix 'X' should be standardized beforehand.}
  \item{maxit}{maximum number of iterations to perform}
  \item{tol}{a positive scalar giving the tolerance at which the un-mixing matrix is considered to have converged.}
  \item{border.base}{intercept terms for the tanh boundaries. See details.}
  \item{border.slope}{slope terms for the tanh boundaries. See details.}
  \item{verbose}{a logical value indicating the level of output as the algorithm runs.}
  \item{w.init}{initial un-mixing matrix of dimension (n.comp,n.comp). If NULL (default) then a matrix of normal r.v.'s is used.}
  \item{na.rm}{should the rows with missing values be removed.}
  \item{whitening.only}{perform only whitening.}
  \item{PCA.only}{perform only principal component analysis.}
}
\details{
The data matrix X is considered to be a linear combination of
statistically independent components, i.e. X = SA where A is a linear mixing and
matrix the columns of S contain the independent components of which at most one has Gaussian distribution. 
The goal of ICA is to find a matrix W such that the output Y = XW is an estimate of possibly scaled and 
permutated source matrix S.

In order to extract the independent components/sources we search for a demixing matrix W that
minimizes the mutual information of the sources.  The minimization of mutual information leads to iterative 
use of score functions, i.e. derivatives of log densities. Pearson-ICA uses the Pearson system to model 
the score functions of the output Y. The parameters of the Pearson system are estimated by method of
moments. To speed up the algorithm, tanh nonlinearity is used when the distribution is far from Gaussian. 
The parameters 'border.base' and 'border.slope' define the boundaries of the tanh area in 
the skewness-kurtosis plane. See Figure 2 in (Karvanen, Eriksson and Koivunen, 2000) for an illustration.
}
\value{
A list containing the following components 
\item{X}{input data}
\item{whitemat}{whitening matrix}
\item{W}{estimated demixing matrix}
\item{A}{estimated mixing matrix}
\item{S}{separated (estimated) source signals}
\item{Xmu}{component means}
\item{w.init}{starting value of W}
\item{maxit}{maximum number of iterations allowed}
\item{tol}{convergence limit}
\item{it}{number of iterations used}
}

\section{Warning }{The definition of W is different from that of \code{fastICA} algorithm (version 1.1-8).}

\references{Karvanen J., Koivunen V. 2002. Blind separation methods based on Pearson system and its extensions, 
\emph{Signal Processing} \bold{82}(4), 663--673.

Karvanen J., Eriksson J.,Koivunen V. 2000, Pearson system based method for blind separation, 
\emph{Proceedings of Second International Workshop on Independent Component Analysis and Blind Signal Separation (ICA2000)}, 
Helsinki, Finland, 585--590.}

\author{Juha Karvanen}
\note{The R code is based on the MATLAB code by Juha Karvanen, Jan Eriksson and Visa Koivunen. 
Parts of the R code and documentation are taken from the \code{fastICA} R package.} 

\seealso{\code{\link{PearsonICAdemo}}}
\examples{
S<-matrix(runif(5000),1000,5);
X<-S+S[,c(2,3,4,5,1)];
icaresults<-PearsonICA(X,verbose=TRUE)
print(icaresults$A)
}
\keyword{multivariate}
\keyword{ts}
\keyword{neural}
