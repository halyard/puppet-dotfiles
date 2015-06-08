class dotfiles (
  $source = "${dotfiles::homedir($::id)}/.dotdotdot.conf"
) {
  $homedir = dotfiles::homedir($::boxen_user)

  repository { 'dotdotdot repo':
    path    => "${homedir}/...",
    source  => 'ingydotnet/...',
    require => Git::Config::Global['credential.helper']
  }

  exec { 'dotdotdot config':
    command => "${homedir}/.../... conf ${source}",
    creates => "${homedir}/.../conf",
    require => Repository['dotdotdot repo']
  }

  exec { 'dotdotdot update':
    command => "${homedir}/.../... update",
    require => Exec['dotdotdot config'],
    provider => 'shell'
  }

  exec { 'dotdotdot install':
    command => "${homedir}/.../... install",
    require => Exec['dotdotdot update'],
    provider => 'shell'
  }

  exec { 'vundle install':
    command => "vim +PluginInstall +qall",
    creates => "${homedir}/.vim/bundle/DetectIndent/README",
    require => Exec['dotdotdot install']
  }
}
