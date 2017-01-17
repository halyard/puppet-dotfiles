puppet-dotdotdot
===========

[![Puppet Forge](https://img.shields.io/puppetforge/v/halyard/dotfiles.svg)](https://forge.puppetlabs.com/halyard/dotfiles)
[![Dependency Status](https://img.shields.io/gemnasium/halyard/puppet-dotdotdot.svg)](https://gemnasium.com/halyard/puppet-dotdotdot)
[![MIT Licensed](https://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/mit-license)
[![Build Status](https://img.shields.io/circleci/project/halyard/puppet-dotfiles/master.svg)](https://circleci.com/gh/halyard/puppet-dotfiles)

Module to set my dotfiles using [...](https://github.com/ingydotnet/...)

## Usage

In your Hiera config:

```
dotdotdot::source: 'https://example.com/your/dotdotdot.conf'
```

```puppet
include dotdotdot
```

## Required Puppet Modules


