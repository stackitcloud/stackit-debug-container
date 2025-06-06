# STACKIT Debug Container Image

[![Docker Image Size](https://img.shields.io/docker/image-size/stackitcloud/stackit-debug-container?logo=docker)](https://hub.docker.com/r/stackitcloud/stackit-debug-container)
[![Alpine Version](https://img.shields.io/badge/Alpine-3.22-0D597F?logo=alpinelinux)](https://alpinelinux.org/)
[![License](https://img.shields.io/github/license/stackitcloud/stackit-debug-container)](https://github.com/stackitcloud/stackit-debug-container/blob/main/LICENSE)
[![GitHub Stars](https://img.shields.io/github/stars/stackitcloud/stackit-debug-container?logo=github)](https://github.com/stackitcloud/stackit-debug-container/stargazers)
[![Build Status](https://img.shields.io/github/actions/workflow/status/stackitcloud/stackit-debug-container/build.yml?logo=github-actions)](https://github.com/stackitcloud/stackit-debug-container/actions)

A lightweight Alpine Linux-based debug container specifically designed for troubleshooting and debugging applications in STACKIT Kubernetes Engine (SKE) clusters.

## Overview

This container provides a comprehensive toolkit for debugging networking issues, database connectivity, and Kubernetes resources within your SKE cluster. Built on Alpine Linux 3.22, it includes essential tools while maintaining a small footprint.

## Features

### 🔧 **Core Tools**
- **Shell**: `bash` with completion support
- **Process Monitoring**: `htop`, `screen`, `tmux`
- **File Management**: `tree`, `mc` (Midnight Commander), `vim`, `less`
- **Archive Handling**: `bzip2`, `unzip`

### 🌐 **Network Debugging**
- **DNS Tools**: `bind-tools` (dig, nslookup, host)
- **Network Utilities**: `busybox-extras`, `mtr`, `socat`
- **Traffic Monitoring**: `iftop`
- **HTTP Testing**: `httpie`, `curl`, `wget`

### 🗄️ **Database Connectivity**
- **MySQL**: `mysql-client`
- **PostgreSQL**: `postgresql-client`
- **Redis**: `redis` client tools
- **LDAP**: `openldap-clients`

### ☸️ **Kubernetes Integration**
- **kubectl**: Latest version automatically installed
- Supports both AMD64 and ARM64 architectures
- Ready for immediate cluster debugging

### 🛠️ **Development & Scripting**
- **Python 3**: For scripting and automation
- **Git**: Version control operations
- **jq**: JSON processing
- **OpenSSL**: Certificate and encryption testing

## Quick Start

```bash
kubectl run debug-session --rm -i --tty --image=schwarzit/stackit-debug-container:latest
```

## Security Features

- **Non-root user**: Runs as user `stackit` (UID: 10001)
- **Restricted permissions**: Limited ability to install additional packages
- **Minimal attack surface**: Only essential tools included
- **No privileged escalation**: Designed for safe debugging operations

## Best Practices

1. **Temporary Usage**: Use `--rm` flag for one-time debugging sessions
2. **Resource Limits**: Set appropriate CPU and memory limits in production
3. **Network Policies**: Ensure debug pod can reach target services
4. **Clean Up**: Remove debug pods after troubleshooting is complete

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests to improve the debug container.

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE](https://github.com/stackitcloud/stackit-debug-container/blob/main/LICENSE) file for details.

---

**Note**: This debug container is specifically optimized for STACKIT Kubernetes Engine (SKE) environments but can be used in any Kubernetes cluster.