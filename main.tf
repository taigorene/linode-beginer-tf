# linode
resource "linode_instance" "example_instance" {
  label             = var.linode_instance_name
  image             = "linode/ubuntu20.04"
  region            = "us-central"
  type              = "g6-nanode-1"
  authorized_keys   = [var.linode_ssh_key]
  root_pass         = var.linode_root_pass
  
  provisioner "file" {
    source = "setup_script.sh"
    destination = "/tmp/setup_script.sh"
    connection {
      type = "ssh"
      host = self.ip_address
      user = "root"
      password = var.linode_root_pass
    }
  }
  
  provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/setup_script.sh",
        "/tmp/setup_script.sh",
        "sleep 1"
    ]
    connection {
      type = "ssh"
      host = self.ip_address
      user = "root"
      password = var.linode_root_pass
    }
  }

}

# domain
resource "linode_domain" "example_domain" {
  domain = "example.taigo.io"
  soa_email = "taigorene@gmail.com"
  type = "master"
}

# domain record
resource "linode_domain_record" "example_domain_record" {
  domain_id = linode_domain.example_domain.id
  name = "example.taigo.io"
  record_type = "A"
  target = linode_instance.example_instance.ip_address
  ttl_sec = 300

  depends_on = [ linode_instance.example_instance ]

}

# firewall
resource "linode_firewall" "example_firewall" {
  label = "example_firewall"
  inbound {
    label = "allow-http"
    action = "ACCEPT"
    protocol = "TCP"
    ports = "80,22"
    ipv4 = ["0.0.0.0/0"]
    ipv6 = ["ff00::/8"]
  }
  inbound_policy = "DROP"

  outbound_policy = "ACCEPT"

  linodes = [ linode_instance.example_instance.id ]

  depends_on = [ linode_instance.example_instance ]
}