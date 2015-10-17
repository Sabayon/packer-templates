## Packer template for Sabayon

Now you can build fresh vagrant, virtualbox and VMware Sabayon images with [packer](https://packer.io/).

Download the repository and then, choose on what are you interested in:

### Vagrant

    packer build -force vagrant.json

Note: vagrant images are also available in Hashicorp's Atlas: [Sabayon/spinbase-amd64](https://atlas.hashicorp.com/Sabayon/boxes/spinbase-amd64). 

If you have Vagrant this should be straightforward:

	vagrant init Sabayon/spinbase-amd64; vagrant up --provider virtualbox

You can always download the boxes using Atlas providers link:

 *https://atlas.hashicorp.com/Sabayon/boxes/spinbase-amd64/versions/**[TAG]**/providers/virtualbox.box*

* here **[TAG]** is the box version (*e.g. v0.10 =>  https://atlas.hashicorp.com/Sabayon/boxes/spinbase-amd64/versions/0.10/providers/virtualbox.box*)


### Virtualbox

	packer build -force virtualbox.json

### VMware

	packer build -force vmware.json


## Credentials

The **root** user has the **root** password, so if you are going to deploy this image, you want to change that.
There is the user "vagrant" with password **vagrant** that can be accessed by issuing "vagrant ssh" (pubkeys are the insecure ones needed by Vagrant).
