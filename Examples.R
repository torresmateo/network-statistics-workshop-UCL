# Network Satistics Workshop

# Part 1 -- Taiane Coelho Ramos
require(igraph)

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







