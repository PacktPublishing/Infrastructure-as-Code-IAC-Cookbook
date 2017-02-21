resource "openstack_objectstorage_container_v1" "releases" {
  region = "${var.region}"
  name   = "releases"
}
