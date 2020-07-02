#! /bin/bash
#
# Provisioning script for puppet bolt

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

log "Starting specific provisioning tasks on ${HOSTNAME}"
debug "Removing old versions of docker"
yum remove -y docker \
  docker-client \
  docker-client-latest \
  docker-common \
  docker-latest \
  docker-latest-logrotate \
  docker-logrotate \
  docker-engine
debug "Adding docker repository"
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
debug "Installing docker engine"
yum install -y docker-ce docker-ce-cli containerd.io
debug "Starting and enabling docker service"
systemctl start docker
systemctl enable docker
debug "Adding vagrant user to docker"
gpasswd -a vagrant docker
debug "Running hello-world image"
docker run hello-world
log "Server specific provisioning tasks for ${HOSTNAME} finished"
