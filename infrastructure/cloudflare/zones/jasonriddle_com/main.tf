data "cloudflare_zone" "zone" {
  name = "jasonriddle.com"
}

resource "cloudflare_page_rule" "wp_admin" {
  count = 1

  zone_id  = data.cloudflare_zone.zone.id
  target   = "*jasonriddle.com/wp-admin*"
  priority = 1

  actions {
    cache_level = "bypass"
  }
}
