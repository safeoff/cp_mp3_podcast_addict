#!/bin/bash
#Podcast Addictのフォルダからmp3をコピーする

# 元ファイルと保存先の場所
x="../../"
y="Android/data/com.bambuna.podcastaddict/files/podcast/"
p=("Misreading Chat" "Turing Complete FM" "dex.fm" "Rebuild")
q="Music/mp3data"
k="app/cp_mp3_podcast_addict/"

# ファイルをさがす
IFS=$'\n'
for n in "${p[@]}"; do
    if [ -e $x$y$n ]; then
        find "$x$y$n" -type f >> a
    fi
done

# 重複チェック
if [ -e a ]; then
    sort a $x${k}ignore.txt | uniq -d > l
    c=`sort a l | uniq -u`
    rm a
    rm l
fi

# コピーする・ignore.txtに書き出す
for d in $c; do
    cp $d $x$q/`basename $d`
    echo "$d" >> $x${k}ignore.txt
    echo cp: `basename $d`
done

# ignore.txtの行数を制限する
if [ `cat ignore.txt | wc -l` -gt 30 ] ; then
    tail -n 30 $x${k}ignore.txt > e
    mv e $x${k}ignore.txt
fi
