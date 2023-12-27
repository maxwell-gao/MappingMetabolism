library(readr)
library(clusterProfiler)
library(dplyr)
genedata <- read_csv("data/KEGG_diff_same_detail_gene_all.csv")
gene_symbols <- genedata$human_SYMBOL
converted_data_UNIPROT <- bitr(geneID = gene_symbols, 
                               fromType = "SYMBOL", 
                               toType = "UNIPROT",
                               OrgDb = "org.Hs.eg.db", 
                               drop = TRUE)
converted_data <- bitr_kegg(geneID = converted_data_UNIPROT$UNIPROT, 
                            fromType = "uniprot", 
                            toType = "kegg", 
                            organis = "hsa",
                            drop = TRUE)
merged_data <- merge(converted_data, converted_data_UNIPROT,by.y = "UNIPROT", by.x = "uniprot", all = TRUE)
filtered_data <- dplyr::distinct(merged_data, SYMBOL, .keep_all = TRUE) 
preprocessed_data <-  merge(filtered_data, genedata,by.y = "human_SYMBOL", by.x = "SYMBOL", all = TRUE)
preprocessed_data <- preprocessed_data[, !names(preprocessed_data) %in% "...1"]
final_data = dplyr::distinct(preprocessed_data, kegg, .keep_all = TRUE)
final_data = dplyr::filter(final_data, kegg != "NA", )
final_data = dplyr::filter(final_data, human_sig != "none"| mouse_sig != "none")
final_data <- final_data[, !names(final_data) %in% "Description"]
write.table(final_data,"data/final_data.csv",row.names=FALSE,col.names=TRUE,sep=",")