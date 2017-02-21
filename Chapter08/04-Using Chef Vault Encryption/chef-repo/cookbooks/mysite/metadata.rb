name 'mysite'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'all_rights'
description 'Installs/Configures mysite'
long_description 'Installs/Configures mysite'
version '0.6.0'

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Issues` link
# issues_url 'https://github.com/<insert_org_here>/mysite/issues' if respond_to?(:issues_url)

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Source` link
# source_url 'https://github.com/<insert_org_here>/mysite' if respond_to?(:source_url)

depends 'apache'
depends 'mysql', '~> 8.0'
depends 'php'
depends 'selinux'
depends 'yum-mysql-community', '~> 1.0'
depends 'chef-vault'
