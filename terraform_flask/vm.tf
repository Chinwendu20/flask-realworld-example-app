



resource "google_compute_instance" "private-server" {



 
	name = "backend-server"
	machine_type = "e2-medium"
	zone = "us-central1-c"

	boot_disk {
		initialize_params {
		image = "ubuntu-os-cloud/ubuntu-2004-lts"
		}
}

	network_interface{
		network = "sca-cloud-project"

		access_config {
	}
}
         provisioner "file" {
    source      = "./ansible_installation_script.sh"
    destination = "/home/chinwenducecilia1/ansible_installation_script.sh"
  }

      provisioner "file" {
    source      = "./nginx_config_file"
    destination = "/home/chinwenducecilia1/nginx_config_file"
  }

       provisioner "file" {
    source      = "./playbook.yml"
    destination = "/home/chinwenducecilia1/playbook.yml"
  }

       provisioner "file" {
    source      = "./python_installation_script.sh"
    destination = "/home/chinwenducecilia1/python_installation_script.sh"
  }

  connection {
    host     = "${google_compute_instance.private-server.network_interface.0.access_config.0.nat_ip}"
    type     = "ssh"
    user     = "root"
    password = "password"
    agent    = "false"
  }
  provisioner "remote-exec" {
    inline = [
      "bash /home/chinwenducecilia1/ansible_installation_script.sh",
      "ansible-playbook playbook.yml",
    ]
  }
}

resource "google_compute_address" "database-ip" {
  name = "database-ip"
  address_type = "INTERNAL"
  address      = "10.0.42.42"
  region       = "us-central1"
}



resource "google_compute_instance" "private-server" {




        name = "backend-server"
        machine_type = "e2-medium"
        zone = "us-central1-c"

        boot_disk {
                initialize_params {
                image = "ubuntu-os-cloud/ubuntu-2004-lts"
                }
}

        network_interface{
                network = "sca-cloud-project"
             access_config {
      nat_ip = google_compute_address.database-ip.address
    }

               
}
      
      provisioner "file" {
    source      = "./ansible_installation_script.sh"
    destination = "/home/chinwenducecilia1/ansible_installation_script.sh"
  }
          provisioner "file" {
    source      = "./ansible_config_for_db_server.yml"
    destination = "/home/chinwenducecilia1/ansible_config_for_db_server.yml"
  }
  
    connection {
    host     = "${google_compute_address.database-ip.address}"
    type     = "ssh"
    user     = "root"
    password = "password"
    agent    = "false"
  }
  provisioner "remote-exec" {
    inline = [
      "bash /home/chinwenducecilia1/ansible_installation_script.sh",
      "ansible-playbook ansible_config_for_db_server.yml",
    ]
  }

   
}
