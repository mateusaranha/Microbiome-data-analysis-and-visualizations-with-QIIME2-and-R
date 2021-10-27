#Venn diagram
library(nVennR)

#Formatting of data file: columns should be taxa and samples, rows as counts

df <- na.omit(level.7)

df$Initial.heterotrophic
df$Initial.mature
df$Final.heterotrophic
df$Final.mature
df$Final.mature.1

#Initial heterotrophic

for (i in 1:length(df$taxon)) {
  if (df$Initial.heterotrophic[i] > 0){
    df$Initial.heterotrophic[i] <- as.character(df$taxon[i])
  } else {
    df$Initial.heterotrophic[i] <- NA
  }
} 
initial.heterotrophic <- as.data.frame(na.omit(df$Initial.heterotrophic))
colnames(initial.heterotrophic) <- 'Initial Heterotrophic'
print(initial.heterotrophic)


#Initial mature

for (i in 1:length(df$taxon)) {
  if (df$Initial.mature[i] > 0){
    df$Initial.mature[i] <- as.character(df$taxon[i])
  } else {
    df$Initial.mature[i] <- NA
  }
} 
initial.mature <- as.data.frame(na.omit(df$Initial.mature))
colnames(initial.mature) <- 'Initial Mature'
print(initial.mature)


#Final heterotrophic

for (i in 1:length(df$taxon)) {
  if (df$Final.heterotrophic[i] > 0){
    df$Final.heterotrophic[i] <- as.character(df$taxon[i])
  } else {
    df$Final.heterotrophic[i] <- NA
  }
} 
final.heterotrophic <- as.data.frame(na.omit(df$Final.heterotrophic))
colnames(final.heterotrophic) <- 'Final Heterotrophic'
print(final.heterotrophic)


#Final mature

for (i in 1:length(df$taxon)) {
  if (df$Final.mature[i] > 0){
    df$Final.mature[i] <- as.character(df$taxon[i])
  } else {
    df$Final.mature[i] <- NA
  }
} 
final.mature <- as.data.frame(na.omit(df$Final.mature))
colnames(final.mature) <- 'Final Mature'
print(final.mature)


#Final mature 1

for (i in 1:length(df$taxon)) {
  if (df$Final.mature.1[i] > 0){
    df$Final.mature.1[i] <- as.character(df$taxon[i])
  } else {
    df$Final.mature.1[i] <- NA
  }
} 
final.mature.1 <- as.data.frame(na.omit(df$Final.mature.1))
colnames(final.mature.1) <- 'Final Mature.1'
print(final.mature.1)


#Plotting venn

ven <- plotVenn(sets = list(final.heterotrophic, final.mature, final.mature.1, initial.heterotrophic, initial.mature),
                sNames = c('Final heterotrophic', 'Final mature', 'Final mature.1', 'Initial heterotrophic', 'Initial mature'), 
                labelRegions = F,
                outFile = 'ven.svg', 
                fontScale = 1.5, 
                nCycles = 100000, 
                setColors = my_pal_inext,
                borderWidth = 3,
                opacity = 0.4
                )

#Observation
#For some reason the labelRegions variable is not responding to my changes.
#When I open in inkscape, the command works.

###
###Color palette
###
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


