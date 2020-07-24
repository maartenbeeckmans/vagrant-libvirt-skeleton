#! /bin/bash
#
# Provisioning script common for all centos basedservers

#------------------------------------------------------------------------------
# Bash settings
#------------------------------------------------------------------------------

# Enable "Bash strict mode"
set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't mask errors in piped commands

#------------------------------------------------------------------------------
# Variables
#------------------------------------------------------------------------------
# TODO: put all variable definitions here. Tip: make them readonly if possible.

#------------------------------------------------------------------------------
# Provisioning tasks
#------------------------------------------------------------------------------

log 'Starting common provisioning tasks' 
debug 'Installing updates'
yum update -y

debug 'Installing EPEL'
yum install -y epel-release

debug 'Installing base packages'
yum install -y htop iotop vim tree curl wget
log 'Common provisioning tasks finished'
