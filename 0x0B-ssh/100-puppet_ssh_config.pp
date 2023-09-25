#Configure SSH client to use private key
include stdlib

file_line { 'Declare identity file':
  ensure  => 'present',
  path    => '/etc/ssh/ssh_config',
  line    => '     IdentityFile ~/.ssh/school',
  replace => true,
}

file_line { 'Turn off client passwd auth':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config',
  line   => 'PasswordAuthentication no',
  match  => '^PasswordAuthentication',
}
