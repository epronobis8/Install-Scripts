pid=$(ps -opid= -C sonar.sh)
while [ -d /proc/$pid ] ; do
    sleep 1
done && ./pwdupdate.sh

sudo -u postgres psql -U postgres -d postgres -c "alter user postgres with password 'password';"
