# jasonriddle.com
data "cloudflare_zone" "jasonriddle_com" {
  name = "jasonriddle.com"
}

resource "cloudflare_page_rule" "wp_admin" {
  count = 0

  zone_id  = data.cloudflare_zone.jasonriddle_com.id
  target   = "*jasonriddle.com/wp-admin*"
  priority = 1

  actions {
    cache_level = "bypass"
  }
}

# resource "cloudflare_page_rule" "preview" {
#   count = 1

#   zone_id  = data.cloudflare_zone.jrapps_org.id
#   target   = "*jasonriddle.com/*preview=true*"
#   priority = 2

#   actions {
#     cache_level = "bypass"
#   }
# }

# resource "cloudflare_page_rule" "preview" {
#   count = 1

#   zone_id  = data.cloudflare_zone.jrapps_org.id
#   target   = "*jasonriddle.com/*"
#   priority = 3

#   actions {
#     cache_level = "bypass"
#   }
# }
