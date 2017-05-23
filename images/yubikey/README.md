# Yubikey 

* https://ocramius.github.io/blog/yubikey-for-ssh-gpg-git-and-local-login/
* https://github.com/drduh/YubiKey-Guide

## TODO

Need to automate the following:

```
sudo killall gpg-agent
sudo killall ssh-agent
# note: eval is used because the produced STDOUT is a bunch of ENV settings
eval $( gpg-agent --daemon --enable-ssh-support )
```

Other options -- use keychain / ssh-init

* http://www.funtoo.org/Keychain
* https://github.com/ccontavalli/ssh-ident

```
alias ssh-agent='echo "Did you mean ssh-add? Do not run ssh-agent when using gpg-agent."; false'
```
