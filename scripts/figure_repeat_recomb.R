###Supplem figures, genomes map/rearrangements

library(genoPlotR)
OE <- try(read_dna_seg_from_tab("OE.csv"))#blast results name	start	end	strand	col
OE$fill<-OE$col

CF <- try(read_dna_seg_from_tab("CF.csv"))
COMP <- try(read_comparison_from_blast("out_CF"))
CF$fill <- CF$col
CF$fill <- CF$col
temp <- data.frame(start1=COMP$start1,end1=COMP$end1,start2=COMP$start2,end2=COMP$end2,direction=COMP$direction,per_id=COMP$per_id,col="grey")
temp$col <- apply_color_scheme(temp$per_id,direction = temp$direction, color_scheme ="grey")
comp<-as.comparison(temp)

pdf(file = "CF.pdf", width = 10, height = 7)
plot_gene_map(dna_segs=list(CF,OE),comparisons=list(comp),gene_type="side_blocks", dna_seg_scale=TRUE, scale=FALSE)
dev.off()

#### just plot genes
ME<-as.dna_seg(M)
AD <- as.dna_seg(A)
COMPMO <- try(read_comparison_from_blast("out_meno"))
COMPAO <- try(read_comparison_from_blast("out_aden"))
#M$col <- viridis(64)
#M$fill <- viridis(64)
temp <- data.frame(start1=COMPMO$start1,end1=COMPMO$end1,start2=COMPMO$start2,end2=COMPMO$end2,direction=COMPMO$direction,per_id=COMPMO$per_id,col="grey")
temp$col <- apply_color_scheme(temp$per_id,direction = temp$direction, color_scheme ="grey")
compMO<-as.comparison(temp)
temp <- data.frame(start1=COMPAO$start1,end1=COMPAO$end1,start2=COMPAO$start2,end2=COMPAO$end2,direction=COMPAO$direction,per_id=COMPAO$per_id,col="grey")
temp$col <- apply_color_scheme(temp$per_id,direction = temp$direction, color_scheme ="grey")
compAO<-as.comparison(temp)

pdf(file = "testa.pdf", width = 10, height = 7)
plot_gene_map(dna_segs=list(AD,O),comparisons=list(compAO),gene_type="side_blocks", dna_seg_scale=TRUE, scale=FALSE)
dev.off()