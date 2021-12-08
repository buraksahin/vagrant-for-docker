#!/bin/bash

set -eu

vagrant destroy -f
vagrant reload
vagrant up
