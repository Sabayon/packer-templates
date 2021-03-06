## Packer template for Sabayon

Now you can build fresh vagrant, virtualbox and VMware Sabayon images with [packer](https://packer.io/).

those are the variables that can be tweaked:

      "root_username":"root",
      "root_password":"root",
      "build":"DAILY", 
      "build_type":"daily",
      "arch":"amd64",
      "disk_size":"60000",
      "vagrant":"vagrant",
      "flavor":"SpinBase"

while some of them are self-explanatory, those are the interesting to punt to a specific build type:

* **flavor**: you can tweak what iso is going to be converted to an image : "SpinBase", "SpinBase-dev", "Minimal"
* **vagrant**: if set to vagrant, it will be configured the vagrant user automatically
* **build** && **build_type**: it refeers at the location and type of the build

Note: use the images.json for custom builds, vagrant.json is used for Atlas automatic building system

Download the repository and then, choose on what are you interested in:

### Vagrant

    packer build -var "vagrant=vagrant" -only virtualbox-iso images.json

Note: vagrant images are also available in Hashicorp's Atlas: [Sabayon/spinbase-amd64](https://atlas.hashicorp.com/Sabayon/boxes/spinbase-amd64). 

If you have Vagrant this should be straightforward:

	vagrant init Sabayon/spinbase-amd64; vagrant up --provider virtualbox

You can always download the boxes using Atlas providers link:

 *https://atlas.hashicorp.com/Sabayon/boxes/spinbase-amd64/versions/**[TAG]**/providers/virtualbox.box*

* here **[TAG]** is the box version (*e.g. v0.10 =>  https://atlas.hashicorp.com/Sabayon/boxes/spinbase-amd64/versions/0.10/providers/virtualbox.box*)


### Virtualbox

If you want to build a SpinBase, withouth vagrant credentials, you have to run:

	packer build -var "flavor=SpinBase" -var "vagrant=" -only virtualbox-iso images.json

Note: This will produce a vagrant box as well

### VMware

    packer build -var "flavor=SpinBase" -var "vagrant=" -only vmware-iso images.json


### QEMU

    packer build -var "flavor=SpinBase" -var "vagrant=" -only qemu images.json

### Docker

    docker build --rm --no-cache -t packer-sabayon .
    docker run --privileged=true --device /dev/vboxdrv:/dev/vboxdrv  -v $(pwd):/root --rm -ti packer-sabayon:latest /usr/bin/packer build -var 'flavor=Server' -var 'vagrant=vagrant' -var 'guest_additions=virtualbox' -var 'extra=extra' -only virtualbox-iso images.json    

## Credentials

The **root** user has the **root** password, so if you are going to deploy this image, you want to change that.

Optional:
If you enabled the build with vagrant, a user "vagrant" with password **vagrant** will be created. That can be accessed by issuing "vagrant ssh" (pubkeys are the insecure ones needed by Vagrant).
