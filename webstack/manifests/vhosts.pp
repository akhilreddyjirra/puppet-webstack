class apache::vhosts {

  if $::osfamily == 'Redhat' {
    file { '/etc/httpd/conf.d/vhost.conf':
      ensure    => file,
      content   => template('apache/vhosts-rh.conf.erb'),
    }
    file { "/var/www/$servername":
      ensure    => directory,
    }
    file { "/var/www/$servername/public_html":
      ensure    => directory,
    }
    file { "/var/log/httpd/$servername/":
    ensure    => directory,
    }

  } elsif $::osfamily == 'Debian' {
    file { "/etc/apache2/sites-available/$servername.conf":
      ensure  => file,
      content  => template('apache/vhosts-deb.conf.erb'),
    }
    file { "/var/www/$servername":
      ensure    => directory,
    }
    file { "/var/www/html/$servername/public_html":
      ensure    => directory,
    }
    file { "/var/www/html/$servername/logs":
      ensure    => directory,
    }
  } else {
    notify { "This is not a supported distro.": }
  }

}
