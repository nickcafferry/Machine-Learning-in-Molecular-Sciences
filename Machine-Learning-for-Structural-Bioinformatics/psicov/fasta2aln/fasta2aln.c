/* Convert FASTA alignment into PSICOV format alignment D.T. Jones July 2011 */

/* Copyright (C) 2011 University College London */

/* License: GPL V2 */

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

#define MAXSEQLEN 1000000

/* Skip sequences with > 90% gaps */
#define MAXGAPS 0.9

#define FALSE 0
#define TRUE 1

enum aacodes
{
    ALA, ARG, ASN, ASP, CYS,
    GLN, GLU, GLY, HIS, ILE,
    LEU, LYS, MET, PHE, PRO,
    SER, THR, TRP, TYR, VAL,
    GAP, UNK
};

const char     *rescodes = "ARNDCQEGHILKMFPSTWYVBZX";

/* Dump a rude message to standard error and exit */
void
                fail(char *errstr)
{
    fprintf(stderr, "\n*** %s\n\n", errstr);
    exit(-1);
}

/* Convert AA letter to numeric code (0-22) */
int
                aanum(int ch)
{
    static int      aacvs[] =
    {
	999, 0, 20, 4, 3, 6, 13, 7, 8, 9, 22, 11, 10, 12, 2,
	22, 14, 5, 1, 15, 16, 22, 19, 17, 22, 18, 21
    };

    return (isalpha(ch) ? aacvs[ch & 31] : 22);
}


int main(int argc, char **argv)
{
    int             i, j, ngap, naa, seqlen = 0, seqcount=0, nid;
    char            desc[MAXSEQLEN], refseq[MAXSEQLEN], seq[MAXSEQLEN], buf[MAXSEQLEN], *p;
    FILE           *ifp;

    if (argc < 2)
	fail("Usage: fasta2aln fasta-file");

    ifp = fopen(argv[1], "r");
    if (!ifp)
	fail("Unable to open fasta file!");

    for (;;)
    {
	if (!fgets(buf, MAXSEQLEN, ifp))
	    break;

	if (buf[0] == '>')
	{
	    if (seqlen)
	    {
		if (!seqcount)
		    memcpy(refseq, seq, seqlen);
		
		seqcount++;
		
		for (nid=naa=ngap=i=0; i<seqlen; i++)
		{
		    if (isalpha(refseq[i]))
		    {
			if (seq[i] == refseq[i])
			    nid++;
			naa++;
			if (!isalpha(seq[i]))
			    ngap++;
		    }
		}

//		printf("%d %d\n", nid, seqlen);
		
		if (ngap < MAXGAPS * naa)
		{
		    for (i=0; i<seqlen; i++)
			if (isalpha(refseq[i]))
			    putchar(seq[i]);
		    putchar('\n');
		}
		
		seqlen = 0;
	    }
	}
	else
	{
	    p = buf - 1;
	    while (*++p)
		if (isalpha(*p) || *p == '-' || *p == '.')
		    seq[seqlen++] = *p;
	}
    }
    fclose(ifp);

    if (seqlen)
    {
	for (nid=naa=ngap=i=0; i<seqlen; i++)
	{
	    if (isalpha(refseq[i]))
	    {
		if (seq[i] == refseq[i])
		    nid++;
		naa++;
		if (!isalpha(seq[i]))
		    ngap++;
	    }
	}

	if (ngap < MAXGAPS * naa)
	{
	    for (i=0; i<seqlen; i++)
		if (isalpha(refseq[i]))
		    putchar(seq[i]);
	    putchar('\n');
	}
    }

    return 0;
}
