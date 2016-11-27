# diffusr: network diffusion algorithms in R
#
# Copyright (C) 2016 Simon Dirmeier
#
# This file is part of diffusr.
#
# diffusr is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# diffusr is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with diffusr. If not, see <http://www.gnu.org/licenses/>.

#' Graph diffusion using an insulated heat diffusion process
#'
#' @description An amount of starting heat \code{h0} of nodes on a graph is distributed across its edges.
#' The insulated heat diffusion calculates the stationary distribution of the different temperatures on the nodes.
#'
#' @export
#' @author Simon Dirmeier, \email{simon.dirmeier@@gmx.de}
#'
#' @param h0   an \code{n}-dimensional numeric non-negative vector of starting temperatures
#' @param graph  an (\code{n x n})-dimensional numeric non-negative adjacence matrix representing the graph
#' @param r rate of heat diffusion, where 1 is the maximum diffusion and 0 no diffusion at all
#' @param ...  additional parameters
#' @return  returns the heat on every node as numeric vector
#'
#' @references
#' Power and centrality: A family of measures.
#' \emph{American Journal of Sociology}\cr \cr
#' Leiserson, M. D., Vandin, F., Wu, H. T., Dobson, J. R., Eldridge, J. V., Thomas, J. L., ... & Lawrence, M. S. (2015),
#' Pan-cancer network analysis identifies combinations of rare somatic mutations across pathways and protein complexes.
#' \emph{Nature genetics}\cr \cr
#'
#' @examples
#' # count of nodes
#' n <- 5
#' # starting distribution (has to sum to one)
#' h0 <- as.vector(rmultinom(1, 1, prob=rep(.2, n)))
#' # adjacency matrix (either normalized or not)
#' graph <- matrix(abs(rnorm(n*n)), n, n)
#' # computation of stationary distribution
#' ht <- insulated.heat.diffusion(h0, graph)
insulated.heat.diffusion <- function(h0, graph, r=.5, ...)
{
  UseMethod("insulated.heat.diffusion")
}

#' @export
#' @method insulated.heat.diffusion numeric
insulated.heat.diffusion.numeric <- function(h0, graph, r=.5, ...)
{
  .check.restart(r)
  .check.vector(h0)
  .check.graph(graph, h0)
  if (any(diag(graph) != 0))
  {
    warning("setting diag of graph to zero")
    diag(graph) <- 0
  }
  invisible(.insulated.heat.diffusion.cpp(normalize.stochastic(h0),
                                          normalize.stochastic(graph), 1 - r))
}