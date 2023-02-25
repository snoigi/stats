data=read.csv("Silence_siRNA/Silence_rtPCR.csv") 

data$Group=factor(data$Group, levels = c("siControl" , "si6001",  "si6012" , "si6190") )
data$Gene=factor(data$Gene, levels = c("hPGLU" , "KRT7",  "KRT19" , "JAG1","HES1","GGT1","CFTR") )


data=filter(data, Gene=="hPGLU" |Gene== "KRT7"| Gene=="JAG1")


ggplot(data, aes(x=Group, y=FC,color=Group)) + 
  geom_boxplot(position=position_dodge(0.8))+
  stat_boxplot(geom ='errorbar',position=position_dodge(0.8))+
  stat_compare_means(ref.group = "siControl",method ="wilcox.test",label = "p.format")+
  geom_jitter(size=1,position=position_dodge(0.8))+
  xlab("Treatment") +
  theme_bw() +
  theme(axis.text.x=element_text(angle=90, hjust=1))+
  ylab("mRNA Relative expression") +    
  facet_wrap(vars(Gene),scales="free_y")


