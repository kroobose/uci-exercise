function [X_all,y_all] = ts_uciprepro_bc( file_in, sheet )
%
% This function normalizes uci data that have been 
% processed in advance. For example, assume we have
% 
%   https://ts3.pl.cs.gunma-u.ac.jp/tsattach1/kato/180421/uci-bank-180224.xlsx
%
% Call this function by
%
%  file_in = 'uci-bank-180224.xlsx'; 
%  sheet   = 'bank.processed'; 
%  [X_all,y_all] = ts_uciprepro_bc( file_in, sheet ); 
%  file_out = 'k.bank.mat'; 
%  save( file_out, 'y_all', 'X_all' );
%  fprintf('%s written.\n',file_out);
%

[tab_num,tab_txt] = xlsread(file_in,sheet); 
tsassert( ~isnan(tab_num) ); 

[nrows,ncols] = size(tab_num); 
typs = cell(1,ncols); 
for i_col=1:ncols
  typs{i_col} = tab_txt{2,i_col}; 
end

i_y = 0;
for i_col=1:ncols
  xs = tab_num(:,i_col); 
  if strcmp( typs{i_col}, 'cn' )
    mu = mean(xs); xs = xs - mu; 
    xs_tmp1 = quantile( xs, [0.05,0.95] ); 
    x1 = xs_tmp1(1); x2 = xs_tmp1(2); 
    a1 = 2./(x2-x1); b1 = -(x1+x2)./(x2-x1); 
    xs = a1.*xs + b1; 
    xs = max(-1,min(+1,xs)); 
  elseif strcmp( typs{i_col}, 'n' )
    x1 = 0.0; x2 = quantile( xs, 0.95 ); 
    a1 = 2./(x2-x1); b1 = -(x1+x2)./(x2-x1); 
    xs = a1.*xs + b1; 
    xs = max(-1,min(+1,xs));     
  elseif strcmp( tab_txt{1,i_col}, 'y' )
    i_y = i_col; 
  elseif strcmp( typs{i_col}, 'u' )
    ;
  else
    tsassert(0); 
  end
  tab_num(:,i_col) = xs; 
end
l_x = true(1,ncols); l_x(i_y) = 0; 
X_all = tab_num(:,l_x)'; 
[npatts_all,nfeas] = size(X_all); 
cts_all  = tab_num(:,i_y); 
cts_uniq = unique( cts_all ); 

str_y = typs{i_y}; 
i1 = find(str_y == '|');
tsassert( numel(i1) == 1 ); 
str_n = str_y(1:i1-1); 
str_p = str_y(i1+1:end); 
cts_n = str2num(str_n); 
cts_p = str2num(str_p); 
% tsassert( sort( [cts_n,cts_p]' ) == cts_uniq ); 
y_all = zeros(npatts_all,1); 
for ct_p=cts_p(:)'
  y_all(cts_all==ct_p) = +1; 
end
for ct_n=cts_n(:)'
  y_all(cts_all==ct_n) = -1; 
end
r_nnz = find( y_all ~= 0 ); 
y_all = y_all(r_nnz); 
X_all = X_all(:,r_nnz); 


