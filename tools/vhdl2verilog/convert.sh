#!/usr/bin/env bash

set -e

#Prerequisite: 
#sudo apt-get install ghdl
#ghdl -v

#SRC_FOLDER=../../HW/examples/GHRD
ZTACHIP_RTL=../../HW/src
mkdir -p build
BUILD_OUTPUT_DIRECTORY=${BUILD_OUTPUT_DIRECTORY:-build}

# Import sources
ghdl -i --std=08 --work=work --workdir=build -Pbuild \
  "$ZTACHIP_RTL"/alu/*.vhd \
  "$ZTACHIP_RTL"/dp/*.vhd \
  "$ZTACHIP_RTL"/ialu/*.vhd \
  "$ZTACHIP_RTL"/pcore/*.vhd \
  "$ZTACHIP_RTL"/soc/*.vhd \
  "$ZTACHIP_RTL"/soc/axi/*.vhd \
  "$ZTACHIP_RTL"/soc/peripherals/*.vhd \
  "$ZTACHIP_RTL"/top/*.vhd \
  "$ZTACHIP_RTL"/util/*.vhd \
  "$ZTACHIP_RTL"/*.vhd 
#  "$SRC_FOLDER"/main.vhd

# Top entity
ghdl -m --std=08 --work=work --workdir=build ztachip

# Synthesize: generate Verilog output
ghdl synth --std=08 --work=work --workdir=build -Pbuild --out=verilog ztachip > "$BUILD_OUTPUT_DIRECTORY"/ztachip.v