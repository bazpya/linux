pyVenv() {
  local command=$1

  if [[ $command == "do" ]]; then

    if [[ "$OSTYPE" == "msys"* ]]; then
      echo "Environment is GitBash (MinGW)"
      alias python3="python"
      activationPath="./.venv/Scripts/activate"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
      echo "Environment is proper Linux"
      activationPath="./.venv/bin/activate"
    else
      echo "Unknown OS environment. Aborting."
      return
    fi

    if [ ! -d ".venv" ]; then
      echo ".venv not found"
      echo "Creating it ..."
      # python3 -m pip install --upgrade pip
      python3 -m venv .venv
    else
      echo ".venv found"
    fi

    echo "Activating .venv"
    source $activationPath && \                # Proceeds only if this succeeds
    python3 -m pip install --upgrade pip && \  # Proceeds only if this succeeds
    pip install -r requirements.txt

  elif [[ $command == "undo" ]]; then
    deactivate
  elif [[ $command == "destroy" ]]; then
    deactivate
    rm -rf ./.venv
  else
    echo "Unknown argument $command"
  fi
}
