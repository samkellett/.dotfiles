#!/usr/bin/env python

import os
import re
import subprocess

from string import whitespace

HOME = os.environ['HOME']

# (command, backgroud)
CMDS = [
    ("xloadimage -onroot \
                -fullscreen \
                %s/Dropbox/Screenshots/dudex2.jpg" % HOME, False),
#    ("nm-applet --sm-disable", True),
#    ("trayer --edge top \
#            --align right \
#            --SetDockType true \
#            --SetPartialStrut true \
#            --expand true \
#            --width 5 \
#            --transparent true \
#            --tint 0x000000 \
#            --height 16", True),
#    ("xscreensaver -no-splash", True),
#    ("xfce4-power-manager", False),
    ("dropbox start", False),
#    ("gnome-keyring-daemon --start --components=pkcs11", False),
]

def spawn_process(cmd, bg):
    cmd += "&" if bg else ""
    return os.system(cmd)

def run_commands(*cmds):
    stdin = None
    procs = []

    for cmd in cmds:
        proc = subprocess.Popen(cmd, stdin = stdin, stdout = subprocess.PIPE, stderr = subprocess.PIPE)
        procs.append(proc)
        stdin = proc.stdout

    for proc in procs[:-1]:
        proc.stdout.close()

    stdout, stderr = procs[-1].communicate()

    if stderr:
        raise Exception("Subprocess go boom: %s" % stderr)

    return stdout

def kill_app(app):
    stdout = run_commands(["ps", "aux"])
    lines = stdout.split('\n')

    for line in lines:
        if re.search(app, line):
            pid = line.split()[1]
            stdout = run_commands(["kill", str(pid)])

for cmd, bg in CMDS:
    app = cmd.split()[0]

    kill_app(app)
    retcode = spawn_process(cmd, bg)

    if retcode != 0:
        print "problem starting %s" % app
