#read in data
penguins_raw<-read.csv("data_raw/penguins_raw.csv")


# cleaning data
source("functions/cleaning.R")
penguins_clean<-cleaning(penguins_raw)

# saving clean data}
write.csv(penguins_clean,"data_clean/penguins_clean.csv")

# testing if culmen length is affected by species 
model1<-aov(culmen_length_mm~species,penguins_clean)
summary(model1)




# plotting graph
violinplot<-ggviolin(penguins_clean, x="species", y= "culmen_length_mm" , fill = "species",
                     palette = c("#00AFBB", "#E7B800", "#FC4E07"),
                     add = "boxplot", add.params = list(fill = "white"))+
  stat_compare_means(method= "anova")+
  scale_x_discrete(labels=c("Adelie Penguin (Pygoscelis adeliae)" = "Adelie", "Gentoo penguin (Pygoscelis papua)" = "Gentoo", "Chinstrap penguin (Pygoscelis antarctica)" = "Chinstrap"))+
  theme_bw()+
  labs(title="Culmen Length between Species", x="Penguin Species", y="Culmen Length (mm)")


ggsave("output/culmenlength.species.png",
       plot = violinplot,
       height = 10.5, width = 20.8,
       units = c("cm"))
