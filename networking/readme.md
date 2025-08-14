We’ll use NGINX Ingress Controller (common choice, works for local & cloud) and add things like:

Host-based routing (e.g., sample.selar.co)

Path-based routing

TLS termination (self-signed or AWS ACM)

Security annotations (IP whitelisting, rate limiting)

**TLS Certificate

For production AWS:

Use AWS ACM to create a TLS certificate for sample.selar.co.

Annotate your Ingress for AWS Load Balancer Controller if using it.

***For local Minikube/Kind:

Use mkcert or openssl to create a self-signed cert:

****Practical Networking Controls

We’re implementing:

TLS encryption — ensures HTTPS traffic.

IP Whitelist — restricts access to certain networks (editable).

Rate limiting — prevents abuse by limiting requests/sec.

Request size limits — prevents large malicious uploads.

Timeouts — stops hanging requests.