#import os
import sys

def Expand():
    data = []
    #in_file = os.environ["input"]
    #out_file = os.environ["output"]
    in_file = sys.argv[1]
    out_file = sys.argv[2]
    with open(in_file,'r') as input, open(out_file, 'a') as output:
        for line in input:
            data += line.split()
        left_snp = data[2::5]
        mean_rate = data[4::5]
        final_left_snp = list(range(1,int(left_snp[0])))
        final_mean_rate = [mean_rate[0]] * len(final_left_snp)
        x = 0
        while x < len(left_snp)-1:
            final_left_snp += list(range(int(left_snp[x]),int(left_snp[x+1])))
            subset_len = list(range(int(left_snp[x]),int(left_snp[x+1])))
            length = len(subset_len)
            final_mean_rate += [mean_rate[x]]*int(length)
            x += 1
        header = "Position" + '\t' + "Readdepth" + '\n'
        output.write(header)
        for index, value in enumerate(final_left_snp):
            out_line = str(value) + '\t' + str(final_mean_rate[index]) + '\n'
            output.write(out_line)

Expand()
