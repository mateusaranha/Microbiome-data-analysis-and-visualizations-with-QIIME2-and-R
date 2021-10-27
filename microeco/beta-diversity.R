#Alluvial plots
library(file2meco)
library(microeco)
library(dplyr)
library(ggplot2)
library(ggthemes)

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

#Rarefying
dataset$rarefy_samples(sample.size = 59536)

#beta-diversity
dataset$cal_betadiv(unifrac = T)

class(dataset$beta_diversity)

dir.create('beta_diversity')
dataset$save_betadiv(dirpath = 'beta_diversity')


###trans_beta class
t1 <- trans_beta$new(dataset = dataset, group = 'BFT_and_Time', measure = 'bray')
t2 <- trans_beta$new(dataset = dataset, group = 'BFT_and_Time', measure = 'jaccard')
t3 <- trans_beta$new(dataset = dataset, group = 'BFT_and_Time', measure = 'unwei_unifrac')
t4 <- trans_beta$new(dataset = dataset, group = 'BFT_and_Time', measure = 'wei_unifrac')

#PCoA
t1$cal_ordination(ordination = 'PCoA')
t1$plot_ordination(plot_color = 'BFT',
                   plot_shape = 'Time', 
                   plot_group_centroid = T,
                   plot_point_size = 7, 
                   color_values = my_pal_pcoa,
                   plot_point_alpha = 1,
                   segment_alpha = 1
) + theme_hc() + theme(text = element_text(size = 14), panel.grid.major.x = element_line(colour = "#D8D8D8"), legend.position = 'right') 


#Export
#W700
#H500


my_pal_pcoa <- c("#5566AA",
                 #"#117733",
                 #"#44AA66",
                 #"#55AA22",
                 #"#668822",
                 #"#99BB55",
                 #"#558877",
                 #"#88BBAA",
                 #"#AADDCC",
                 #"#44AA88",
                 #"#DDCC66",
                 #"#FFDD44",
                 #"#FFEE88",
                 "#BB0011"
)
