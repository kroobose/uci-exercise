# acc-tab1

## How make a performance assessment table
性能評価の表の作り方  
Explain a table of performance assessment such as [acctab1-kato.2002110816.pdf](./src/acc-tab/acctab1-kato.2002110816.pdf).
## Dataset file demo723.in.mat
- Untar ,[prot404-demo723-acctab1.2002110827.tgz](./src/acc-tab/prot404-demo723-acctab1.2002110827.tgz) a dataset file demo723.in.mat will be found.
The file contains the following three variables. このファイルには３個の変数が入っている．

  ```txt
    Name               Size              Bytes  Class     Attributes
    accmat_cved      100x7x15            84000  double
    dbnames            1x15               1884  cell
    meths              1x7                 798  cell
  ```

  - Variable 'dbnames' is a cell array containing 15 dataset names:  
  'ionosphere','diabetes','cmc','echocardiogram','hepatitis','seeds','ilpd', 'bank','car','australian','german','wholesale','spect','waveform2','tae' dbnames  
  は15個のデータセット名が入っているセル配列である
  - Variable 'meths' is a cell array containing seven methods:  
  'A','B','C','D','E','F','G' meths は次の7個の手法名が入っているセル配列である.
  - In variable 'accmat_cved', the 100 values of the performance measure for each method, each dataset are contained.  
  accmat_cved には各手法，各データセットをそれぞれ100回ずつ 試した時の性能評価値が入っている．
  The entry accmat_cved(cv,i_meth,i_db) is the performance measure value for a method i_meth, a dataset i_db, and a division cv.
  accmat_cved(cv,i_meth,i_db) には 手法 i_meth とデータセット i_db の cv 回目の
性能評価値が入っている．

## Generating latex code of the table. 表の latex コードを生成する．
Generate the latex code of a table from data file demo723.in.mat. An example is shown below.  
データファイル demo723.in.mat から表の latex コードを生成する例を示す．
- Run the matlab script demo723_01.m.
The script is found in [prot404-demo723-acctab1.2002110827.tgz](./src/acc-tab/prot404-demo723-acctab1.2002110827.tgz)

  ```txt
   addpath src
   demo723_01
  ```

  Then, k.demo723_01.tex is generated.
- Unzip [tex-acctab1.2002110816.zip](./src/acc-tab/tex-acctab1.2002110816.zip) and replace k.demo723_01.tex to demo723_01.tex.
- Latex-compile the demo723_01.tex by
  ```bash
  make
  ```
  on the command line of the cygwin environment. Then, [acctab1-kato.2002110816.pdf](./src/acc-tab/acctab1-kato.2002110816.pdf) is generated.

