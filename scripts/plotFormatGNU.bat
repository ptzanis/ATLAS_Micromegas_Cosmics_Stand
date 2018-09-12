#Script automatically created by TBSCS 
#for internal use. P 
set terminal postscript eps enhanced color font 'Helvetica,10' 
set xdata time 
set grid 
set timefmt '%m/%d/%Y_%H:%M:%S' 
set output 'C:/TB_data_20_11/plots/PSNSWGIF_board03_channel011.eps' 
#set xrange ['2017.11.19 11:32:22':'2017.11.20 11:44:13'] 
set yrange [0:650] 
set y2range [0:5] 
set y2tics 0, .5 
set ytics 50 nomirror 
set xlabel 'Time' offset 0,-2 
set ylabel 'Voltage (V)' 
set y2label 'Current (uA)' 
set ytic auto 
set y2tic auto 
set key inside left top 
plot "C:/Projects/TBSCS/TestBeamSCS/temp/vMon_PSNSWGIF_board03_channel011_20_11.dat" using 1:3 title 'PSNSWGIF board03 channel011 Voltage' with steps linewidth 1.5, \
"C:/Projects/TBSCS/TestBeamSCS/temp/iMon_PSNSWGIF_board03_channel011_20_11.dat" using 1:3 title 'PSNSWGIF board03 channel011 Current' with steps linewidth 1.5 axis x1y2 \


set output