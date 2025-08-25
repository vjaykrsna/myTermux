#!/usr/bin/env bash

# Note: This is a user-facing utility script to fetch system info.
# It is not being installed to the system path automatically anymore.
# To use it, you should move it to a 'bin' directory in your chezmoi
# source and let 'chezmoi apply' symlink it for you.

magenta="\033[1;35m"; green="\033[1;32m"; white="\033[1;37m"; blue="\033[1;34m"; red="\033[1;31m"; black="\033[1;40;30m"; yellow="\033[1;33m"; cyan="\033[1;36m"; reset="\033[0m"
c0=${reset}; c1=${magenta}; c2=${green}; c3=${white}; c4=${blue}; c5=${red}; c6=${yellow}; c7=${cyan}

# --- Functions to get system info ---

getCodeName() {
  if command -v getprop &> /dev/null; then
    codename="$(getprop ro.product.board)"
  else
    codename="N/A"
  fi
}

getClientBase() {
  if command -v getprop &> /dev/null; then
    client_base="$(getprop ro.com.google.clientidbase)"
  else
    client_base="N/A"
  fi
}

getModel() {
  if command -v getprop &> /dev/null; then
    model="$(getprop ro.product.brand) $(getprop ro.product.model)"
  else
    model="$(uname -s)"
  fi
}

getDistro() { os="$(uname -o) $(uname -m)"; }
getKernel() { kernel="$(uname -r)"; }

getTotalPackages() {
  package_manager="$(which {apt,dpkg,pacman,dnf,brew} 2>/dev/null | grep -v "not found" | awk -F/ 'NR==1{print $NF}')"
  case "${package_manager}" in
    "apt" | "dpkg" ) packages=$(dpkg-query -l 2>/dev/null | wc -l);;
    "pacman" ) packages=$(pacman -Q 2>/dev/null | wc -l);;
    "dnf" ) packages=$(dnf list installed 2>/dev/null | wc -l);;
    "brew" ) packages=$(brew list --formula 2>/dev/null | wc -l);;
    * ) packages="Unknown";;
  esac
}

getShell() { shell="$(basename $SHELL)"; }
getUptime() { uptime="$(uptime --pretty | sed 's/up//')"; }

getMemoryUsage() {
  if free --mega >/dev/null 2>&1; then
    _MEM="Mem:"
    _GREP_ONE_ROW="$(free --mega | grep "${_MEM}")"
    _TOTAL="$(echo ${_GREP_ONE_ROW} | awk '{print $2}')"
    _USED="$(echo ${_GREP_ONE_ROW} | awk '{print $3}')"
    memory="${_USED}MB / ${_TOTAL}MB"
  else
    memory="N/A"
  fi
}

getDiskUsage() {
  # Use /data for Termux, / for standard Linux
  _MOUNTED_ON="/"
  if [ -d "/data" ] && df -h | grep -q "/data"; then
    _MOUNTED_ON="/data"
  fi

  _GREP_ONE_ROW="$(df -h | grep ${_MOUNTED_ON})"
  _SIZE="$(echo ${_GREP_ONE_ROW} | awk '{print $2}')"
  _USED="$(echo ${_GREP_ONE_ROW} | awk '{print $3}')"
  storage="${_USED} / ${_SIZE}"
}

# --- Main execution ---

main() {
  getCodeName; getClientBase; getModel; getDistro; getKernel; getTotalPackages; getShell; getUptime; getMemoryUsage; getDiskUsage
}

main

# --- Display ---

echo -e "\n\n"
echo -e "  ┏━━━━━━━━━━━━━━━━━━━━━━┓"
echo -e "  ┃ ${c1}r${c2}x${c7}f${c4}e${c5}t${c6}${c7}c${c1}h${c0}      ${c5}${c0}  ${c6}${c0}  ${c7}${c0} ┃  ${codename}${c5}@${c0}${client_base}"
echo -e "  ┣━━━━━━━━━━━━━━━━━━━━━━┫"
echo -e "  ┃                      ┃  ${c1}phone${c0}  ${model}"
echo -e "  ┃          ${c3}•${c8}_${c3}•${c0}         ┃  ${c2}os${c0}     ${os}"
echo -e "  ┃          ${c8}${c0}oo|         ┃  ${c7}ker${c0}    ${kernel}"
echo -e "  ┃         ${c8}/${c0} '\'        ┃  ${c4}pkgs${c0}   ${packages}"
echo -e "  ┃        (${c8}\_;/)${c0}        ┃  ${c5}sh${c0}    ${shell}"
echo -e "  ┃                      ┃  ${c6}up${c0}    ${uptime}"
echo -e "  ┃   android ${c1}${c0} termux   ┃  ${c1}ram${c0}    ${memory}"
echo -e "  ┃                      ┃  ${c2}disk${c0}   ${storage}"
echo -e "  ┗━━━━━━━━━━━━━━━━━━━━━━┛  ${c1}━━━${c2}━━━${c3}━━━${c4}━━━${c5}━━━${c6}━━━${c7}━━━"
echo -e "\n\n"
