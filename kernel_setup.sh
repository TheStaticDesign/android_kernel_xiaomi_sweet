#!/bin/bash
#
# Copyright (c) 2021 CloudedQuartz
#

# Script to set up environment to build an android kernel
# Assumes required packages are already installed

# Config
CURRENT_DIR="$(pwd)"
KERNELNAME="Delta"
KERNEL_DIR="$CURRENT_DIR"
AK_REPO="https://github.com/TheStaticDesign/AnyKernel3"
AK_BRANCH="sweet"
AK_DIR="$HOME/AnyKernel3"
TC_DIR="$HOME/proton-clang"
# End Config

# clone_tc - clones proton clang to TC_DIR
clone_tc() {
	git clone --depth=1 https://github.com/kdrag0n/proton-clang.git $TC_DIR
}

# Clones anykernel
clone_ak() {
	git clone $AK_REPO $AK_DIR -b $AK_BRANCH
}
# Actually do stuff
clone_tc
clone_ak

# Run build script
. ${CURRENT_DIR}/kernel_build.sh
