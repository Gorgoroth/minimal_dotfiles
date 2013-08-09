#!/bin/bash

case "$(xset -q|grep LED| awk '{ print $10 }')" in
  "00000000")
    echo 'us'
    ;;
  "00001000")
    echo 'de'
    ;;
esac


