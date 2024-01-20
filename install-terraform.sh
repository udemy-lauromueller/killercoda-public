echo "[terraform setup] : Installing and verifying GPG Key"

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null 2>&1

gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint > /dev/null 2>&1

# Adding Terraform repository
echo "[terraform setup] : Installing Terraform"

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list > /dev/null 2>&1
sudo apt update > /dev/null 2>&1

sudo apt-get install terraform=1.6.6-1 -y < "/dev/null"

clear
