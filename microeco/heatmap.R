#Heatmap plots
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
#Heatmap of genera

t1 <- trans_abund$new(dataset = dataset, taxrank = "Genus", ntaxa = 64)
t1$plot_heatmap(facet = "BFT_and_Time", xtext_keep = F, withmargin = F, 
                order_facet = c('Initial heterotrophic',
                                'Final heterotrophic',
                                'Initial mature',
                                'Final mature'),
                )

#Export size
#W 1100
#H 1100

