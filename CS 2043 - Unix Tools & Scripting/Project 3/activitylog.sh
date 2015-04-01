#! /bin/bash
#set delimiter to comma
awk ' BEGIN {FS = ","; w = 0; r = 0; f = 0}{	
#add ending time to total 
	if ($2 ~ /end/){
		if ($2 ~ /work/){
			w = w + $3			
		}
		if ($2 ~ /run/){
			r = r + $3			
		}
		if ($2 ~ /farmers market/){
			f = f + $3			
		}
	}
#subtract starting time from total	
	if ($2 ~ /start/){
		if ($2 ~ /work/){
			w = w - $3			
		}
		if ($2 ~ /run/){
			r = r - $3			
		}
		if ($2 ~ /farmers market/){
			f = f - $3			
		}
	}
}
#store results (total activity time)
END {
	print "Total Time (hours)";
	print "Work: "w"";
	print "Run: "r"";
	print "Farmers Market: "f"";
}' < activity_log.csv > results.txt
#print results
cat results.txt
#remove temp file
rm -r results.txt
