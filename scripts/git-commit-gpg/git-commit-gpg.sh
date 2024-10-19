GITHUB_ORG="$1"
EMAIL="$2"

generate_key_if_not_exists() {
  local name_real="${GITHUB_ORG} (github-${GITHUB_ORG}) <${EMAIL}>"
  if ! gpg --list-secret-keys --keyid-format=long | grep -q "$name_real"; then
    gpg --batch --generate-key gpg-key.conf
  fi
}

print_key_if_exists() {
  local name_real="${GITHUB_ORG}"
  local key_id=$(gpg --list-secret-keys --keyid-format=long | awk -v name="$name_real" '
  /sec/ {sec_line=$0}
  /uid/ && $0 ~ name {print sec_line}
  ' | awk '{print $2}' | cut -d'/' -f2 | tr -d ' ')
  echo "$key_id"
}

# script execution
generate_key_if_not_exists
LOCAL_KEY_ID=$(print_key_if_exists)

# Unset gpg.format in git config
git config --global --unset gpg.format

# Extract the key ID for the specific NAME-REAL
KEY_ID=$(gpg --list-secret-keys --keyid-format=long | awk -v name="${GITHUB_ORG}" '
/sec/ {sec_line=$0}
/uid/ && $0 ~ name {print sec_line}
' | awk '{print $2}' | cut -d'/' -f2 | tr -d ' ')

# Configure git to use the extracted key ID for signing commits
git config --global user.signingkey "$KEY_ID"
git config --global commit.gpgsign true

# Export the public key
PUBLIC_KEY=$(gpg --armor --export "$KEY_ID")

# Retrieve the existing GPG key ID from GitHub
GITHUB_KEY_ID=$(gh gpg-key list | grep -B 1 "$EMAIL" | head -n 1 | awk '{print $1}')

# Check if the local key ID matches the GitHub key ID
if [ "$LOCAL_KEY_ID" != "$GITHUB_KEY_ID" ]; then
  # Update the GPG key on GitHub
  echo "$PUBLIC_KEY" > gpg_public_key.asc
  gh gpg-key add gpg_public_key.asc
  rm gpg_public_key.asc
fi

exit 0
