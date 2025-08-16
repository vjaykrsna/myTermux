#!/usr/bin/env bash

LIBRARYS=(
  animation signal cursor colors stat
)

# Adjusted for the new repository structure
LIBRARY_PATH="${HOME}/.dotfiles/scripts/theme_switchers/library"

for LIBRARY in ${LIBRARYS[@]}; do
  source ${LIBRARY_PATH}/${LIBRARY}.sh
done

ZSH_CUSTOM_THEME_DIR="${HOME}/.oh-my-zsh/custom/themes"
GET_ZSH_THEME_USED=$(cat ${HOME}/.zshrc | grep ZSH_THEME | sed 's/.*ZSH_THEME=//' | sed 's/"//g')
INDEX_LOOP=0

# Adjusted to be consistent with the user's config structure
THEME_USED_PATH="${HOME}/.config/zsh/theme_data/zsh"
THEME_USED_FILE_NAME="used.log"
THEME_USED="$(cat ${THEME_USED_PATH}/${THEME_USED_FILE_NAME} 2>/dev/null)"

ZSH_CONFIGURATION_PATH="${HOME}/.zshrc"
ZSH_CONFIGURATION_THEME_USED="$(echo ${THEME_USED} | sed 's/.zsh-theme//g')"

function banner() {

  echo -e "
\e[3$(( $RANDOM * 6 / 32767 + 1 ))m   ____  __          __  ___         _____  _ ____ __  __
\e[9$(( $RANDOM * 6 / 32767 + 1 ))m  / __ \/ /_        /  |/  /_  __   /__  / / ___// / / /
\e[3$(( $RANDOM * 6 / 32767 + 1 ))m / / / / __ \______/ /|_/ / / / /_____/ /  \_ _ \/ /_/ /
\e[9$(( $RANDOM * 6 / 32767 + 1 ))m/ /_/ / / / /_____/ /  / / /_/ /_____/ /_____/ / __  /
\e[3$(( $RANDOM * 6 / 32767 + 1 ))m\____/_/ /_/     /_/  /_/\__, /     /____/___/_/ /_/
\e[9$(( $RANDOM * 6 / 32767 + 1 ))m                        /____/

${COLOR_BASED}\n"

}

function listZshTheme() {

  clear
  setCursor off
  banner
  printf " %3s  %10s                              %4s\n\n" "No." "List Theme" "Status"

  # Create theme directory if it doesn't exist
  mkdir -p $THEME_USED_PATH

  if [ "${THEME_USED}" == "powerlevel10k/powerlevel10k" ]; then
    THEME_USED="powerlevel10k"
  fi

  for ZSHTHEME in ${ZSH_CUSTOM_THEME_DIR}/*; do

    ZSHTHEME_FILE_NAME[INDEX_LOOP]=$( echo ${ZSHTHEME} | awk -F'/' '{print $NF}')
    ZSHTHEME_LIST_NAME[INDEX_LOOP]=$( echo ${ZSHTHEME} | awk -F'/' '{print $NF}' | sed "s/.zsh-theme//g")

    if [ "${THEME_USED}" == "${ZSHTHEME_FILE_NAME[INDEX_LOOP]}" ]; then

      printf "[${COLOR_SUCCESS}%2s${COLOR_BASED}]  ${COLOR_SUCCESS}%-23s -->${COLOR_BASED}              ${COLOR_SUCCESS}%-4s${COLOR_BASED}\n" ${INDEX_LOOP} ${ZSHTHEME_LIST_NAME[INDEX_LOOP]} "USED"

    else

      printf "[${COLOR_WARNING}%2s${COLOR_BASED}]  %-23s\n" ${INDEX_LOOP} ${ZSHTHEME_LIST_NAME[INDEX_LOOP]}

    fi

    INDEX_LOOP=$(( ${INDEX_LOOP} + 1 ));

  done

  INDEX_LOOP=$(( ${INDEX_LOOP} - 1 ));

  echo ""

}

function selectZshTheme() {

  setCursor on

  while :; do

    read -p "Select ZSH theme: " INDEX_THEME

    if [ -z "${INDEX_THEME}" ]; then

      break;

    elif ! [[ ${INDEX_THEME} =~ ^[0-9]+$ ]]; then

      stat "ERROR" "Danger" "Unknown '${COLOR_DANGER}number${COLOR_BASED}', please enter the right number!\n"

    elif (( ${INDEX_THEME} >= 0 && ${INDEX_THEME} <= ${INDEX_LOOP} )); then

      eval CHOICE=${ZSHTHEME_LIST_NAME[INDEX_THEME]}

      if [ "${CHOICE}" == "powerlevel10k" ]; then
        CHOICE="powerlevel10k\/powerlevel10k"
      fi

      if [ "${ZSH_CONFIGURATION_THEME_USED}" == "powerlevel10k" ]; then
        ZSH_CONFIGURATION_THEME_USED="powerlevel10k\/powerlevel10k"
      fi

      start_animation "Applying Theme ..."
      sleep 1s

      if sed -i "s/ZSH_THEME=\"${ZSH_CONFIGURATION_THEME_USED}\"/ZSH_THEME=\"${CHOICE}\"/g" ${ZSH_CONFIGURATION_PATH}; then

        if [ ! -f ${THEME_USED_PATH}/${THEME_USED_FILE_NAME} ]; then

          echo -e "${ZSHTHEME_FILE_NAME[INDEX_THEME]}" >> ${THEME_USED_PATH}/${THEME_USED_FILE_NAME}

        elif [ -f ${THEME_USED_PATH}/${THEME_USED_FILE_NAME} ]; then

          sed -i "s/${THEME_USED}/${ZSHTHEME_FILE_NAME[INDEX_THEME]}/g" ${THEME_USED_PATH}/${THEME_USED_FILE_NAME}

        fi

        stop_animation $?

        echo ""

        exec $(which zsh)

      else

        stop_animation $?

      fi

      break

    else

      stat "ERROR" "Danger" "Unknown '${COLOR_DANGER}number${COLOR_BASED}', please enter the right number!\n"

    fi

  done

}

function main() {

  trap 'handleInterruptByUser "Interrupt by User"' 2

  listZshTheme
  selectZshTheme

}

main
