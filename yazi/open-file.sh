#!/usr/bin/env bash
# Written in [Amber](https://amber-lang.com/)
# version: 0.3.5-alpha
# date: 2024-12-09 10:59:04
replace__0_v0() {

# bshchk (https://git.blek.codes/blek/bshchk)
deps=('return' '[' 'sed' '[' 'bc' 'sed' 'sed' 'return' 'sed' 'return' '[' '[' 'return' 'return' '[' '[' 'return' 'return' '[' 'return' 'return' '[' 'return' 'return' '[' '[' 'return' '[' 'return' 'return' '[' 'zellij' '[' 'return' 'grep' 'grep' '[' 'return' 'cut' '[' 'return' 'return' '[' 'return' 'grep' 'grep' '[' 'return' 'cut' '[' 'return' 'return' 'zellij' '[' 'return' 'zellij' '[' 'return' 'zellij' '[' 'return' 'sleep' '[' 'return' 'dirname' '[' 'return' '[' '[' 'return' '[' 'return' '[' '[' 'exit' '[' 'exit' '[' ':' '[' 'bc' 'sed' '[' 'exit' 'break' 'bc' 'sed' 'zellij' '[' 'exit' '[' 'exit' '[' 'zellij' '[' 'exit' '[' 'exit' 'break' '[' 'exit')
non_ok=()

for d in $deps
do
    if ! command -v $d > /dev/null 2>&1; then
        non_ok+=$d
    fi
done

if (( ${#non_ok[@]} != 0 )); then
    >&2 echo "RDC Failed!"
    >&2 echo "  This program requires these commands:"
    >&2 echo "  > $deps"
    >&2 echo "    --- "
    >&2 echo "  From which, these are missing:"
    >&2 echo "  > $non_ok"
    >&2 echo "Make sure that those are installed and are present in \$PATH."
    exit 1
fi

unset non_ok
unset deps
# Dependencies are OK at this point


    local source=$1
    local search=$2
    local replace=$3
    __AF_replace0_v0="${source//${search}/${replace}}"
    return 0
}
replace_regex__2_v0() {
    local source=$1
    local search=$2
    local replace=$3
    local extended=$4
    replace__0_v0 "${search}" "/" "\/"
    __AF_replace0_v0__16_18="${__AF_replace0_v0}"
    search="${__AF_replace0_v0__16_18}"
    replace__0_v0 "${replace}" "/" "\/"
    __AF_replace0_v0__17_19="${__AF_replace0_v0}"
    replace="${__AF_replace0_v0__17_19}"
    if [ ${extended} != 0 ]; then
        # GNU sed versions 4.0 through 4.2 support extended regex syntax,
        # but only via the "-r" option; use that if the version information
        # contains "GNU sed".
        re='\bCopyright\b.+\bFree Software Foundation\b'
        [[ $(sed --version 2>/dev/null) =~ $re ]]
        __AS=$?
        local flag=$(if [ $(echo $__AS '==' 0 | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then echo "-r"; else echo "-E"; fi)
        __AMBER_VAL_0=$(echo "${source}" | sed "${flag}" -e "s/${search}/${replace}/g")
        __AS=$?
        __AF_replace_regex2_v0="${__AMBER_VAL_0}"
        return 0
    else
        __AMBER_VAL_1=$(echo "${source}" | sed -e "s/${search}/${replace}/g")
        __AS=$?
        __AF_replace_regex2_v0="${__AMBER_VAL_1}"
        return 0
    fi
}
dir_exist__34_v0() {
    local path=$1
    [ -d "${path}" ]
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_dir_exist34_v0=0
        return 0
    fi
    __AF_dir_exist34_v0=1
    return 0
}
file_exist__35_v0() {
    local path=$1
    [ -f "${path}" ]
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_file_exist35_v0=0
        return 0
    fi
    __AF_file_exist35_v0=1
    return 0
}
file_write__37_v0() {
    local path=$1
    local content=$2
    __AMBER_VAL_2=$(echo "${content}" >"${path}")
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_file_write37_v0=''
        return $__AS
    fi
    __AF_file_write37_v0="${__AMBER_VAL_2}"
    return 0
}
file_append__38_v0() {
    local path=$1
    local content=$2
    __AMBER_VAL_3=$(echo "${content}" >>"${path}")
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_file_append38_v0=''
        return $__AS
    fi
    __AF_file_append38_v0="${__AMBER_VAL_3}"
    return 0
}
get_env_var__91_v0() {
    local var=$1
    local file=$2
    __AMBER_VAL_4=$(echo "${!var}")
    __AS=$?
    local _var="${__AMBER_VAL_4}"
    if [ $(
        [ "_${_var}" == "_" ]
        echo $?
    ) != 0 ]; then
        __AF_get_env_var91_v0="${_var}"
        return 0
    fi
    file_exist__35_v0 "${file}"
    __AF_file_exist35_v0__11_8="$__AF_file_exist35_v0"
    if [ "$__AF_file_exist35_v0__11_8" != 0 ]; then
        source "${file}"
        __AS=$?
        __AMBER_VAL_5=$(echo "${!var}")
        __AS=$?
        __AF_get_env_var91_v0="${__AMBER_VAL_5}"
        return 0
    fi
    __AF_get_env_var91_v0=""
    return 0
}
log__117_v0() {
    local log=$1
    get_env_var__91_v0 "HOME" ".env"
    __AF_get_env_var91_v0__7_20="${__AF_get_env_var91_v0}"
    local path="${__AF_get_env_var91_v0__7_20}""/.config/abyazelix/debug.log"
    file_exist__35_v0 "${path}"
    __AF_file_exist35_v0__8_12="$__AF_file_exist35_v0"
    if [ "$__AF_file_exist35_v0__8_12" != 0 ]; then
        file_append__38_v0 "${path}" "${log}"
        __AS=$?
        __AF_file_append38_v0__8_30="${__AF_file_append38_v0}"
        echo "${__AF_file_append38_v0__8_30}" >/dev/null 2>&1
    else
        file_write__37_v0 "${path}" "${log}"
        __AS=$?
        __AF_file_write37_v0__9_15="${__AF_file_write37_v0}"
        echo "${__AF_file_write37_v0__9_15}" >/dev/null 2>&1
    fi
}
zellij_current_tab__118_v0() {
    __AMBER_VAL_6=$(zellij action dump-layout)
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_zellij_current_tab118_v0=''
        return $__AS
    fi
    declare -r layout="${__AMBER_VAL_6}"
    # Find the focused tab
    __AMBER_VAL_7=$(echo -e "${layout}" | grep -E '^    tab.+focus=true' -A 1000 | grep '^    }' --max-count 1 -B 1000)
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_zellij_current_tab118_v0=''
        return $__AS
    fi
    local tab="${__AMBER_VAL_7}"
    # Remove indentation
    __AMBER_VAL_8=$(echo -e "${tab}" | cut -d' ' -f5-)
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_zellij_current_tab118_v0=''
        return $__AS
    fi
    tab="${__AMBER_VAL_8}"
    # log("current tab: {tab}")
    __AF_zellij_current_tab118_v0="${tab}"
    return 0
}
zellij_current_pane__119_v0() {
    zellij_current_tab__118_v0
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_zellij_current_pane119_v0=''
        return $__AS
    fi
    __AF_zellij_current_tab118_v0__25_17="${__AF_zellij_current_tab118_v0}"
    declare -r tab="${__AF_zellij_current_tab118_v0__25_17}"
    # Find the focused tab
    __AMBER_VAL_9=$(echo -e "${tab}" | grep -E '^(    )+pane.+focus=true' -A 1000 | grep -E '^(    )+}' --max-count 1 -B 1000)
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_zellij_current_pane119_v0=''
        return $__AS
    fi
    local pane="${__AMBER_VAL_9}"
    # Remove indentation
    __AMBER_VAL_10=$(echo -e "${pane}" | cut -d' ' -f5-)
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_zellij_current_pane119_v0=''
        return $__AS
    fi
    pane="${__AMBER_VAL_10}"
    # log("current pane: {pane}")
    __AF_zellij_current_pane119_v0="${tab}"
    return 0
}
zellij_write_chars__120_v0() {
    local chars=$1
    zellij action write-chars "${chars}"
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_zellij_write_chars120_v0=''
        return $__AS
    fi
    zellij action write 13
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_zellij_write_chars120_v0=''
        return $__AS
    fi
}
open_new_helix__121_v0() {
    local path=$1
    # The current pane is not running helix, so open helix in a new pane
    zellij action new-pane
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_open_new_helix121_v0=''
        return $__AS
    fi
    sleep 0.4
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_open_new_helix121_v0=''
        return $__AS
    fi
    # Get the working directory
    dir_exist__34_v0 "${path}"
    __AF_dir_exist34_v0__45_25="$__AF_dir_exist34_v0"
    __AMBER_VAL_11=$(dirname "${path}")
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_open_new_helix121_v0=''
        return $__AS
    fi
    declare -r working_dir=$(if [ "$__AF_dir_exist34_v0__45_25" != 0 ]; then echo "${path}"; else echo "${__AMBER_VAL_11}"; fi)
    zellij_write_chars__120_v0 "cd ${working_dir}; hx ${path} -w ${working_dir}"
    __AS=$?
    if [ $__AS != 0 ]; then
        __AF_open_new_helix121_v0=''
        return $__AS
    fi
    __AF_zellij_write_chars120_v0__46_5="$__AF_zellij_write_chars120_v0"
    echo "$__AF_zellij_write_chars120_v0__46_5" >/dev/null 2>&1
}
contains_regex__122_v0() {
    local text=$1
    local phrase=$2
    local extended=$3
    replace_regex__2_v0 "${text}" "${phrase}" "" ${extended}
    __AF_replace_regex2_v0__50_22="${__AF_replace_regex2_v0}"
    declare -r replaced="${__AF_replace_regex2_v0__50_22}"
    __AF_contains_regex122_v0=$(
        [ "_${text}" == "_${replaced}" ]
        echo $?
    )
    return 0
}
declare -r args=("$0" "$@")
path="${args[1]}"
log__117_v0 "Trying to open ${path}"
__AF_log117_v0__56_5="$__AF_log117_v0"
echo "$__AF_log117_v0__56_5" >/dev/null 2>&1
if [ $(
    [ "_${path}" != "_" ]
    echo $?
) != 0 ]; then
    exit 1
fi
zellij_current_tab__118_v0
__AS=$?
if [ $__AS != 0 ]; then

    exit $__AS
fi
__AF_zellij_current_tab118_v0__59_23="${__AF_zellij_current_tab118_v0}"
contains_regex__122_v0 "${__AF_zellij_current_tab118_v0__59_23}" " command=\"([^\"]*hx\" " 1
__AF_contains_regex122_v0__59_8="$__AF_contains_regex122_v0"
if [ "$__AF_contains_regex122_v0__59_8" != 0 ]; then
    log__117_v0 "Helix is open in the current tab. Let's focus it"
    __AF_log117_v0__60_9="$__AF_log117_v0"
    echo "$__AF_log117_v0__60_9" >/dev/null 2>&1
    # Move focus to the next pane
    limit=3
    cnt=0
    while :; do
        if [ $(echo ${cnt} '>' ${limit} | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then
            open_new_helix__121_v0 "${path}"
            __AS=$?
            if [ $__AS != 0 ]; then

                exit $__AS
            fi
            __AF_open_new_helix121_v0__66_17="$__AF_open_new_helix121_v0"
            echo "$__AF_open_new_helix121_v0__66_17" >/dev/null 2>&1
            break
        fi
        cnt=$(echo ${cnt} '+' 1 | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//')
        zellij action focus-next-pane
        __AS=$?
        if [ $__AS != 0 ]; then

            exit $__AS
        fi
        zellij_current_pane__119_v0
        __AS=$?
        if [ $__AS != 0 ]; then

            exit $__AS
        fi
        __AF_zellij_current_pane119_v0__71_31="${__AF_zellij_current_pane119_v0}"
        contains_regex__122_v0 "${__AF_zellij_current_pane119_v0__71_31}" " command=\"[^\"]*hx\" " 1
        __AF_contains_regex122_v0__71_16="$__AF_contains_regex122_v0"
        if [ "$__AF_contains_regex122_v0__71_16" != 0 ]; then
            # The current pane is running helix, use zellij actions to open the file
            zellij action write 27
            __AS=$?
            if [ $__AS != 0 ]; then

                exit $__AS
            fi
            zellij_write_chars__120_v0 ":open \"${path}\""
            __AS=$?
            if [ $__AS != 0 ]; then

                exit $__AS
            fi
            __AF_zellij_write_chars120_v0__74_17="$__AF_zellij_write_chars120_v0"
            echo "$__AF_zellij_write_chars120_v0__74_17" >/dev/null 2>&1
            break
        fi
    done
else
    log__117_v0 "Cannot find an open helix"
    __AF_log117_v0__79_9="$__AF_log117_v0"
    echo "$__AF_log117_v0__79_9" >/dev/null 2>&1
    open_new_helix__121_v0 "${path}"
    __AS=$?
    if [ $__AS != 0 ]; then

        exit $__AS
    fi
    __AF_open_new_helix121_v0__80_9="$__AF_open_new_helix121_v0"
    echo "$__AF_open_new_helix121_v0__80_9" >/dev/null 2>&1
fi
