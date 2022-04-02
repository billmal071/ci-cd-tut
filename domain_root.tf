resource "digitalocean_domain" "default" {
  name       = "billy-test.com"
  ip_address = digitalocean_droplet.www-1.ipv4_address
}
