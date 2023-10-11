data "cloudflare_zone" "zone" {
  name = "riddleapps.net"
}

# resource "cloudflare_record" "riddleapps_net_nx15310_your_storageshare_de" {
#   count = 1

#   zone_id = data.cloudflare_zone.zone.id
#   name    = "nextcloud"
#   value   = "nx15310.your-storageshare.de"
#   type    = "CNAME"
#   ttl     = 1
#   proxied = false
# }
