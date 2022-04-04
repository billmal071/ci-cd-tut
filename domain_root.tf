resource "digitalocean_domain" "default" {
  name       = "billytest.hopto.org"
  ip_address = digitalocean_droplet.www-1.ipv4_address
}
