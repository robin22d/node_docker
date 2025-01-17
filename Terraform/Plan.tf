# creating two floating ips

resource "openstack_networking_floatingip_v2" "floating_ip" {
  pool = "${var.pool}"
}

# setting up securaty rules
resource "openstack_compute_secgroup_v2" "security_group" {
  name        = "${var.security_name}"
  description = "${var.security_description}"
  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
  rule {
    from_port   = 8080
    to_port     = 8080
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}

# settting up first instance
resource "openstack_compute_instance_v2" "instance" {
  name            = "${var.instance}"
  image_name      = "${var.image}"
  flavor_name     = "${var.flavor}"
  security_groups = ["${openstack_compute_secgroup_v2.security_group.name}"]
  key_pair        = "${var.keypair}"
  user_data       = "${file("${var.script}")}"
}

resource "openstack_compute_floatingip_associate_v2" "floating_ip" {
  floating_ip = "${openstack_networking_floatingip_v2.floating_ip.address}"
  instance_id = "${openstack_compute_instance_v2.instance.id}"
}




