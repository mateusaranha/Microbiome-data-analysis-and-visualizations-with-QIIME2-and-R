#Alluvial plots
library(file2meco)
library(microeco)
library(dplyr)
library(ggplot2)

#Importing qiime2 files
#The actual file paths were removed due to sensitive information
dataset <- qiime2meco(ASV_data = "",
                      sample_data = "",
                      taxonomy_data = "",
                      phylo_tree = "",
                      rep_fasta = "")

#I already filtered the outlier final heterotrophic sample and the chloroplasts and mitochondria

###3.1 microtable codes
#Making species and sample information consistent across different files in the dataset
dataset

dataset$tidy_dataset()

#Using sample_sums to check sequence numbers in each sample
dataset$sample_sums() %>% range

#Calculating taxa abundance
dataset$cal_abund()

#Saving the taxa abundance file
#dataset$save_abund(dirpath = "taxa_abund")

###trans_abund class
my.lab <- c('Initial', 'Final', 'Final')

#Phylum alluvial plot
p1 <- trans_abund$new(dataset = dataset, taxrank = 'Phylum', ntaxa = 6)
p1$plot_bar(use_alluvium = T, clustering = F, facet = 'BFT', use_colors = my_pal_phylum) + 
            scale_x_discrete(labels = my.lab)


#Class alluvial plot
c1 <- trans_abund$new(dataset = dataset, taxrank = 'Class', ntaxa = 6)
c1$plot_bar(use_alluvium = T, clustering = F, facet = 'BFT', use_colors = my_pal_phylum) + 
  scale_x_discrete(labels = my.lab)


#Order alluvial plot
o1 <- trans_abund$new(dataset = dataset, taxrank = 'Order', ntaxa = 12)
o1$plot_bar(use_alluvium = T, clustering = F, facet = 'BFT', use_colors = my_pal_order) + 
  scale_x_discrete(labels = my.lab)


#Family alluvial plot
f1 <- trans_abund$new(dataset = dataset, taxrank = 'Family', ntaxa = 13)
f1$plot_bar(use_alluvium = T, clustering = F, facet = 'BFT', use_colors = my_pal_family) + 
  scale_x_discrete(labels = my.lab)

#Genus 
g1 <- trans_abund$new(dataset = dataset, taxrank = 'Genus', ntaxa = 9)
g1$plot_bar(use_alluvium = T, clustering = F, facet = 'BFT', use_colors = my_pal_genus) + 
  scale_x_discrete(labels = my.lab)

#Export size
#W700
#H400

###Color palettes
#Phylum and class palettes (6 colors)

my_pal_phylum <- c("#5566AA",
                   #"#117733",
                   "#44AA66",
                   #"#55AA22",
                   #"#668822",
                   "#99BB55",
                   #"#558877",
                   #"#88BBAA",
                   "#AADDCC",
                   #"#44AA88",
                   #"#DDCC66",
                   "#FFDD44",
                   #"#FFEE88",
                   "#BB0011"
)


#Order palette (12 colors)

my_pal_order <- c("#5566AA",
                  "#117733",
                  #"#44AA66",
                  "#55AA22",
                  "#668822",
                  "#99BB55",
                  "#558877",
                  "#88BBAA",
                  "#AADDCC",
                  "#44AA88",
                  #"#DDCC66",
                  "#FFDD44",
                  "#FFEE88",
                  "#BB0011"
)


#Family palette (13 colors)

my_pal_family <- c("#5566AA",
                   "#117733",
                   #"#44AA66",
                   "#55AA22",
                   "#668822",
                   "#99BB55",
                   "#558877",
                   "#88BBAA",
                   "#AADDCC",
                   "#44AA88",
                   "#DDCC66",
                   "#FFDD44",
                   "#FFEE88",
                   "#BB0011"
)


#Genus palette (9 colors)

my_pal_genus <- c("#5566AA",
                  "#117733",
                  #"#44AA66",
                  "#55AA22",
                  #"#668822",
                  "#99BB55",
                  #"#558877",
                  #"#88BBAA",
                  "#AADDCC",
                  "#44AA88",
                  #"#DDCC66",
                  "#FFDD44",
                  "#FFEE88",
                  "#BB0011"
)
