require 'spec_helper_acceptance'

describe 'Apache' do
  describe 'Puppet code' do
    it 'should compile and work with no error' do
      pp = <<-EOS
        class { 'apache': }
        apache::vhost{'mysite':
          website => 'www.sample.com',
          docroot => '/var/www/docroot',
        }
        apache::htpasswd{'htpasswd':
          filepath => '/etc/apache2/htpasswd',
          users    => [ { "id" => "user1", "htpasswd" => "hash1" } ],
        }
        file { '/var/www/docroot':
          ensure => directory,
          owner  => 'www-data',
          group  => 'www-data',
          mode   => '0755',
        }
        apache::htaccess{'myhtaccess':
          filepath => '/etc/apache2/htpasswd',
          docroot  => '/var/www/docroot',
        }
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end
  end

  # Apache running and enabled at boot ?
  describe service('apache2') do
    it { is_expected.to be_enabled }
    it { is_expected.to be_running }
  end

  # Apache listening ?
  describe port(80) do
    it { is_expected.to be_listening }
  end

  # Vhost deployed ?
  describe file ('/etc/apache2/sites-available/www.sample.com.conf') do
    its(:content) { should match /DocumentRoot \/var\/www\/docroot/ }
  end

  describe file ('/etc/apache2/sites-enabled/www.sample.com.conf') do
    it { is_expected.to be_symlink }
  end

  # htpasswd file deployed ?
  describe file ('/etc/apache2/htpasswd') do
    its(:content) { should match /user1:hash1/ }
  end

  # htaccess file deployed ?
  describe file ('/var/www/docroot/.htaccess') do
    its(:content) { should match /AuthUserFile \/etc\/apache2\/htpasswd/ }
  end

end
