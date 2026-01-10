#!/bin/bash

sleep 1

if eww active-windows | rg -q "bottom-notifier"; then
  eww close bottom-notifier
fi
