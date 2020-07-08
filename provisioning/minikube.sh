#! /bin/bash
#
# Provisioning script for node1

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

# Location of provisioning scripts and files
export readonly PROVISIONING_SCRIPTS="/vagrant/provisioning/"
# Location of files to be copied to this -agent
export readonly PROVISIONING_FILES="${PROVISIONING_SCRIPTS}/files/${HOSTNAME}"

#------------------------------------------------------------------------------
# "Imports"
#------------------------------------------------------------------------------

# Utility functions
source ${PROVISIONING_SCRIPTS}/util.sh
# Actions/settings common to all -agents
source ${PROVISIONING_SCRIPTS}/common.sh

#------------------------------------------------------------------------------
# Provision -agent
#------------------------------------------------------------------------------

log "Starting -agent specific provisioning tasks on ${HOSTNAME}"
debug "Downloading latest version of minikube"
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm
debug "Installing minikube"
rpm -ivh minikube-latest.x86_64.rpm
debug "Installing podman"
yum install -y podman
log "Server specific provisioning tasks for ${HOSTNAME} finished"

log "To start minikube on the created virtual machine, run the following command after connecting with ssh"
debug "minikube start --driver podman"
