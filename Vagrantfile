Vagrant.configure(2) do |config|
config.vm.provider "virtualbox" do |v|
    v.memory = 3072
    v.cpus = 2
  end
	config.vm.define "geoserver2" do |geo|
	    geo.vm.box = "ubuntu/trusty64"
	    config.vm.provision :shell, path: "bootstrap.sh"
	    #geo.vm.box = "ubuntu/xenial64"
	    geo.vm.hostname = 'geoserver2'
	
	    geo.vm.network "private_network", ip: "192.168.50.43"
	
	    # Forward georegator service port
	    geo.vm.network "forwarded_port", guest:20009, host: 20009
	    geo.vm.network "forwarded_port", guest:20008, host: 20008	
	    #  Forward the healthcheck port
	    geo.vm.network "forwarded_port", guest: 8301, host: 8301
	
	     geo.vm.synced_folder "/Users/polinab/Documents/MapBox", "/home/vagrant/Documents/MapBox_local"
             geo.vm.synced_folder "~/gitworkspace/geo", "/geo"
	    #geo.vm.synced_folder "~/Virtualenvs/geo_intellij_v2", "/Virtualenvs/geo_intellij_v2"
	
	    # This is just a safety precaution to ensure that a maybe old image is up2date
	    geo.vm.provision "shell" do |s|
	      s.inline = "/usr/bin/apt-get update"
	    end
	
	  end
	end
