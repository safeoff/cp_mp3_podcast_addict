#!/bin/bash
#Podcast Addictのフォルダからmp3をコピーする

y="../../Android/data/com.bambuna.podcastaddict/files/podcast/"
p=("Misreading Chat" "Turing Complete FM" "dex.fm" "Rebuild")
q="../../Music/mp3data"

# 重複チェック
IFS=$'\n'
<<<<<<< HEAD
for n in "${p[@]}"; do
    find "$y$n" -type f >> a
done
=======
for n in "${#p[@]}"; do
    find "$y${p[$n]}" -type f >> a
done

>>>>>>> 9fe05adf788009f3955485e2e09ec31aa2b64391
c=`sort a ignore.txt | uniq -u`
rm a

# コピーする・ignore.txtに書き出す
for d in $c; do
    cp $d $q/`basename $d`
    echo "$d" >> ignore.txt
    echo $d
done

# ignore.txtの行数を制限する
if [ `cat ignore.txt | wc -l` -gt 10 ] ; then
    sed -e '11,$d' ignore.txt > e
    mv e ignore.txt
fi
