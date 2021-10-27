#Rarefaction and extrapolation

library(iNEXT)
library(ggplot2)
library(ggthemes)


df <- na.omit(level.7)

#Selecting only the counts 

df1 <- df[2:6]

###Richness rarefaction curves (q=0)
out1 <- iNEXT(df1, q = 0, datatype = 'abundance')

#Count based graph
graph1 <- ggiNEXT(out1, type = 1) + facet_wrap(~order, scales = 'free') +
          theme_hc() + theme(text = element_text(size = 16), legend.position = c(0.7, 0.32)) +
          scale_color_manual(values = my_pal_inext)

print(graph1)

###Exporting size
#Width 600
#Height 533

###Shannon and simpson
out2 <- iNEXT(df1, q = c(1, 2), datatype = 'abundance')

#Count based graph
graph2 <- ggiNEXT(out2, type = 1, facet.var = 'order') + facet_wrap(~order, scales = 'free') + theme_hc() +
          theme(text = element_text(size = 20)) + scale_color_manual(values = my_pal_inext)

print(graph2)

###Exporting size
#Width 1200
#Height 533


###Color palette

my_pal_inext <- c("#5566AA",
                  #"#117733",
                  "#44AA66",
                  #"#55AA22",
                  #"#668822",
                  #"#99BB55",
                  #"#558877",
                  #"#88BBAA",
                  "#AADDCC",
                  #"#44AA88",
                  #"#DDCC66",
                  "#FFDD44",
                  #"#FFEE88",
                  "#BB0011"
)


