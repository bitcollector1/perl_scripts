#!/usr/bin/perl
 
# fragment = Adjust this for the start point of the stream
$fragment = 5250;
 
# Initialze the counter - no need to touch this.
$piece_count = 1;
 
# arbitrary stop point - a 24 hour stream will not have 10,000 fragments
while ($fragment = 10000) {
 
# URL needed to grab the show - auth string is tied to your IP
$base_url = 'http://hlscache.blastro.com/live/ngrp:20150821_live_replay_all_hq/media_ubiyk0yc0_b2492000.abst/Seg1-Frag';
$auth_string= '?6f55b063ee4de84d260f484683d885132fe835ba20ad8acae866c2e2ba54619c4324bcdb1582acd958a27f9bcc67eac243e1430a14a2d843adadd9ed5086e2187a29bc25a7162f70fbcb29fd571c0f776cb5242d15afa5d687a6b047b748b9f728400fdab08ad77951327b4548b47d597053edb8c141b253b97f55c77d41e50ba9109182fc2d8b8c25291163abbf84a8ce6db49f16aa5c06045cd6f8dac7ca82d20f4e3e264d70cc497f6161f9ada5e4da9ca66ee94b20a1b0894d24720decb643a566673d0001a3495aef5d03c76a9ed7ad97de9979900589b772a4a6e325d2c9';
 
# Dynamic URL - the fragment will increment by 1 each iteration
$final_url = $base_url.$fragment.$auth_string;
 
# Output for keeping track of which fragment we are on
print $fragment;
 
# check to see if file is available (HTTP response code 200) - used to avoid overrunning the stream
$response = ` wget --spider --server-response '$final_url' | awk '/^ HTTP/{print $2}' `;
 
# Output for keeping track of HTTP status
print $response;
 
# If the fragment is available grab it and rename so you can build flv at the end with via AdobeHDS.php
if ($response =~ /200/)
{ ` wget '$final_url' -c -O "$piece_count.f4f" ` ;
$piece_count++;
$fragment++;
} # end if
 
# wait 7 seconds and repeat the process
sleep (7)
 
# end while

