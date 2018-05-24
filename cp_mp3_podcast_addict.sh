#!/bin/bash
#Podcast Addictのフォルダからmp3をコピーする

y="~/storage/shared/Android/data/com.bambuna.podcastaddict/files/podcast/"
p=("Misreading Chat" "Turing Complete FM" "dex.fm" "Rebuild")
q="~/storage/shared/Music/mp3data"
k="~/storage/shared/app/cp_mp3_podcast_addict/"

# 重複チェック
IFS=$'\n'
for n in "${p[@]}"; do
    if [ -e $y$n ]; then
        find "$y$n" -type f >> a
    fi
done
if [ -e a ]; then
    c=`sort a ~${k}ignore.txt | uniq -u`
    rm a
fi

# コピーする・ignore.txtに書き出す
for d in $c; do
    cp $d $q/`basename $d`
    echo "$d" >> ${k}ignore.txt
    echo $d
done

# ignore.txtの行数を制限する
if [ `cat ignore.txt | wc -l` -gt 10 ] ; then
    sed -e '11,$d' ${k}ignore.txt > e
    mv e ${k}ignore.txt
fi
