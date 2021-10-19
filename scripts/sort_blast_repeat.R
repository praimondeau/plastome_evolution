##Use to quantify repeats out of blast results, filtering out overlapping repeats (length/evalue)

library(gread)
library(plyranges)
library(dplyr)
library(GenomicRanges)
blast_rslt <- read.csv("all_repeat_full", header=TRUE)
colnames(blast_rslt) <- c("sseqid", "sstart", "send", "qstart", "qend", "evalue", "length","sseq")
test <- blast_rslt %>% dplyr::select(sseqid, sstart, send,qstart, qend, evalue, length, sseq) 

test <- test %>% dplyr::mutate(i_start = dplyr::case_when(
  sstart < send ~ sstart,
  send < sstart ~ send
))
test <- test %>% dplyr::mutate(i_end = dplyr::case_when(
  sstart < send ~ send,
  send < sstart ~ sstart
))

test <- test %>% dplyr::select(sseqid, i_start, i_end, qstart, qend, evalue, length, sseq)
colnames(test) <- c("seqnames", "start", "end", "start2", "end2", "evalue", "length","sseq")
test_irange <- test %>% as_granges()
test_disjoin <- reduce(test_irange,with.revmap=TRUE)
list_revmap <- as.data.frame(mcols(test_disjoin))
filtered_data <- c()
for(i in 1:nrow(list_revmap)){
  filtered_data <- c(filtered_data, (slice(list_revmap, i) %>% unlist(use.names=FALSE))[which.min(slice(test,  slice(list_revmap, i) %>% unlist(use.names=FALSE))$evalue)])
}
Best_hits <- slice(test, filtered_data)
write.table(Best_hits,"all_best2", sep = "\t")
