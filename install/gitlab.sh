#!/bin/bash

sudo apt-get install curl openssh-server ca-certificates postfix
# pumlab
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo apt-get install gitlab-ce

# emacs /etc/gitlab/gitlab.rb

# gitlab_rails['gitlab_email_from'] = 'gitlab@pumgrana.fr'
# gitlab_rails['gitlab_email_reply_to'] = 'noreply@pumgrana.fr'
# gitlab_rails['smtp_enable'] = true
# gitlab_rails['smtp_address'] = "mail.gandi.net"
# gitlab_rails['smtp_port'] = 587
# gitlab_rails['smtp_user_name'] = "your_login@pumgrana.fr"
# gitlab_rails['smtp_password'] = "your_pwd"
# gitlab_rails['smtp_domain'] = "pumgrana.fr"
# gitlab_rails['smtp_authentication'] = "plain"
# gitlab_rails['smtp_enable_starttls_auto'] = true
# gitlab_rails['smtp_tls'] = false
# gitlab_rails['smtp_openssl_verify_mode'] = 'none'

sudo gitlab-ctl reconfigure

## Logs
# /var/log/gitlab/gitlab-rails/production.log

## Source
# https://gitlab.com/gitlab-org/omnibus-gitlab/blob/master/doc/settings/smtp.md
# http://doc.gitlab.com/omnibus/settings/smtp.html#gandi