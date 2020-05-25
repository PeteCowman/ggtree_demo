# Lets have fun with a tree

# load libraries
library(tidyverse)
library(ape)
library(ggtree)
library(treeio)
library(tidytree)


# read in a BEAST format tree (the one in exmaple folder)

tr <- read.beast("example_data/Chaetodontidae.tre")
tr@phylo
tr@data %>% glimpse()

# plot with ape to get a few node numbers

plot(tr@phylo, cex = 0.5)
nodelabels()

# plot with ggtree
ggtree(tr, layout = "circular")

# since it is calibrated to time I will reverse the node ages to be time before present
p <- ggtree(tr)
p1 <- revts(p)

# now lets sort outt he tip labels
p1 + geom_tiplab()

# need to add space for labels


# we can also change the labels to be displayed to save some space.


# lets label some clades
p1 + geom_nodelab(aes(label = node), geom = "label")
# 112, 136, 205, 182, 165, 141
p1 + geom_tiplab(offset = 0.3, size = 2.5) + xlim(NA, 40) + 
  geom_cladelabel(node = 112, label  = "Banerfishes", offset = 20,offset.text = 1, color='black', barsize = 2) + geom_cladelabel(node = 136, label  = "Prognathodes", offset = 20,offset.text = 1, color='grey', barsize = 2) + geom_cladelabel(node = 205, label  = "Clade 1", offset = 20,offset.text = 1, color='black', barsize = 2) + 
  geom_cladelabel(node = 182, label  = "Clade 2", offset = 20,offset.text = 1, color='grey', barsize = 2) + 

# view a clade



# plot some data beside the tree
# make some data
fish.size <- tibble(label = tr@phylo$tip.label, body.szie = rnorm(length(tr@phylo$tip.label), mean=15, sd=10))
fish.size

p1 
