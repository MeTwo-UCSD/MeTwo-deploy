#!/usr/bin/env bash

# modified from https://raw.githubusercontent.com/crosstool-ng/crosstool-ng/master/.travis.sh

# Override the log behaviour
ct-ng_override()
{
    sed -i -e 's/^.*\(CT_LOG_ERROR\).*$/# \1 is not set/' \
        -e 's/^.*\(CT_LOG_WARN\).*$/# \1 is not set/' \
        -e 's/^.*\(CT_LOG_INFO\).*$/# \1 is not set/' \
        -e 's/^.*\(CT_LOG_EXTRA\).*$/\1=y/' \
        -e 's/^.*\(CT_LOG_ALL\).*$/# \1 is not set/' \
        -e 's/^.*\(CT_LOG_DEBUG\).*$/# \1 is not set/' \
        -e 's/^.*\(CT_LOG_LEVEL_MAX\).*$/\1="EXTRA"/' \
        -e 's/^.*\(CT_LOG_PROGRESS_BAR\).*$/# \1 is not set/' \
        -e 's/^.*\(CT_LOCAL_TARBALLS_DIR\).*$/\1="${HOME}\/src"/' \
        -e 's/^.*\(CT_SAVE_TARBALLS\).*$/\1=y/' \
        .config
}

ct-ng_build()
{
    # Build the sample
    ct-ng build.8 &
    local build_pid=$!

    export build_pid
    # print a "still running" line every 5 minutes to avoid timeout
    (
        while ps -p $build_pid > /dev/null
        do
            sleep 300
            printf "Crosstool-NG is still running ...\r"
        done
     ) &

    wait $build_pid

    # Return the result
    return $?
}