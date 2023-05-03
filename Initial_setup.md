# Initial setup Mac M1
- download brew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
- Install java
```
brew install maven
brew install jdkman
sdk install java 11.0.16-zulu
```
- Install node and yarn (and default node to 14)
```
brew install nvm
nvm install v8.9.4
nvm install v12.16.1
nvm install v14.20.0
nvm use v14.20.0
nvm alias default 12
brew install yarn
```
- Install python and default to python2
```
brew install pyenv
pyenv install 2.7.18
pyenv global 2.7.18
```
- Install docker
```
brew install socat
```
- Install adb

> This now doesn't work. You have to download Android SDK Platform-Tools

```
brew install android-platform-tools
```
- .bash_profile/.zshrc
``` shell
### ALIASES ###
alias mc="mvn clean"
alias mci="mvn clean install"
alias mcis="mvn clean install -Dmaven.test.skip=true"
alias mcist="mvn clean install -Dmaven.test.skip=true"
alias xiaomiRmBloat="~/Software/android_sdk/adb shell \"pm disable-user com.xiaomi.mipicks && pm disable-user com.miui.videoplayer\""
alias backup="ulimit -n 1024 && ~/Projects/Other/backups/duplicity-backup.sh"

# docker-maven-plugin (https://www.adictosaltrabajo.com/2021/11/12/maven-mac-m1-aarch64-fabric8-docker-maven-plugin/)
alias socat-start="socat TCP-LISTEN:2375,range=127.0.0.1/32,reuseaddr,fork UNIX-CLIENT:/var/run/docker.sock"
### ALIASES ###

PS1="%n:%~ $ "

eval "$(/opt/homebrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# docker-maven-plugin
export DOCKER_HOST=tcp://127.0.0.1:2375
if ! pgrep -x socat >/dev/null; then
    socat-start  &
fi

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
```

- Install Docker
- Install postman
- Install Spotify
