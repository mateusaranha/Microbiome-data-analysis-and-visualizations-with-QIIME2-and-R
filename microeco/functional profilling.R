#Functional profilling plots
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

###trans_func class
t1 <- trans_func$new(dataset)

t1$cal_spe_func()

t1$cal_spe_func_perc(abundance_weighted = T)


#Plotting using the trans_func plotting option
t1$plot_spe_func_perc(use_group_list = F)


#Exporting the faprotax table
faprotax.table <- t1$res_spe_func_perc

faprotax.table <- t(faprotax.table)


###Plotting heatmap using the trans_abund plotting option
dataset$taxa_abund$Trait <- as.data.frame(t(t1$res_spe_func_perc))

t2 <- trans_abund$new(dataset = dataset, taxrank = 'Trait', use_percentage = F, ntaxa = 43)

#With number on plot
t2$plot_heatmap(facet = "BFT_and_Time",
                withmargin = F,
                order_facet = c('Initial heterotrophic', 'Final heterotrophic', 'Initial mature', 'Final mature'),
                plot_numbers = T) + theme(axis.text.x = element_blank())

#Without numbers on plot
t2$plot_heatmap(facet = "BFT_and_Time",
                withmargin = F,
                order_facet = c('Initial heterotrophic', 'Final heterotrophic', 'Initial mature', 'Final mature'),
                plot_numbers = F) + theme(axis.text.x = element_blank())


#Export size
#W1150
#H800


###Trying to create a table containing the description of all faprotax functions.

#Showing the list of functions that are plotted using the trans_func plotting option
t1$func_group_list

#Showing the description of each function
t1$show_prok_func(use_func = 'methanol_oxidation')


###Creating a data frame with the function names and the respective descriptions
faprotax.func.names <- colnames(faprotax.table)
faprotax.functions <- as.data.frame(faprotax.func.names)


#What am I trying to automate?
faprotax.functions[1, 2] <- t1$show_prok_func(use_func = 'methanol_oxidation')
faprotax.functions[2, 2] <- t1$show_prok_func(use_func = 'methylotrophy')


#Function
my.list <- c(1:length(faprotax.func.names))

for(i in my.list){
  faprotax.functions[i, 2] <- t1$show_prok_func(use_func = print(faprotax.functions[i, 1]))
}

#changing name of columns
faprotax.functions <- rename(faprotax.functions, 'Function name' = faprotax.func.names, Description = V2)

#Merging the faprotax percentage table with the function names and descriptions
full.faprotax.table <- cbind(faprotax.functions, faprotax.table)

#Removing row names
row.names(full.faprotax.table) <- NULL

#Naming the samples with the treatments
colnames(full.faprotax.table[,3:7])

full.faprotax.table <- rename(full.faprotax.table, 
                              'Initial heterotrophic' = "180606883897-2-1-1",
                              'Initial mature' = "180606883898-1-1-1",
                              'Final heterotrophic' =  "180606883900-1-1-1",
                              'Final mature' = "180606883901-2-1-1",
                              'Final mature.1' = "180606883902-1-1-1")




write.csv(full.faprotax.table,"./full.faprotax.table.csv", row.names = F)


