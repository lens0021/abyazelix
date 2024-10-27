#!/usr/bin/env bash
# Written in [Amber](https://amber-lang.com/)
# version: 0.3.5-alpha
# date: 2024-10-27 17:39:15
contains__15_v0() {
    local text=$1
    local phrase=$2
    __AMBER_VAL_0=$(if [[ "${text}" == *"${phrase}"* ]]; then
        echo 1
    fi)
    __AS=$?
    local result="${__AMBER_VAL_0}"
    __AF_contains15_v0=$(
        [ "_${result}" != "_1" ]
        echo $?
    )
    return 0
}
dir_exist__26_v0() {
    local path=$1
    [ -d "${path}" ]
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_dir_exist26_v0=0
        return 0
    fi
    __AF_dir_exist26_v0=1
    return 0
}
file_exist__27_v0() {
    local path=$1
    [ -f "${path}" ]
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_file_exist27_v0=0
        return 0
    fi
    __AF_file_exist27_v0=1
    return 0
}
file_write__29_v0() {
    local path=$1
    local content=$2
    __AMBER_VAL_1=$(echo "${content}" >"${path}")
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_file_write29_v0=''
        return $__AS
    fi
    __AF_file_write29_v0="${__AMBER_VAL_1}"
    return 0
}
file_append__30_v0() {
    local path=$1
    local content=$2
    __AMBER_VAL_2=$(echo "${content}" >>"${path}")
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_file_append30_v0=''
        return $__AS
    fi
    __AF_file_append30_v0="${__AMBER_VAL_2}"
    return 0
}
get_env_var__73_v0() {
    local var=$1
    local file=$2
    __AMBER_VAL_3=$(echo "${!var}")
    __AS=$?
    local _var="${__AMBER_VAL_3}"
    if [ $(
        [ "_${_var}" == "_" ]
        echo $?
    ) != 0 ]; then
        __AF_get_env_var73_v0="${_var}"
        return 0
    fi
    file_exist__27_v0 "${file}"
    __AF_file_exist27_v0__11_8="$__AF_file_exist27_v0"
    if [ "$__AF_file_exist27_v0__11_8" != 0 ]; then
        source "${file}"
        __AS=$?
        __AMBER_VAL_4=$(echo "${!var}")
        __AS=$?
        __AF_get_env_var73_v0="${__AMBER_VAL_4}"
        return 0
    fi
    __AF_get_env_var73_v0=""
    return 0
}
zellij_current_tab__99_v0() {
    __AMBER_VAL_5=$(zellij action dump-layout)
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_zellij_current_tab99_v0=''
        return $__AS
    fi
    local layout="${__AMBER_VAL_5}"
    # Find the focused tab
    __AMBER_VAL_6=$(echo -e "${layout}" | grep -E '^    tab.+focus=true' -A 1000 | grep '^    }' --max-count 1 -B 1000)
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_zellij_current_tab99_v0=''
        return $__AS
    fi
    layout="${__AMBER_VAL_6}"
    # Remove indentation
    __AMBER_VAL_7=$(echo -e "${layout}" | cut -d' ' -f5-)
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_zellij_current_tab99_v0=''
        return $__AS
    fi
    layout="${__AMBER_VAL_7}"
    __AF_zellij_current_tab99_v0="${layout}"
    return 0
}
zellij_write_chars__100_v0() {
    local chars=$1
    zellij action write-chars "${chars}"
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_zellij_write_chars100_v0=''
        return $__AS
    fi
    zellij action write 13
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_zellij_write_chars100_v0=''
        return $__AS
    fi
}
log__101_v0() {
    local log=$1
    get_env_var__73_v0 "HOME" ".env"
    __AF_get_env_var73_v0__21_16="${__AF_get_env_var73_v0}"
    local path="${__AF_get_env_var73_v0__21_16}""/.config/abyazelix/debug.log"
    file_exist__27_v0 "${path}"
    __AF_file_exist27_v0__22_8="$__AF_file_exist27_v0"
    if [ "$__AF_file_exist27_v0__22_8" != 0 ]; then
        file_append__30_v0 "${path}" "${log}"
        __AS=$?
        if [ $__AS != 0 ]; then
            __AF_log101_v0=''
            return $__AS
        fi
        __AF_file_append30_v0__22_26="${__AF_file_append30_v0}"
        echo "${__AF_file_append30_v0__22_26}" >/dev/null 2>&1
    else
        file_write__29_v0 "${path}" "${log}"
        __AS=$?
        if [ $__AS != 0 ]; then
            __AF_log101_v0=''
            return $__AS
        fi
        __AF_file_write29_v0__23_11="${__AF_file_write29_v0}"
        echo "${__AF_file_write29_v0__23_11}" >/dev/null 2>&1
    fi
}
args=("$0" "$@")
path="${args[1]}"
log__101_v0 "${path}"
__AS=$?
if [ $__AS != 0 ]; then

    exit $__AS
fi
__AF_log101_v0__28_5="$__AF_log101_v0"
echo "$__AF_log101_v0__28_5" >/dev/null 2>&1
if [ $(
    [ "_${path}" != "_" ]
    echo $?
) != 0 ]; then
    exit 1
fi
zellij_current_tab__99_v0
__AS=$?
if [ $__AS != 0 ]; then

    exit $__AS
fi
__AF_zellij_current_tab99_v0__31_17="${__AF_zellij_current_tab99_v0}"
contains__15_v0 "${__AF_zellij_current_tab99_v0__31_17}" " command=\"hx\" "
__AF_contains15_v0__31_8="$__AF_contains15_v0"
if [ "$__AF_contains15_v0__31_8" != 0 ]; then
    # Move focus to the next pane
    zellij action focus-next-pane
    __AS=$?
    if [ $__AS != 0 ]; then

        exit $__AS
    fi
    # The current pane is running helix, use zellij actions to open the file
    zellij action write 27
    __AS=$?
    if [ $__AS != 0 ]; then

        exit $__AS
    fi
    zellij_write_chars__100_v0 ":open \"${path}\""
    __AS=$?
    if [ $__AS != 0 ]; then

        exit $__AS
    fi
    __AF_zellij_write_chars100_v0__36_9="$__AF_zellij_write_chars100_v0"
    echo "$__AF_zellij_write_chars100_v0__36_9" >/dev/null 2>&1
else
    # The current pane is not running helix, so open helix in a new pane
    zellij action new-pane
    __AS=$?
    if [ $__AS != 0 ]; then

        exit $__AS
    fi
    sleep 0.4
    __AS=$?
    if [ $__AS != 0 ]; then

        exit $__AS
    fi
    # Get the working directory
    dir_exist__26_v0 "${path}"
    __AF_dir_exist26_v0__43_27="$__AF_dir_exist26_v0"
    __AMBER_VAL_8=$(dirname "${path}")
    __AS=$?
    if [ $__AS != 0 ]; then

        exit $__AS
    fi
    working_dir=$(if [ "$__AF_dir_exist26_v0__43_27" != 0 ]; then echo "${path}"; else echo "${__AMBER_VAL_8}"; fi)
    zellij_write_chars__100_v0 "hx ${path} -w ${working_dir}"
    __AS=$?
    if [ $__AS != 0 ]; then

        exit $__AS
    fi
    __AF_zellij_write_chars100_v0__44_9="$__AF_zellij_write_chars100_v0"
    echo "$__AF_zellij_write_chars100_v0__44_9" >/dev/null 2>&1
fi
