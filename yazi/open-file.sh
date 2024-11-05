#!/usr/bin/env bash
# Written in [Amber](https://amber-lang.com/)
# version: 0.3.5-alpha
# date: 2024-11-05 11:11:55
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
log__99_v0() {
    local log=$1
    get_env_var__73_v0 "HOME" ".env"
    __AF_get_env_var73_v0__6_16="${__AF_get_env_var73_v0}"
    local path="${__AF_get_env_var73_v0__6_16}""/.config/abyazelix/debug.log"
    file_exist__27_v0 "${path}"
    __AF_file_exist27_v0__7_8="$__AF_file_exist27_v0"
    if [ "$__AF_file_exist27_v0__7_8" != 0 ]; then
        file_append__30_v0 "${path}" "${log}"
        __AS=$?
        __AF_file_append30_v0__7_33="${__AF_file_append30_v0}"
        echo "${__AF_file_append30_v0__7_33}" >/dev/null 2>&1
    else
        file_write__29_v0 "${path}" "${log}"
        __AS=$?
        __AF_file_write29_v0__8_18="${__AF_file_write29_v0}"
        echo "${__AF_file_write29_v0__8_18}" >/dev/null 2>&1
    fi
}
random_text__100_v0() {
    local len=$1
    __AMBER_VAL_5=$(tr -dc a-z0-9 </dev/urandom | head -c ${len})
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_random_text100_v0=''
        return $__AS
    fi
    __AF_random_text100_v0="${__AMBER_VAL_5}"
    return 0
}
zellij_action__101_v0() {
    local action=$1
    __AMBER_VAL_6=$(zellij action ${action} 2>&1)
    __AS=$?
    if [ $__AS != 0 ]; then
        log__99_v0 "Failed to \`${action}\`"
        __AF_log99_v0__17_9="$__AF_log99_v0"
        echo "$__AF_log99_v0__17_9" >/dev/null 2>&1
        __AF_zellij_action101_v0=""
        return 0
    fi
    __AF_zellij_action101_v0="${__AMBER_VAL_6}"
    return 0
}
zellij_write_chars__102_v0() {
    local chars=$1
    zellij_action__101_v0 "write-chars \"${chars}\""
    __AF_zellij_action101_v0__23_5="${__AF_zellij_action101_v0}"
    echo "${__AF_zellij_action101_v0__23_5}" >/dev/null 2>&1
    zellij_action__101_v0 "write 13"
    __AF_zellij_action101_v0__24_5="${__AF_zellij_action101_v0}"
    echo "${__AF_zellij_action101_v0__24_5}" >/dev/null 2>&1
}
zellij_current_tab__103_v0() {
    zellij_action__101_v0 "dump-layout"
    __AF_zellij_action101_v0__28_18="${__AF_zellij_action101_v0}"
    local layout="${__AF_zellij_action101_v0__28_18}"
    # Find the focused tab
    __AMBER_VAL_8=$(echo -e "${layout}" | grep -E '^    tab.+focus=true' -A 1000 | grep '^    }' --max-count 1 -B 1000)
    __AS=$?
    if [ $__AS != 0 ]; then
        log__99_v0 "no focused"
        __AF_log99_v0__31_9="$__AF_log99_v0"
        echo "$__AF_log99_v0__31_9" >/dev/null 2>&1
        random_text__100_v0 8
        __AS=$?
        if [ $__AS != 0 ]; then
            __AF_zellij_current_tab103_v0=''
            return $__AS
        fi
        __AF_random_text100_v0__32_20="${__AF_random_text100_v0}"
        local rand="${__AF_random_text100_v0__32_20}"
        zellij_action__101_v0 "rename-tab ${rand}"
        __AF_zellij_action101_v0__33_9="${__AF_zellij_action101_v0}"
        echo "${__AF_zellij_action101_v0__33_9}" >/dev/null 2>&1
        __AMBER_VAL_7=$(echo -e "${layout}" | grep -E '^    tab.+name="${rand}"' -A 1000 | grep '^    }' --max-count 1 -B 1000)
        __AS=$?
        if [ $__AS != 0 ]; then
            __AF_zellij_current_tab103_v0=''
            return $__AS
        fi
        layout="${__AMBER_VAL_7}"
        zellij_action__101_v0 "undo-rename-tab"
        __AF_zellij_action101_v0__35_9="${__AF_zellij_action101_v0}"
        echo "${__AF_zellij_action101_v0__35_9}" >/dev/null 2>&1
    fi
    layout="${__AMBER_VAL_8}"
    # Remove indentation
    __AMBER_VAL_9=$(echo -e "${layout}" | cut -d' ' -f5-)
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_zellij_current_tab103_v0=''
        return $__AS
    fi
    layout="${__AMBER_VAL_9}"
    __AF_zellij_current_tab103_v0="${layout}"
    return 0
}
args=("$0" "$@")
path="${args[1]}"
log__99_v0 "${path}"
__AF_log99_v0__45_5="$__AF_log99_v0"
echo "$__AF_log99_v0__45_5" >/dev/null 2>&1
if [ $(
    [ "_${path}" != "_" ]
    echo $?
) != 0 ]; then
    exit 1
fi
zellij_current_tab__103_v0
__AS=$?
if [ $__AS != 0 ]; then

    exit $__AS
fi
__AF_zellij_current_tab103_v0__48_17="${__AF_zellij_current_tab103_v0}"
contains__15_v0 "${__AF_zellij_current_tab103_v0__48_17}" " command=\"hx\" "
__AF_contains15_v0__48_8="$__AF_contains15_v0"
if [ "$__AF_contains15_v0__48_8" != 0 ]; then
    # Move focus to the next pane
    zellij_action__101_v0 "focus-next-pane"
    __AF_zellij_action101_v0__50_9="${__AF_zellij_action101_v0}"
    echo "${__AF_zellij_action101_v0__50_9}" >/dev/null 2>&1
    # The current pane is running helix, use zellij actions to open the file
    zellij_action__101_v0 "write 27"
    __AF_zellij_action101_v0__52_9="${__AF_zellij_action101_v0}"
    echo "${__AF_zellij_action101_v0__52_9}" >/dev/null 2>&1
    zellij_write_chars__102_v0 ":open \"${path}\""
    __AF_zellij_write_chars102_v0__53_9="$__AF_zellij_write_chars102_v0"
    echo "$__AF_zellij_write_chars102_v0__53_9" >/dev/null 2>&1
else
    # The current pane is not running helix, so open helix in a new pane
    zellij_action__101_v0 "new-pane"
    __AF_zellij_action101_v0__57_9="${__AF_zellij_action101_v0}"
    echo "${__AF_zellij_action101_v0__57_9}" >/dev/null 2>&1
    sleep 0.4
    __AS=$?
    if [ $__AS != 0 ]; then

        exit $__AS
    fi
    # Get the working directory
    dir_exist__26_v0 "${path}"
    __AF_dir_exist26_v0__60_27="$__AF_dir_exist26_v0"
    __AMBER_VAL_10=$(dirname "${path}")
    __AS=$?
    if [ $__AS != 0 ]; then

        exit $__AS
    fi
    working_dir=$(if [ "$__AF_dir_exist26_v0__60_27" != 0 ]; then echo "${path}"; else echo "${__AMBER_VAL_10}"; fi)
    zellij_write_chars__102_v0 "cd ${working_dir}; hx ${path} -w ${working_dir}"
    __AF_zellij_write_chars102_v0__61_9="$__AF_zellij_write_chars102_v0"
    echo "$__AF_zellij_write_chars102_v0__61_9" >/dev/null 2>&1
fi
