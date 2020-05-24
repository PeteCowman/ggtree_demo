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



