# jrapps.org
data "cloudflare_zone" "jrapps_org" {
  name = "jrapps.org"
}

# nextcloud.jrapps.org
resource "cloudflare_record" "jrapps_org_nx15310_your_storageshare_de" {
  count = 1

  zone_id = data.cloudflare_zone.jrapps_org.id
  name    = "nextcloud"
  value   = "nx15310.your-storageshare.de"
  type    = "CNAME"
  ttl     = 1
  proxied = false

  lifecycle {
    prevent_destroy = true
  }
}
