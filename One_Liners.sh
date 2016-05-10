# Awk_One_Liners

# Give a 2 column, tab separated list of read no. and read length
zcat whatever.fastq.gz | paste - - - - | awk '{print NR " " (length($3))}'


#Count total reads in fastq file
zcat whatever.fastq.gz | wc -l | awk '{print $1/4}' 
