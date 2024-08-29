NOT STARTED:
- add app versioning (changesets)
- move docker images to github registry
- Move to CI/CD deploy cluster
- Add VPN access (tailwind)
- Add monitoring (prometheus, grafana)
- Add logging
- verify domain on namecheap (email not working)
- cleanup docker images, avoid deleting in use ones

STARTED:
- Add method to deploy apps (argocd)
  - add password rather than using default


UNTESTED:
- Add R2 bucket for terraform state and backups
- remote uptime (uptimerobot) (email not working now?)

TESTED:
- Deploy cluster locally
- Add cloudflare CDN (waiting on domain to switch)
- Add cloudflare Proxy


docker image versioning pipeline?
- publish to github registry - done
- push to staging 
- promote to prod
