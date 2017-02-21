output "GitLab Instance" {
  value = "gitlab: http://${openstack_compute_instance_v2.gitlab.access_ip_v4}"
}

output "GitLab Runner Instances" {
  value = "${join(" ", openstack_compute_instance_v2.runner.*.access_ip_v4)}"
}

output "Object Storage" {
  value = "Container name: ${openstack_objectstorage_container_v1.releases.name}"
}

output "Block Storage" {
  value = "${openstack_blockstorage_volume_v2.docker.description}: ${openstack_blockstorage_volume_v2.docker.name}, ${openstack_blockstorage_volume_v2.docker.size}GB"
}
