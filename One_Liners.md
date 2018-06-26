# Shell one liners, using awk or something else!

#### Give a 2 column, tab separated list of read no. and read length from fastq file
`zcat whatever.fastq.gz | paste - - - - | awk '{print NR " " (length($3))}'`


#### Count total reads in a fastq file
`zcat whatever.fastq.gz | wc -l | awk '{print $1/4}' `

#### Change extension of multiple files at once.
In below example, the extension changes from *.scafSeq to *.fa

`for f in *.scafSeq; do mv "$f" "$(basename "$f" .scafSeq).fa"; done`

[rename](https://www.tecmint.com/rename-multiple-files-in-linux/) command can also come handy in such cases. For e.g.
 Rename all `.fastq` files as `.fasta`

`rename .fastq .fasta *.fastq`

#### Get A T G C counts for all sequences from a multi fasta file
`echo -e "seq_id\tA\tU\tG\tC"; while read line; do echo $line | grep ">" | sed 's/>//g'; for i in A U G C;do echo $line | grep -v ">" | grep -o $i | wc -l | grep -v "^0"; done; done < test.fa | paste - - - - -`

#### Counting number of sequences in a fasta file:
`grep -c "^>" file.fa`

#### Add something to end of all header lines:
`sed 's/>.*/&WHATEVERYOUWANT/' file.fa > outfile.fa`

#### Clean up a fasta file so only first column of the header is outputted:
`awk '{print $1}' file.fa > output.fa`
