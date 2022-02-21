\name{PearsonICAdemo}
\alias{PearsonICAdemo}
\title{Demonstration of the Pearson-ICA Algorithm}
\description{
Displays source signals, mixed signals and signals separated by Pearson-ICA.
}
\usage{
PearsonICAdemo(numsig = 4, signal_length = 5000)
}
\arguments{
  \item{numsig}{number of source signals}
  \item{signal_length}{length of signal}
}

\value{
Displays a demonstration.  
}

\references{Karvanen J., Koivunen V. 2002. Blind separation methods based on Pearson system and its extensions, 
\emph{Signal Processing} \bold{82}(4), 663--673.

Karvanen J., Eriksson J.,Koivunen V. 2000, Pearson system based method for blind separation, 
\emph{Proceedings of Second International Workshop on Independent Component Analysis and Blind Signal Separation (ICA2000)}, 
Helsinki, Finland, 585--590.}

\author{Juha Karvanen}
\note{The R code is based on the MATLAB code by Juha Karvanen, Jan Eriksson and Visa Koivunen.}

\seealso{\code{\link{PearsonICA}}}
\examples{
PearsonICAdemo()
}
\keyword{multivariate}
\keyword{ts}
\keyword{neural}
