#!/bin/bash

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias lint='g4 fix ; g4-clang-format ; g4 lint ; g4-clang-tidy'

alias cleanup='g4 sync ; build_cleaner ; lint'

alias placer='/google/data/ro/projects/placer/placer'

alias tmux='tmx2'
alias screen='scrn'

alias remote_perf='/google/data/ro/projects/perf/remote_perf'

KDT='/google/data/ro/buildstatic/projects/platforms/prodkernel/kdt/kdt/kdt.par'
alias kdt=${KDT}
alias kdtpk="${KDT} cherry-pick --release"

export COMPUTE_ENGINE_PROJECT_ID=bigclustertestdev0-devconsole
alias dev_gcloud='CLOUDSDK_API_ENDPOINT_OVERRIDES_COMPUTE=http://localhost:3990/compute/v1/  /google/data/ro/teams/cloud-sdk/gcloud'

export CLOUD_CLUSTER_TOOLS_DEV_SKIP_SURVEY=true
alias gcloud='/google/data/ro/teams/cloud-sdk/gcloud'
alias corevirt-reservation='/google/bin/releases/corevirt-reservation-releaser/reservation/reservation.par'
PATH=$HOME/bin:$PATH

alias staging_gcloud='CLOUDSDK_API_CLIENT_OVERRIDES_COMPUTE=staging_v1 /google/data/ro/teams/cloud-sdk/gcloud'

# Git aliases
alias gti='git'
alias gca='git commit --amend --no-edit'
alias gcap='git add -p && git commit --amend --no-edit'
alias gap='git add -p'
alias grc='git rebase --continue'
alias gri='git rebase -i'
alias gra='git rebase --abort'
alias oneline='git log --oneline'

MIBA='/google/bin/releases/miba-team/public/miba_ssh_session --persistent'
MIBA_CERT='/google/bin/releases/miba-team/public/miba_ssh_session --persistent -m kernel-development,kernel-development-serial,corevirt-team-testing -- /bin/true'
#alias certs="gcert; $MIBA_CERT"
alias certs="gcert -prodssh -m kernel-development,corevirt-team-testing"
alias destroy_certs="gcert -s --lifetime=1s"

SSH_TMP_DIR="ssh root@\${HOSTNAME} mkdir -p /export/hda3/tmp/bgardon"
COPY_SSH_SETUP="rsync -uzp ./vmlinux ~/ondo.sh root@\${HOSTNAME}:/export/hda3/tmp/bgardon/"
SSH_HOST_SETUP="$SSH_TMP_DIR; $COPY_SSH_SETUP"

COPY_GTESTS="rsync -urzp ./gtests/kvm/* root@\${HOSTNAME}:/export/hda3/tmp/bgardon/"
alias copy_gtests=$COPY_GTESTS


KONJURER='/google/data/ro/projects/platforms/prodkernel/konjurer/konjurer'
alias konjurer=$KONJURER
DELUXE_KONJURER="$SSH_HOST_SETUP & $KONJURER -nowait -kernel pkgs/LATEST.tar.xz -hosts \${HOSTNAME}"
alias konj=$DELUXE_KONJURER

GET_GIT_BRANCH_STATUS="git_branch_status=\$(git status | head -2; git show --format=oneline | head -1)"
PRINT_GIT_BRANCH_STATUS="echo "Test run with the following repo state:"; echo \"\$git_branch_status\""

KOKONUT_NO_INSTALL="kokonut test --gtests_path=gtests/ --install_kernel=false --nolease_machines --test_machines=\${HOSTNAME}"
alias kokonut-no-install="$GET_GIT_BRANCH_STATUS; $KOKONUT_NO_INSTALL ${@:1}; $PRINT_GIT_BRANCH_STATUS"

KOKONUT_INSTALL="kokonut test --gtests_path=gtests/ --install_kernel=true --kernel=pkgs/LATEST.tar.xz --nolease_machines --test_machines=\${HOSTNAME}"
alias kokonut-install="$SSH_HOST_SETUP & $GET_GIT_BRANCH_STATUS; $KOKONUT_INSTALL ${@:1}; $PRINT_GIT_BRANCH_STATUS"

KOKONUT_PRESUBMIT="kokonut test --gtests_path=gtests/ --install_kernel=true --kernel=pkgs/LATEST.tar.xz --machine_families=indus,ixion"
alias kokonut-presubmit="$GET_GIT_BRANCH_STATUS; $KOKONUT_PRESUBMIT ${@:1}; $PRINT_GIT_BRANCH_STATUS"

alias koko="~/kokonut_wrapper.sh"

FANCY_SSH="ssh -t root@\${HOSTNAME} 'cd /export/hda3/tmp/bgardon; gcontain enter /; bash -l'"
alias fancy-ssh="$FANCY_SSH"

alias crash='/google/data/ro/projects/kdump/crash'
alias aristotle_cli=/google/data/ro/projects/aristotle/aristotle_cli.par

alias prep-patches=~/prep_patches.sh

alias run_on_host="$MIBA -- /google/data/ro/teams/vanadium/kvm-unit-tests/run_on_host.sh"

CERT_PREP="gcertstatus || gcert; /google/bin/releases/miba-team/public/miba_ssh_session --persistent -m kernel-development,kernel-development-serial,corevirt-team-testing"
alias mimux="$CERT_PREP -- tmx2 $@"
alias mimux-attatch="$CERT_PREP -- tmx2 a -t"
alias mimux="~/mimux.sh"

alias kdt-mail-upstream="kdt mail internal-upstream/master"
alias easytrace="/google/data/ro/projects/threadscape/easytrace"

alias make_selftests="pushd tools/testing/selftests/kvm; make; popd"
alias davids_make_selftests='CFLAGS="-static -Wl,--whole-archive -lpthread -Wl,--no-whole-archive" make -C tools/testing/selftests/kvm'

alias approve-11xx="/google/bin/releases/kvmteam/tools/approve_clean_backports.sar --kernel_directory=$HOME/11xx --kernel_release=11xx"
alias approve-9xx="/google/bin/releases/kvmteam/tools/approve_clean_backports.sar --kernel_directory=$HOME/9xx --kernel_release=9xx"

alias rebase="/google/bin/releases/kvmteam/tools/rebase_commit_11xx.sar"
alias work="tmx2 a -t work"
alias work2="tmx2 a -t work2"
alias work3="tmx2 a -t work3"

alias msv="/google/bin/releases/msv-sre/clis/msv"
alias node_config_cli="/google/bin/releases/node-platform-control/clis/node_config_cli"
