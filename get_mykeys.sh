#!/bin/bash
yacite read pubcit | yacite filter myown | yacite exec -n 'print key' | sort
