#!/usr/bin/env bash

#disable "SynPS/2 Synaptics TouchPad"

xinput --disable `xinput --list --id-only "SynPS/2 Synaptics TouchPad"`
