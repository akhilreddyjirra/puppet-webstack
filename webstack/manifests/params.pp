class apache::params {
  if $::osfamily == 'Redhat' {
    $apachename = 'httpd'
    $conffile = '/etc/httpd/conf/httpd.conf'
    $confsource = 'puppetmaster:///modules/apache/httpd.conf'
  } elsif $::osfamily == 'Debian' {
    $apachename = 'apache2'
    $conffile = '/etc/apache2/apache2.conf'
    $confsource = 'puppetmaster:///modules/apache/apache2.conf'
  } else {
    notify { "This is naupported distro.":}
  }
}
