if [[ -v OMAKUB_FIRST_RUN_OPTIONAL_APPS ]]; then
  apps_array=("${(f)OMAKUB_FIRST_RUN_OPTIONAL_APPS}")

  for app in "${apps_array[@]}"; do
    source "$OMAKUB_PATH/install/desktop/optional/app-${(L)app}.sh"
  done
fi
