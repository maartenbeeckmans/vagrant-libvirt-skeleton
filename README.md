# vagrant-libvirt-skeleton

A vagrant skeleton for hosting virtual machines on libvirt

## requirements

The plugin `vagrant-libvirt` must be installed.

## Usage

All the virtual machines are defined in the file `vagrant-hosts.yml`.

Every virtual machine must have a provisioning script in the directory `provisioning/<vm_name>.sh`

## Example usage

There is a virtual machine with the name `docker` defined in `vagrant-hosts.yml`, to bring up the virtual machine, run the following command:

```bash
vagrant up docker
```

