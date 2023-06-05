1; clear; close all; 

file_in = 'uci-bank-180224.xlsx'; 
sheet   = 'bank.processed'; 
[X_all,y_all] = ts_uciprepro_bc( file_in, sheet ); 
file_out = 'k.bank.mat'; 
save( file_out, 'y_all', 'X_all' );
fprintf('%s written.\n',file_out);



