#to pull columns from one file and return in a new file or do something to them
#to run script: python3 <name of script> <input file 1> ...


#imports a module called sys which allows you to call files and variables through arguments
import sys

#to pull data from file:
def pull_data():
	data = []
	peaks = []
	with open("Liver-2macs_peaks.xls", 'r') as macs_data:
		for line in macs_data:
			if line.startswith("#"):
				continue
			else:
				data += line.split()
		Chr=data[10::10]
		Start=data[11::10]
		End=data[12::10]
		Length=data[13::10]
		Summit=data[14::10]
		Pileup=data[15::10]
		Fold=data[17::10]
		for index,value in enumerate(Chr):
			peaks.append(value)
			peaks.append(Start[index])
			peaks.append(End[index])
			peaks.append(Length[index])
			peaks.append(Summit[index])
			peaks.append(Pileup[index])
			peaks.append(Fold[index])
	return peaks 
	
	
	
	
	
def pull_data1():
	data = []
	TSS  = []
	with open("transcriptStart.gtf",'r') as TSS_data:
		for line in TSS_data:
			if line.startswith("#"):
				continue
			else:
				data += line.split()
		start=data[3::12]
		end=data[4::12]
		for index,value in enumerate(start):
			TSS.append(value)
			TSS.append(end[index])
	return TSS
			
	
	
def compare():
	peaks=pull_data()
	TSS=pull_data1()
	Chr=peaks[0::7]
	Start=peaks[1::7]
	End=peaks[2::7]
	Length=peaks[3::7]
	Summit=peaks[4::7]
	Pileup=peaks[5::7]
	Fold=peaks[6::7]
	start_TSS=TSS[0::2]
	end_TSS=TSS[1::2]
	x=0
	with open("trymeensembleT1", 'a') as out:
		Header="ChrScaffold" + '\t' +"Start" + '\t' +"End" + '\t' +"Length" + '\t' + "Summit" +'\t' + "Pileup" + '\t' + 'Fold'  + '\n'
		out.write(Header)
		while x < len(Chr):
			for index,value in enumerate(start_TSS):
				if int(Start[x]) >= int(value) and int(End[x]) <= int(end_TSS[index]):
					out.write(str(Chr[x]) + '\t' + str(Start[x]) + '\t' + str(End[x]) + '\t' + str(Length[x]) + '\t' + str(Summit[x]) + '\t' + str(Pileup[x]) + '\t' + str(Fold[x]) + '\t' +'\n')
			x+=1
	



	
