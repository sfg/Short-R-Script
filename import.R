########################################
# liest die Daten des Fragebogens zum Prokrastinationsverhalten
# Aitken Procrastination Inventory ein
########################################


pro <- read.csv("/home/ulf/Lehrauftrag/SPSS_R_Tutorium/Datensatz/procrastination_c.csv",sep="\t",header=T)
colnames(pro)[1:6] <- c("sex","age","hzb","mark","grad","sem")
pro$sex <- factor(pro$sex,levels=c(1,2),labels=c("m","w"),exclude=NA)
pro$grad <- factor(pro$grad,levels=c(1,2,3,4,5),labels=c("BA","MA","Dipl","Mag","STex"),exclude=NA)
pro$hzb <- pro$hzb/10 # eine Kommastelle nach links
pro$mark <- pro$mark/10 #dito


# umkodieren
umkodieren <- function(x){
  sapply(x, function(a) -1*a+6)
}
pro_demo <- pro[,1:6]
pro_items <- pro[,7:ncol(pro)]
recd <- c(5,7,9,10,11,13,14,15,16,18)
pro_items[,recd] <- umkodieren(pro_items[,recd])
pro <- cbind(pro_demo,pro_items)
pro$total <- rowMeans(pro_items,na.rm=TRUE)

  
