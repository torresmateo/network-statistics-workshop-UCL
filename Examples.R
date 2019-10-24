# Network Satistics Workshop


# Part 1 -- Taiane Coelho Ramos
# =============================
require(igraph)


# Random Graph Models
# -------------------

# Example 1 -- Erdös-Rényi Random Graph Model
set.seed(1)
g <- erdos.renyi.game(n=10, p=0.5)
plot(g, layout=layout_in_circle)

# Ecample 2 -- Geometric Random Graph Model
set.seed(1)
g <- sample_grg(nodes=30, radius=0.25)
plot(g, layout=layout_nicely)

# Example 3 -- Regular Random Graph Model
set.seed(1)
g <- sample_k_regular(no.of.nodes=10, k=4)
plot(g, layout=layout_nicely)

# Example 4 -- Watts-Strogatz Random Graph Model
set.seed(1)
g <- sample_smallworld(dim=1,size=20,nei=3,p=0.05)
plot(g, layout=layout_in_circle)

# Example 5 -- Barabási-Albert Random Graph Model
set.seed(1)
g <- barabasi.game(30, power=2, m=2, directed=FALSE)
plot(g, layout=layout_nicely, edge.color='black')


# Graph Measures
# --------------

# Example 6 -- Degree Centrality
set.seed(1)
BA <- barabasi.game(n=20, power=2, m=2, directed=FALSE)
max(degree(BA))
which.max(degree(BA))
plot(BA, layout=layout_nicely)

# Example 7 -- Closeness Centrality
set.seed(1)
WS <- sample_smallworld(dim=1,size=50,nei=2,p=0.1)
max(closeness(WS))
which.max(closeness(WS))
plot(WS, layout=layout_nicely)

# Example 8 -- Betweenness Centrality
max(betweenness(WS))
which.max(betweenness(WS))
plot(WS, layout=layout_nicely)

# Example 9 -- Eigenvector Centrality
max(eigen_centrality(BA)$vector)
which.max(eigen_centrality(BA)$vector)
plot(BA, layout=layout_nicely)

# Example 10 -- Local Clustering Coefficient
transitivity(BA, type='average')
transitivity(BA)
plot(BA, layout=layout_nicely)

library(statGraph)

# Example 11 -- Graph Entropy
graph.entropy(get.adjacency(BA))
plot(BA, layout=layout_nicely)



# Part 2 -- André Fujita
# ======================


# Paramenter Estimation
# ---------------------

# Example 1 -- Parameter Estimator for Erdös-Rényi Random Graph Model
set.seed(1)
A <- as.matrix(get.adjacency(erdos.renyi.game(50, p=0.5)))
# Using a string to indicate the graph model
result1 <- graph.param.estimator(A, 'ER', eps=0.1)
# estimated parameters:
#   p   = 0.489
#   GIC = 0.000416 (graph information criterion -- smalled Kullback-Leiber divergence)

# Example 2 -- Additional models
model <- function(n,p) {
  return(as.matrix(get.adjacency(erdos.renyi.game(n,p))))
}

set.seed(2)
result2 <- graph.param.estimator(A, model, seq(0.2, 0.8, 0.1), classic=TRUE)
# estimated parameters:
#   p   = 5
#   GIC = 0.000358

# Example 3 -- Precomputed spectra (available on the slides)


# Model Selection
# ---------------

# Example 1 -- Predefined models
set.seed(0)
A <- as.matrix(get.adjacency(erdos.renyi.game(50, p=0.3)))
result1 <- graph.model.selection(A, eps=0.1)
# Selected model: ER, p = 0.320

# model selection from a collection of random graph models
result2 <- graph.model.selection(A, c('ER', 'GRG'), eps=0.1)

# Example 2 -- Use your own models (available on the slides)


# Correlation between vectors of graphs
# -------------------------------------

# Example 1 -- dependent graphs (available in the slides)

# Example 2 -- independent graphs (available in the slides)








