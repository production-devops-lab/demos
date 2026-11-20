# Challenge solution: postcard or sealed letter?

**The challenge:** `http://shop.example/cart` and `https://shop.example/cart`: what can the café Wi-Fi read in each?

| | `http://shop.example/cart` (a postcard) | `https://shop.example/cart` (a sealed letter) |
|---|---|---|
| The two IP addresses (To and From) | yes | yes |
| The site's name, `shop.example` | yes | usually yes (sent at the start, in the hello) |
| When you talk, and how much | yes | yes |
| The page you ask for, `/cart` | **yes** | no |
| What you type and send (name, address) | **yes** | no |
| The reply: the page itself | **yes** | no |

**In short:** with HTTP the café Wi-Fi can read (and even change) everything. With HTTPS it still sees
*where* you go, but not *what* you say: the outside of the envelope, never the letter inside.

**Good to know:** the part after the name (`/cart`) travels inside the sealed letter, so it stays hidden with
HTTPS. The name `shop.example` usually stays visible, because the browser says it in the first "hello". A
newer extension of TLS can hide it too, but not every site uses it yet.
