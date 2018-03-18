# outputting the adress for the Jenkins server
output "Jenkins Adress" { value = "${openstack_networking_floatingip_v2.floating_ip.address}" }

