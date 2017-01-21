# Configure dotfiles using ...
class dotfiles (
  String[1] $source = "${dotfiles::homedir($::id)}/.dotdotdot.conf",
  String[1] $repo = 'https://github.com/ingydotnet/...',
  String[1] $owner = $facts['id'],
  String[1] $group = $facts['gid']
) {
  $homedir = dotfiles::homedir($owner)
  $ddd = "${homedir}/..."
  $bin = "${ddd}/..."

  Exec {
   environment => ["HOME=${homedir}"],
   user        => $owner,
   group       => $group
  }

  vcsrepo { $ddd:
    ensure   => present,
    provider => git,
    source   => $repo,
    owner    => $owner,
    group    => $group
  } ->
  exec { 'dotdotdot config':
    command => "${bin} conf ${source}",
    creates => "${ddd}/conf",
  } ->
  exec { 'dotfile upgrade':
    command => "${bin} install",
    onlyif  => "${bin} super_update 2>&1 | grep -e '^From' -e '^Cloning'"
  } ~>
  exec { 'vundle install':
    command     => 'vim +PluginInstall +qall',
    refreshonly => true
  }
}
