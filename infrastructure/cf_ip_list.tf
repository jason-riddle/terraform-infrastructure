// https://dash.cloudflare.com/7880ee87feea1839fb5a815cc479b080/configurations/lists

# resource "cloudflare_list" "example" {
#   count = 1

#   account_id  = "7880ee87feea1839fb5a815cc479b080"
#   name        = "example_list"
#   description = "example IPs for a list"
#   kind        = "ip"

#   item {
#     value {
#       ip = "192.0.2.0"
#     }
#     comment = "one"
#   }

#   item {
#     value {
#       ip = "192.0.2.1"
#     }
#     comment = "two"
#   }
# }
