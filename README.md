# Zach Broniszewski's dotfiles 🗂

## An automated solution to personal configuration management, powered by ansible

⏭ Skip to [Getting Started](#getting-started)

**Q.** How long would it take you to configure a new PC, Mac, Virtual Machine, or user account with all of the applications, tools and settings that enable you?  
**Q.** How long *should* it take you?  
**Q.** Do you find yourself making significant changes to one machine (i.e. a desktop), only to repeat those same changes at a later time, on another machine (i.e. a laptop)?  
**Q.** What if you didn't need to backup your applications, but rather only the process to install and configure those applications?  
**Q.** How reliably can you restore from your current backups, especially when restoring to a new Operating System?  

### Getting Started

1. Set vault password for `dotfiles` vault (This password will be stored in your keyring): `./vault-keyring-client.py --vault-id dotfiles --set`
2. Run `./bin/dotfiles` and follow the prompts
