# uci-exercise
UCIベンチマーキングの演習

## Purpose 目的
    Many public datasets such as UCI repositories  
  - have to be used for benchmarking several methods when studying methodologies for machine learning.  
機械学習研究において, UCI データセットなどを使って, なるだけ多くのデータセットで比較実験をしなければならない.  
  - Different datasets may be stored in different forms. To use them, appropriate pre-processing such as feature extraction, data manipulation, and normalization are required.  
  データセットは, 異なる形式で保存されているので, 必要に応じて特徴抽出, データ整形, 正規化が必要となる. 
  - Challengers of this exercise are supposed to start with downloading the data sets from some web sites, and processing them necessary to proceeding to exercises.  
  ここでは, 実際にネット上のデータセットをダウンロードするところから始めて, ベンチマーキングの練習を行う. 
## Exercise 演習問題
1.
Download the following datasets from the UCI repositories:  
次のデータセットを UCI レポジトリからダウンロードする. 
  - Australian
  - Bank
  - Car (Car Evaluation Database)
  - CMC (Contraceptive Method Choice)
  - Echo (Echocardiogram Data)
  - German (German Credit Data)
  - Hepatitis (Hepatitis Domain)
  - Ilpd (Indian Liver Patient Dataset)
  - Seeds
  - Spect (SPECT Heart)
  - Tae (Teaching Assistant Evaluation)
  - Waveform2 (Teaching Assistant Evaluation, Version 2)
  - Wholesale (Wholesale customers)

2.
See [prepro-bank](./prepro-bank.md) to manipulate the data in a common format so that the data are easily fed to machine learning programs.  
[prepro-bank](./prepro-bank.md) を参考に, 機械学習アルゴリズムに入力しやすい形式にそれぞれ整形する.  

3.
リンクが切れているため 省略.  
~~Download the following datasets from the libsvm repositories.~~  
~~次のデータセットを libsvm のデータセットからダウンロードする.~~
  - ~~Ionosphere~~
  - ~~Diabetes~~

4.
リンクが切れているため 省略.  
~~Matlab users may see
a script <a href="https://ts3.pl.cs.gunma-u.ac.jp/tsattach1/kato/180421/demo721_01.m" rel="nofollow">demo721_01.m</a>
to put each dataset in a matlab format. The script depends on the function libsvmread contained in the library LIBSVM.  
<a href="https://ts3.pl.cs.gunma-u.ac.jp/tsattach1/kato/180421/demo721_01.m" rel="nofollow">demo721_01.m</a>
を参考にして, Matlab 形式に直す. ただし, このスクリプトはLIBSVM に含まれる libsvmread という関数に依存している.~~

5.
For each dataset, divide data in each category into two subsets with ratio of 70% to 30%. The two datasets are used for training and testing, respectively.  
データセットそれぞれに対して, クラスごとに 7:3 で訓練用データと評価用データに分けよ.
  - (2021/05/15 加藤追記) 2クラス分類でないと, 先に進めないので, 最も大きいクラスを +1, それ以外を -1 にした2クラス分類に変換しましょう. 

6.
Try both L2-normalization and L1-normalization for data normalization. The regularization parameter $\lambda$ should be determined by cross-validation within a training dataset based on PRBEP.  
学習法には, 各例題に L2正規化, L1正規化それぞれを考える. それぞれに対して, 正則化パラメータ $\lambda$ の値を訓練用データ内で交差確認を用いて, PRBEP をもとに推定せよ.

7.
Compute PRBEP with the regularization parameter $\lambda$ using the testing dataset for each dataset and each normalization method.
推定した $\lambda$ を使って評価用データの PRBEP を計算せよ.

8.
Repeat the steps 5-7 ten times, to get 10 PRBEP and to get the table of P-values based on the one sample t-test.  
ステップ 5-7 を10回繰り返すことで, それぞれの方法で10個の PRBEP を算出し, one sample t-test で P 値の表を算出せよ.  
  - Note on one sample t-test：[onesmpltea1-kato.2002102222.pdf](./src/onesmpltea1-kato.2002102222.pdf)
  - (2021/04/21 加藤追記) みやくんが onesmpltea1-kato.2002102222.pdf　に掲載されているコードでは p値を算出するときの t 分布の累積密度を計算するとき, n-1 ではなく n を使っていることを見つけた.

9.
Make a table of the mean and the standard deviation of PRBEP such as [acctab1-kato.2002110816.pdf](./src/acc-tab/acctab1-kato.2002110816.pdf). For each dataset, the maximal PRBEP should be bold-faced, and the PRBEP with no significant difference from the maximal PRBEP should be underlined. See [acc-tab](./acc-tab.md).  
PRBEP の平均と標準偏差を [acctab1-kato.2002110816.pdf](./src/acc-tab/acctab1-kato.2002110816.pdf) のような表にする. ただし, 各データセットで最大の PRBEP を太字で, 最大の PRBEP と有意差がないものに下線を引く. やり方は [acc-tab](./acc-tab.md) を参照.

