# riddleapps.net
data "cloudflare_zone" "riddleapps_net" {
  name = "riddleapps.net"
}

# nextcloud.riddleapps.net
resource "cloudflare_record" "riddleapps_net_nx15310_your_storageshare_de" {
  count = 0

  zone_id = data.cloudflare_zone.riddleapps_net.id
  name    = "nextcloud"
  value   = "nx15310.your-storageshare.de"
  type    = "CNAME"
  ttl     = 1
  proxied = false

  # lifecycle {
  #   prevent_destroy = true
  # }
}
