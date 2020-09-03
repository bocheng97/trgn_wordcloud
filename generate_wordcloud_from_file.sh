#!/usr/bin/bash

echo "Successfully run for $USER";

file='/home/boc/trgn_wordcloud/my_webpages.txt'
i=1
while read line;do
echo "Line No. $i:$line"
wget -O /home/boc/trgn_wordcloud/current_pages/file$i\.html $line 
html2text.py /home/boc/trgn_wordcloud/current_pages/file$i\.html >> /home/boc/trgn_wordcloud/current_pages/my_current.txt
i=$((i+1))
done < $file
wordcloud_cli --text /home/boc/trgn_wordcloud/current_pages/my_current.txt --imagefile /home/boc/trgn_wordcloud/current_pages/my_current.png --mask /home/boc/trgn_wordcloud/5F415000-7DF7-44DE-A0CD-EFBF23E2FE82.png --colormask /home/boc/trgn_wordcloud/5F415000-7DF7-44DE-A0CD-EFBF23E2FE82.png --background white --max_font_size 25 --min_word_length 4
cp /home/boc/trgn_wordcloud/current_pages/my_current.png /home/boc/public_html
echo done 
