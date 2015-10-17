## Packer template for Sabayon

Now you can build fresh vagrant, virtualbox and VMware Sabayon images with [packer](https://packer.io/).



Download the repository and then:

### Vagrant

    packer build -force vagrant.json

Note: vagrant images are also available in Hashicorp's Atlas: [Sabayon/spinbase-amd64](https://atlas.hashicorp.com/Sabayon/boxes/spinbase-amd64) . 

You can always download the boxes using Atlas providers link:

https://atlas.hashicorp.com/Sabayon/boxes/spinbase-amd64/versions/**[TAG]**/providers/virtualbox.box

* here **[TAG]** is the box version (*e.g. v0.10 =>  https://atlas.hashicorp.com/Sabayon/boxes/spinbase-amd64/versions/0.10/providers/virtualbox.box*)


### Virtualbox

	packer build -force virtualbox.json

### VMware

	packer build -force virtualbox.json