# Awk_One_Liners_for_NGS
# Awk_One_Liners
# Give a 2 column, tab separated list of read no. and read length
zcat whatever.fastq.gz | paste - - - - | awk '{print NR " " (length($3))}'
