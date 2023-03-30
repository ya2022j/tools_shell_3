

## Linuxでrarファイルを圧縮・解凍する方法(CentOS)
## https://pentan.info/server/linux/rar_unrar.html

wget https://www.rarlab.com/rar/rarlinux-x64-6.0.1.tar.gz;


tar xzfv rarlinux-x64-6.0.1.tar.gz -C /usr/local/src;
# makeしてunrarをインストールします。

cd /usr/local/src/rar/;
make && make install


# 圧縮するコマンド
# $ rar a 【出力先ファイル】 【圧縮するファイル】

# $ rar a hoge.rar hoge.txt
# 解凍するコマンド
# $ unrar x 【解凍するファイル】 【出力先フォルダ】

# $ unrar x hoge.rar /home/user/hoge/
# 出力先にファイルが存在した場合に上書きする場合

# $ unrar -o+ x hoge.rar /home/user/hoge/
# 出力先にファイルが存在した場合に上書きしない場合

# $ unrar -o- x hoge.rar /home/user/hoge/
