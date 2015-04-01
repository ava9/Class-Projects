#!/bin/bash
sed -n '255,298p' frankenstein.txt | tr [:space:] "\n" | tr [:punct:] "\n" | tr [:upper:] [:lower:] | grep -v "^\s*$" | sort | uniq -ci | sort -n -r | head -n 10
