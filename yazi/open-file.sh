#!/usr/bin/env bash
# Written in [Amber](https://amber-lang.com/)
# version: 0.3.5-alpha
# date: 2024-10-28 01:26:10

dir_exist__26_v0() {
    local path=$1
    [ -d "${path}" ];
    __AS=$?;
if [ $__AS != 0 ]; then
        __AF_dir_exist26_v0=0;
        return 0
fi
    __AF_dir_exist26_v0=1;
    return 0
}
file_exist__27_v0() {
    local path=$1
    [ -f "${path}" ];
    __AS=$?;
if [ $__AS != 0 ]; then
        __AF_file_exist27_v0=0;
        return 0
fi
    __AF_file_exist27_v0=1;
    return 0
}
file_write__29_v0() {
    local path=$1
    local content=$2
    __AMBER_VAL_0=$(echo "${content}" > "${path}");
    __AS=$?;
if [ $__AS != 0 ]; then
__AF_file_write29_v0=''
return $__AS
fi;
    __AF_file_write29_v0="${__AMBER_VAL_0}";
    return 0
}
file_append__30_v0() {
    local path=$1
    local content=$2
    __AMBER_VAL_1=$(echo "${content}" >> "${path}");
    __AS=$?;
if [ $__AS != 0 ]; then
__AF_file_append30_v0=''
return $__AS
fi;
    __AF_file_append30_v0="${__AMBER_VAL_1}";
    return 0
}
get_env_var__73_v0() {
    local var=$1
    local file=$2
    __AMBER_VAL_2=$(echo "${!var}");
    __AS=$?;
    local _var="${__AMBER_VAL_2}"
    if [ $([ "_${_var}" == "_" ]; echo $?) != 0 ]; then
        __AF_get_env_var73_v0="${_var}";
        return 0
fi
    file_exist__27_v0 "${file}";
    __AF_file_exist27_v0__11_8="$__AF_file_exist27_v0";
    if [ "$__AF_file_exist27_v0__11_8" != 0 ]; then
        source "${file}";
        __AS=$?
        __AMBER_VAL_3=$(echo "${!var}");
        __AS=$?;
        __AF_get_env_var73_v0="${__AMBER_VAL_3}";
        return 0
fi
    __AF_get_env_var73_v0="";
    return 0
}
log__99_v0() {
    local log=$1
    get_env_var__73_v0 "HOME" ".env";
    __AF_get_env_var73_v0__6_16="${__AF_get_env_var73_v0}";
    local path="${__AF_get_env_var73_v0__6_16}""/.config/abyazelix/debug.log"
    file_exist__27_v0 "${path}";
    __AF_file_exist27_v0__7_8="$__AF_file_exist27_v0";
    if [ "$__AF_file_exist27_v0__7_8" != 0 ]; then
        file_append__30_v0 "${path}" "${log}";
        __AS=$?;
if [ $__AS != 0 ]; then
__AF_log99_v0=''
return $__AS
fi;
        __AF_file_append30_v0__7_26="${__AF_file_append30_v0}";
        echo "${__AF_file_append30_v0__7_26}" > /dev/null 2>&1
else
        file_write__29_v0 "${path}" "${log}";
        __AS=$?;
if [ $__AS != 0 ]; then
__AF_log99_v0=''
return $__AS
fi;
        __AF_file_write29_v0__8_11="${__AF_file_write29_v0}";
        echo "${__AF_file_write29_v0__8_11}" > /dev/null 2>&1
fi
}
zellij_current_tab__100_v0() {
    __AMBER_VAL_4=$(zellij action dump-layout);
    __AS=$?;
if [ $__AS != 0 ]; then
__AF_zellij_current_tab100_v0=''
return $__AS
fi;
    local layout="${__AMBER_VAL_4}"
    # Find the focused tab
    __AMBER_VAL_5=$(echo -e "${layout}" | grep -E '^    tab.+focus=true' -A 1000 | grep '^    }' --max-count 1 -B 1000);
    __AS=$?;
if [ $__AS != 0 ]; then
__AF_zellij_current_tab100_v0=''
return $__AS
fi;
    local tab="${__AMBER_VAL_5}"
    # Remove indentation
    __AMBER_VAL_6=$(echo -e "${tab}" | cut -d' ' -f5-);
    __AS=$?;
if [ $__AS != 0 ]; then
__AF_zellij_current_tab100_v0=''
return $__AS
fi;
    tab="${__AMBER_VAL_6}"
    # log(tab)?
    __AF_zellij_current_tab100_v0="${tab}";
    return 0
}
zellij_write_chars__101_v0() {
    local chars=$1
    zellij action write-chars "${chars}";
    __AS=$?;
if [ $__AS != 0 ]; then
__AF_zellij_write_chars101_v0=''
return $__AS
fi
    zellij action write 13;
    __AS=$?;
if [ $__AS != 0 ]; then
__AF_zellij_write_chars101_v0=''
return $__AS
fi
}
args=("$0" "$@")
    path="${args[1]}"
    if [ $([ "_${path}" != "_" ]; echo $?) != 0 ]; then
        exit 1
fi
    log__99_v0 "Trying to open ${path}";
    __AS=$?;
if [ $__AS != 0 ]; then

exit $__AS
fi;
    __AF_log99_v0__30_5="$__AF_log99_v0";
    echo "$__AF_log99_v0__30_5" > /dev/null 2>&1
    zellij_current_tab__100_v0 ;
    __AS=$?;
if [ $__AS != 0 ]; then

exit $__AS
fi;
    __AF_zellij_current_tab100_v0__32_15="${__AF_zellij_current_tab100_v0}";
    tab="${__AF_zellij_current_tab100_v0__32_15}"
    echo -e "${tab}" | grep hx >/dev/null;
    __AS=$?;
if [ $__AS != 0 ]; then
        # The current pane is not running helix, so open helix in a new pane
        log__99_v0 "open";
        __AS=$?;
if [ $__AS != 0 ]; then

exit $__AS
fi;
        __AF_log99_v0__35_9="$__AF_log99_v0";
        echo "$__AF_log99_v0__35_9" > /dev/null 2>&1
        zellij action new-pane;
        __AS=$?;
if [ $__AS != 0 ]; then

exit $__AS
fi
        sleep 0.4;
        __AS=$?;
if [ $__AS != 0 ]; then

exit $__AS
fi
        # Get the working directory
        dir_exist__26_v0 "${path}";
        __AF_dir_exist26_v0__39_27="$__AF_dir_exist26_v0";
        __AMBER_VAL_7=$(dirname "${path}");
        __AS=$?;
if [ $__AS != 0 ]; then

exit $__AS
fi;
        working_dir=$(if [ "$__AF_dir_exist26_v0__39_27" != 0 ]; then echo "${path}"; else echo "${__AMBER_VAL_7}"; fi)
        zellij_write_chars__101_v0 "hx ${path} -w ${working_dir}";
        __AS=$?;
if [ $__AS != 0 ]; then

exit $__AS
fi;
        __AF_zellij_write_chars101_v0__40_9="$__AF_zellij_write_chars101_v0";
        echo "$__AF_zellij_write_chars101_v0__40_9" > /dev/null 2>&1
        exit 1
fi
    log__99_v0 "create";
    __AS=$?;
if [ $__AS != 0 ]; then

exit $__AS
fi;
    __AF_log99_v0__43_5="$__AF_log99_v0";
    echo "$__AF_log99_v0__43_5" > /dev/null 2>&1
    # Move focus to the next pane
    zellij action focus-next-pane;
    __AS=$?;
if [ $__AS != 0 ]; then

exit $__AS
fi
    # The current pane is running helix, use zellij actions to open the file
    zellij action write 27;
    __AS=$?;
if [ $__AS != 0 ]; then

exit $__AS
fi
    zellij_write_chars__101_v0 ":open \"${path}\"";
    __AS=$?;
if [ $__AS != 0 ]; then

exit $__AS
fi;
    __AF_zellij_write_chars101_v0__48_5="$__AF_zellij_write_chars101_v0";
    echo "$__AF_zellij_write_chars101_v0__48_5" > /dev/null 2>&1
