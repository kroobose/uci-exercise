# prepro bank
## Neccesity of pre-processing such as normalization. 前処理＆正規化の必要性
- 機械学習分野において汎用的な方法を発表する際, ウェブ上で公開されている多数のデータセットでの検証を求められる. 
- 公開データセットで性能評価するには, まず, データを整形(前処理)して正規化を施す必要がある. 
- 前処理＆正規化は, 多くの場合, データを観察しながら, 多少の試行錯誤が必要になる. 
- ここでは, UCI Dataset の Bank を取り上げ, 前処理＆正規化の一例をあげる. 
- ただし, ここで用いた方法は, やや小さめなデータセットにしか適用できない. 多くの場合, Python などで前処理のスクリプトをデータセットごとに書く必要がある. 
- 必ず再現性(reproducability)を維持すること. 
- (2021/01/03, 加藤) 近年, 急激に公開ライブラリなどが整備されて, ここに紹介したツールを使う必要はなくなった. jupyter 上で pandas などを使って前処理するのがいいみたいだが, 加藤は追いついていない. 

## Pre-processing method. 前処理の方法
- o: Replace variable such as &quot;large&quot; &quot;small&quot; to some numerical values. 大小を表す変数を数値に変換する
- c: Transform the variable uwing dummy variable expression. ダミー変数表記にする. 
- u: Do nothing. なにもしない. 
- del: Delete the vairable. 削除

## 正規化の方法
- cn: centerize &amp; normalize
  - Affine-transform the value so that 5%-values and 95%-values are replaced to -1 and +1, respectively. 
  - 5%値が -1 に, 95%値が +1 になるようにアファイン変換する. 
- n: normalize
  - Linear-transform the value so that 95%-values are replaced to +1.
  - 95%値が +1 になるように線形変換する

## Preprocess Bank. Bank の前処理＆正規化

1. Downlaod [bank.csv](./src/prepro-bank/bank.csv) and [bank-names](./src/prepro-bank/bank-names.txt)
- Read bank.names.txt to determine appropriate pre-processing and normalization recipe for each feature.  
bank.names.txt などを参考にして, 
次の各特徴に上記前処理＆正規化を行うこととする. 
  - age: u, cn
  - job: c
  - marital: c
  - education: o
  - default: o
  - balance:	u, cn
  - housing:	o
  - loan: o
  - contact: u, c
  - day: u, cn
  - duration: cn
  - campaign: u, n
  - pdays: del
  - previous: u, n
  - poutcome: u, n
- The target of the dataset takes &quot;yes&quot; or &quot;no&quot;.
Labels &quot;yes&quot; and &quot;no&quot; are assigned to positive and negative classes, respectively.  
ターゲットは yes か no で与えられている. yes を陽性, no を陰性に割り当てることにする. 

2. To do the pre-processing and normalizatoin, 上記のように前処理＆正規化を行うために, 
- Read the two files bank.csv and bank-names.txt to make two sheets named &quot;bank.data&quot; and &quot;k.bank.names&quot; found in [uci-bank-180224.xlsx](./src/prepro-bank/uci-bank-180224.xlsx) by the following way:
  1. Rename &quot;bank.csv&quot; to &quot;bank.txt&quot; and read it by MS-Excel.
  2. Add a sheet &quot;k.bank.names&quot; and write the recipe in the sheet.

3. Launch &quot;TsCateNumeConverter&quot; in [tslauncher1_selected.1906241114.jar](./src/prepro-bank/tslauncher1_selected.1906241114.jar)
Copy-and-paste the sheet &quot;bank.data&quot; into the upper table of the java application, and copy-and-paste the sheet &quot;k.bank.names&quot; into the middle table. Push &quot;Convert&quot; and push &quot;Impute&quot; to impute missing values. The preprocessing results are stored in the bottom table.  
シート「bank.data」を上のテーブルに Paste し, シート「k.bank.names」を2段目のテーブルに Paste する. そして, convert を押し, 欠損値を Impute で補完する. 

4. Create a new sheet in the MS-Excel file, and name it as &quot;bank.processed&quot;.  Copy-and-paste the bottom table in the Java application into the new sheet in the MS-Excel file. The second row in the sheet have to be written manually.  
「TsCateNumeConverter」の下の段の内容を MS-Excel に貼り付けて [uci-bank-180224.xlsx](./src/prepro-bank/uci-bank-180224.xlsx)
のシート「bank.processed」を作る. このシートに正規化の方法や陽性・陰性の指定を手動で書き込む必要がある. 

5. Use the script [demo722_01.m](./src/prepro-bank/demo722_01.m)
to normalize the data and to transform it in the matlab format [k.bank.mat](./src/prepro-bank/k.bank.mat). Therein, the script demo722_01.m invokes [ts_uciprepro_bc.m](./src/prepro-bank/ts_uciprepro_bc.m).
