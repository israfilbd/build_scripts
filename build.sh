#!/bin/bash

#removals
rm -rf .repo/local_manifests

# Initialize repo with specified manifest
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs --depth=1

# Clone local_manifests repository
git clone -b rising https://github.com/israfilbd/local_manifests .repo/local_manifests

# Sync the repositories
/opt/crave/resync.sh

# Frameworks_base
rm -rf frameworks/base
git clone --depth=1 -b fourteen https://github.com/israfilbd/frameworks_base_rising frameworks/base

# Private Keys
rm -rf vendor/lineage-priv && git clone -b lineage21 https://github.com/israfilbd/sign_keys vendor/lineage-priv

# Set up build environment
source build/envsetup.sh
riseup RMX1901 user
make installclean
rise b
