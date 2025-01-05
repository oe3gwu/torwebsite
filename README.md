[![tor-logo](https://user-images.githubusercontent.com/46316908/134797723-e3b5c0fc-c6d8-49a6-b685-f3d869edf141.png)](https://torproject.org/)

# What is TorWebsite?

A container to host website on Tor hidden service with .onion address. Tor is free software and an open network that helps you defend against traffic analysis, enabling anonymous communication. ".onion" is a special-use top level domain name designating a "hidden service" on the Dark Web, reachable via the Tor network/accessed via the Tor browser.

## Container Image: [View on DockerHub](https://hub.docker.com/r/sandeshy/torwebsite)

# How to use this image

★ **Run container for the first time:**

```sh
.setup.sh
```

★ **Check your .onion addresss**

## Configs:

\* Tor config - /etc/tor/torrc</br> \* Nginx config - /etc/nginx/http.d/nginx.conf</br>

## Logs:

/var/log/nginx

## Gotcha/Q&A

**Will I get new .onion address each time?**</br>
Onion address is generated for each new container, if you are using the same container it won't change ever.

**Are any ports exposed?**</br>
No, tor is running inside container which connects to Network using Virtual Ethernet.

**How much time it takes for website to get live?**</br>
5-8 seconds with normal Internet Speed. If your connectivity is weak, try waiting for few mins till Tor picks some relay as introduction point and adds new entry in Distributed Hash Table (DHT). More info [here](https://tor.stackexchange.com/questions/672/how-do-onion-addresses-exactly-work/674#674).

## Disclaimer

TorWebsite is created to make hosting website on Tor easy and it's not responsible for any misuse or illegal purposes.

Feel free to discuss any issue or new feature at [GitHub Discussions](https://github.com/3xploitGuy/torwebsite/discussions).

## License

TorWebsite is under the terms of the [GNU General Public License](https://www.gnu.org/licenses/gpl-3.0.en.html).
