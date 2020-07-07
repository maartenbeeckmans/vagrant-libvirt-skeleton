# vagrant-libvirt-skeleton

A vagrant skeleton for hosting virtual machines on libvirt

## requirements

The plugin `vagrant-libvirt` must be installed.

## Usage

All the virtual machines are defined in the file `vagrant-hosts.yml`.

There is a virtual machine named `minikube` where minikube is automatically installed. To start this virtual machine run the following command:

```bash
vagrant up minikube
```

When the virtual machine is installed, finish the installation with the following commands:

```bash
vagrant ssh minikube
[vagrant@minikube ~]$ minikube start --driver podman
