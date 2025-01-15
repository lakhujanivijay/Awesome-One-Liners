## One line, when multiple are not enough :+1:



### 1. **Count sequences in a FASTA file**
```bash
grep -c '^>' file.fasta
```

### 2. **Extract headers from a FASTA file**
```bash
grep '^>' file.fasta
```

### 3. **Count reads in a FASTQ file**
```bash
grep -c '^@' file.fastq
```

### 4. **Extract sequence data from a FASTQ file**
```bash
grep -A 1 '^@' file.fastq | grep -v '^@' | paste - - - -
```

### 5. **Convert FASTQ to FASTA**
```bash
awk 'NR%4==1{print ">"substr($0,2)} NR%4==2{print $0}' file.fastq > file.fasta
```

### 6. **Convert FASTA to FASTQ (using default quality score)**
```bash
awk 'BEGIN{a="I"} NR%2==1{print "@"substr($0,2)} NR%2==0{print $0 "\n+"; print a length($0)}' file.fasta > file.fastq
```

### 7. **Sort VCF file by chromosomal position**
```bash
vcf-sort file.vcf > sorted_file.vcf
```

### 8. **Remove duplicate entries in a VCF file**
```bash
awk '!seen[$0]++' file.vcf > file_no_duplicates.vcf
```

### 9. **Filter VCF for a specific chromosome**
```bash
grep -P '^#|^chr1' file.vcf > file_chr1.vcf
```

### 10. **Count the number of SNPs in a VCF file**
```bash
grep -v '^#' file.vcf | wc -l
```

### 11. **Get the number of unique bases in a FASTA file**
```bash
grep -v '^>' file.fasta | tr -d '\n' | fold -w1 | sort | uniq -c
```

### 12. **Extract sequences by range from a FASTA file**
```bash
awk '/^>/{if(seqs){print seqs} seqs=""; print $0} !/^>/{seqs=seqs $0} END{if(seqs) print seqs}' file.fasta | sed -n '10,20p'
```

### 13. **Find all reads containing a specific sequence in a FASTQ file**
```bash
grep -B 1 'ATCG' file.fastq
```

### 14. **Get the GC content of a FASTA file**
```bash
grep -v '^>' file.fasta | tr -d '\n' | grep -o '[GCgc]' | wc -l
```

### 15. **Extract variant positions from a VCF file**
```bash
grep -v '^#' file.vcf | cut -f1,2 > variant_positions.txt
```

### 16. **Rename sequence identifiers in a FASTA file**
```bash
awk '/^>/{print ">new_" NR} !/^>/{print $0}' file.fasta > renamed.fasta
```

### 17. **Extract sequence for a specific ID from a FASTA file**
```bash
awk '/^>ID/{flag=1} flag && /^>/{flag=0} flag' file.fasta
```

### And a few more

#### Give a 2 column, tab separated list of read no. and read length from fastq file
`zcat whatever.fastq.gz | paste - - - - | awk '{print NR " " (length($3))}'`

----

#### Count total reads in a fastq file
`zcat whatever.fastq.gz | wc -l | awk '{print $1/4}' `

----

#### Change extension of multiple files at once.
In below example, the extension changes from *.scafSeq to *.fa

`for f in *.scafSeq; do mv "$f" "$(basename "$f" .scafSeq).fa"; done`

[rename](https://www.tecmint.com/rename-multiple-files-in-linux/) command can also come handy in such cases. For e.g.
 Rename all `.fastq` files as `.fasta`

`rename .fastq .fasta *.fastq`

----

#### Get A T G C counts for all sequences from a multi fasta file
```
echo -e "seq_id\tA\tU\tG\tC"; while read line; do echo $line | grep ">" | sed 's/>//g'; for i in A U G C;do echo $line | grep -v ">" | grep -o $i | wc -l | grep -v "^0"; done; done < test.fa | paste - - - - -
```

----

#### Counting number of sequences in a fasta file:
`grep -c "^>" file.fa`

----

#### Add something to end of all header lines:
`sed 's/>.*/&WHATEVERYOUWANT/' file.fa > outfile.fa`

----

#### Clean up a fasta file so only first column of the header is outputted:
`awk '{print $1}' file.fa > output.fa`

----

#### Count the number of sequences in clusters generating using CD-HIT:
```
for i in *.clstr; do echo $i ; grep ">Cluster" -B 1 $i --no-group-separator | paste - - | awk '{print $1"_"$2 " "$3+1}' > $i.count.txt ; done
```

#### Change extension of fastq files in batch
```
rename 's/_fastp.fastq.gz/.fq.gz/' *.gz 
```
