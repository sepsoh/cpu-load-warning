#!/usr/bin/env php
<?php

// Sepehr Soheili\'s Fun Project 
// Enjoy !!!
// this program only work on linux
if(php_uname('s') == 'Linux'){
  echo 'running -----';
  $arr = ['+----','-+---','--+--','---+-','----+'];
  $runCounter = 0;
  $lastNotiSend = 0;

  while(1){
    sleep(1);

    $cpuLoad = system('uptime | grep -P -o "(?<=load average: )[^,]+"');
    $coreNum = system('cat /proc/cpuinfo | grep -P "processor" | wc -l');
    system('clear');
    $Load = round(($cpuLoad / $coreNum)*100);
    echo "running ".$arr[$runCounter % 5];
    $runCounter++;
    if($Load > 99 and (time()-$lastNotiSend)>(300)){
      system("notify-send -i abrt 'CPU percentage $Load %' ");
      $lastNotiSend = time();
    }
  }
}else{
  echo 'this program only work on linux !! ';
}
