# resource "cloudflare_access_rule" "tor_exit_nodes" {
#   count = 1

#   zone_id = "0da42c8d2132a9ddaf714f9e7c920711"
#   notes   = "Requests coming from known Tor exit nodes"
#   mode    = "challenge"
#   configuration {
#     target = "country"
#     value  = "T1"
#   }
# }
