$my_segment = 455;
 
while ($my_segment <= 1783) {
 
$my_http ='https://nugs2.akamaized.net/hls/live/2005300/nugsph4k191229/nugsph4k191229_15000/hdntl=exp=1577775643~acl=%2f*~data=hdntl~hmac=8d67353247f737203c5113b0267a5149759a6d497d5ecfc4c9ee387f9aa0f363/0pv874b5/00000000/media_';
$my_segment;
$my_http2 = '.ts';
 
$my_string = $my_http.$my_segment.$my_http2;
 
` wget --header 'Host: nugs2.akamaized.net' --user-agent 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:71.0) Gecko/20100101 Firefox/71.0' '$my_string' -c ` ;
 
$my_cat_apppend = "media_".$my_segment.$my_http2;
 
` cat  $my_cat_apppend >> "./Media_2019_12_29_4k.ts" ` ;
 
$my_segment++;
 
 
} # end while

