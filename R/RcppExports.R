# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

insulated_heat_diffusion_ <- function(v0, W, b) {
    .Call('diffusr_insulated_heat_diffusion_', PACKAGE = 'diffusr', v0, W, b)
}

laplacian_diffusion_ <- function(v0, W, t) {
    .Call('diffusr_laplacian_diffusion_', PACKAGE = 'diffusr', v0, W, t)
}

stoch_col_norm_ <- function(W) {
    .Call('diffusr_stoch_col_norm_', PACKAGE = 'diffusr', W)
}

laplacian_ <- function(W) {
    .Call('diffusr_laplacian_', PACKAGE = 'diffusr', W)
}

mrwr_ <- function(p0, W, r) {
    .Call('diffusr_mrwr_', PACKAGE = 'diffusr', p0, W, r)
}

neighbors_ <- function(node_idxs, W, k) {
    .Call('diffusr_neighbors_', PACKAGE = 'diffusr', node_idxs, W, k)
}

# Register entry points for exported C++ functions
methods::setLoadAction(function(ns) {
    .Call('diffusr_RcppExport_registerCCallable', PACKAGE = 'diffusr')
})
