# shell image 

Contains useful shell scripts and git configuration.

## TODO

Need to automate the following:

```
sudo killall gpg-agent
sudo killall ssh-agent
# note: eval is used because the produced STDOUT is a bunch of ENV settings
eval $( gpg-agent --daemon --enable-ssh-support )
```

## Further reading

* https://www.rempe.us/blog/yubikey-gnupg-2-1-and-ssh/
* https://www.gnupg.org/faq/whats-new-in-2.1.html#autostart
* https://hackernoon.com/lesser-known-git-commands-151a1918a60