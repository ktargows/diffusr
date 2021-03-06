% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/insulated_heat_process.R
\docType{methods}
\name{insulated.heat.diffusion}
\alias{insulated.heat.diffusion}
\alias{insulated.heat.diffusion,numeric,matrix-method}
\title{Graph diffusion using an insulated heat diffusion process}
\usage{
insulated.heat.diffusion(h0, graph, r = 0.5, ...)

\S4method{insulated.heat.diffusion}{numeric,matrix}(h0, graph, r = 0.5, ...)
}
\arguments{
\item{h0}{an \code{n}-dimensional numeric non-negative vector of starting temperatures}

\item{graph}{an (\code{n x n})-dimensional numeric non-negative adjacence matrix representing the graph}

\item{r}{rate of heat diffusion, where 1 is the maximum diffusion and 0 no diffusion at all}

\item{...}{additional parameters}
}
\value{
returns the heat on every node as numeric vector
}
\description{
An amount of starting heat \code{h0} of nodes on a graph is distributed across its edges.
The insulated heat diffusion calculates the stationary distribution of the different temperatures on the nodes.
}
\examples{
# count of nodes
n <- 5
# starting distribution (has to sum to one)
h0 <- as.vector(rmultinom(1, 1, prob=rep(.2, n)))
# adjacency matrix (either normalized or not)
graph <- matrix(abs(rnorm(n*n)), n, n)
# computation of stationary distribution
ht <- insulated.heat.diffusion(h0, graph)
}
\references{
Power and centrality: A family of measures.
\emph{American Journal of Sociology}\cr \cr
Leiserson, M. D., Vandin, F., Wu, H. T., Dobson, J. R., Eldridge, J. V., Thomas, J. L., ... & Lawrence, M. S. (2015),
Pan-cancer network analysis identifies combinations of rare somatic mutations across pathways and protein complexes.
\emph{Nature genetics}\cr \cr
}
