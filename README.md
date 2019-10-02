# CoreOS-passwdqc

Run the following command to install password policy in CoreOS using pam_passwdqc. Read more about [pam_passwdqc](https://linux.die.net/man/8/pam_passwdqc)

```shell
    docker run --rm \
    --volume /etc/pam_passwdqc/lib64:/pam_passwdqc/lib64 \
    --volume /etc/security:/etc/security \
    --volume /etc/ssh:/etc/ssh \
    --volume /etc/pam.d:/pam.d \
    ankitjain28/coreos-passwdqc:v1.0
```

## Usage

```shell
    # Create new user and set password
    sudo useradd -U -m ankit -G sudo -K PASS_MAX_DAYS=30 -K PASS_MIN_DAYS=0 && sudo passwd ankit
    # Expire his password to let the user set it during first time login
    sudo passwd -e ankit
    # Login and set the new password
    ssh ankit@localhost
    # check the password change and expire interval
    sudo chage -l ankit
```
