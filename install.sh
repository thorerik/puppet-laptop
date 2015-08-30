#!/usr/bin/env bash
set -e

sudo FACTER_home=$HOME \
  FACTER_real_id=`whoami` \
  puppet apply --modulepath=modules modules/thor/manifests/init.pp
