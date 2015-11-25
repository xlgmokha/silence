execute "apt-get update -y"
execute "apt-get upgrade -y"

package [
  'curl',
  'git-core',
  'libsqlite3-dev',
  'sqlite3'
]

bash "install postgres" do
  user "root"
  not_if { ::File.exist?("/etc/apt/sources.list.d/pgdg.list") }
  code <<-SCRIPT
    echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc \
      | apt-key add -
    apt-get update -y
    apt-get install -y postgresql-9.4 libpq-dev \
      postgresql-contrib-9.4 postgresql-client-common
  SCRIPT
end

sql = "SELECT 1 FROM pg_roles WHERE rolname='vagrant'"
create_user = "createuser -s -e -w vagrant"
execute "psql postgres -tAc \"#{sql}\" | grep -q 1 || #{create_user}" do
  user "postgres"
end

sql = "SELECT 1 FROM pg_roles WHERE rolname='vagrant'"
execute "createdb" do
  user "vagrant"
  not_if { "psql postgres -tAc \"#{sql}\" | grep -q 1" }
end

service "postgresql" do
  action [:enable, :start]
end
