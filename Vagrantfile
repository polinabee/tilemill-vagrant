Vagrant.configure(2) do |config|

      config.vm.define "geoserverdemo" do |geodemo|
	    geodemo.vm.box = "ubuntu/trusty64"
	    config.vm.provision :shell, path: "bootstrap.sh"
            #geodemo.vm.box = "ubuntu/xenol64"
	    #geodemo.vm.hostname = 'geoserverdemo'

	    geodemo.vm.network "private_network", ip: "192.168.50.43"

	    # Forward georegator service port
	    #geo.vm.network "forwarded_port", guest:8300, host: 8300

	    #  Forward the healthcheck port
	    #geo.vm.network "forwarded_port", guest: 8301, host: 8301

            geodemo.vm.provider :virtualbox do |vb|
         	vb.customize ["modifyvm", :id, "--memory", "2048"]
          	vb.customize ["modifyvm", :id, "--cpus", "2"]
      	    end
	    geodemo.vm.synced_folder "~/gitworkspace/geo", "/geo"
	    geodemo.vm.synced_folder "~/Virtualenvs/geo_intellij_v2", "/Virtualenvs/geo_intellij_v2"

	    # This is just a safety precaution to ensure that a maybe old image is up2date
	    geodemo.vm.provision "shell" do |s|
	      s.inline = "/usr/bin/apt-get update"
	    end

	  end
end
