# @param agentmode Agent type: service or cron. If anything else, agent will be disabled
class baseconfig (
  $agentmode='service'
) {

  case $agentmode {
    'service': {
      $ensureservice='running';
      $enableservice=true;
      $ensurecron='absent'
    }
    'cron': {
      $ensureservice='stopped';
      $enableservice=false;
      $ensurecron='present'
    }
    default: {
      $ensureservice='stopped';
      $enableservice=false;
      $ensurecron='absent'
    }
  }
  service {'puppet':
    ensure => $ensureservice,
    enable => $enableservice,
  }
  cron {'puppet-agent':
    ensure  => $ensurecron,
    user    => root,
    minute  => 0,
    command => '/opt/puppet/bin/puppet agent --onetime --no-daemonize --splay --splaylimit 60',
  }
}
