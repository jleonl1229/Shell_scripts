#!/bin/bash

ip a | grep "scope global" | awk '{print $2}' | tr '/' '\n'

