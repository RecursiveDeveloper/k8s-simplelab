OWNER = "vagrant"
SYNCFOLDER = "/opt/course_files"

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.boot_timeout = 480
  config.vm.synced_folder "./course_files", "/opt/course_files"

  config.vm.network "forwarded_port", guest: 8081, host: 8081

  config.vm.provider "virtualbox" do |vb|
    vb.name = "k8s-simplelab"
    vb.memory = 4096
    vb.cpus = 3
  end

  config.vm.provision "shell", path: "./provisioners/install_additional_tools.sh"
  config.vm.provision "shell", path: "./provisioners/install_k8s.sh", args: "#{OWNER}"
  config.vm.provision "shell", path: "./provisioners/apply_manifests.sh", args: "#{OWNER} #{SYNCFOLDER}"
end