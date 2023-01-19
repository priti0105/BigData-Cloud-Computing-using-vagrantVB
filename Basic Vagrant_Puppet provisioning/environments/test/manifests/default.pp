# execute 'apt-get update'
exec { 'apt-update':                    
  command => '/usr/bin/apt-get update'
}

wget::fetch { 'QualitasCorpus':
        source      => 'ftp://custsrv1.bth.se/FTP/QualitasCorpus/*',
        destination => "/QualitusCorpus",
        timeout     => 0,
        unless      => "test $(ls -A /var/www/html 2>/dev/null)",
    }

exec { 'install Qualitus Corpus software packages':
  command => 'yes | QualitasCorpus-20130901r/bin/install.pl',
}