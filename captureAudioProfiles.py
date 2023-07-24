#!/usr/bin/python

import subprocess

def runCmd(cmd: str) -> str:
    completed_process = subprocess.run(cmd, 
                                       shell=True, 
                                       capture_output=True, 
                                       text=True)

    return completed_process.stdout


all_card_info = runCmd("pactl list cards").split('\n\n')

for card in all_card_info:
    print(card)
    print("--------------------------------------")
