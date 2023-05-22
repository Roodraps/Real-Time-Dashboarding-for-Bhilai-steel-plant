**To install InfluxDB 2 and Telegraf on Linux, follow these steps:**

  - Download the InfluxDB 2 installation package: You can download the
    installation package from the InfluxDB website. For example, on
    Ubuntu, you can run the following command to download the latest
    version:

*wget
<https://dl.influxdata.com/influxdb/releases/influxdb2-2.x.x-linux-amd64.tar.gz>*

  - Extract the installation package: Use the following command to
    extract the package:

*tar xvfz influxdb2-2.x.x-linux-amd64.tar.gz*

  - Change the directory to the extracted package: Use the following
    command to navigate to the extracted directory:

cd influxdb2-2.x.x-linux-amd64

  - Run the InfluxDB 2 setup: Use the following command to run the
    setup:

sudo ./influxd upgrade

  - Start the InfluxDB 2 server: Use the following command to start the
    server:

sudo systemctl start influxdb

  - Verify the InfluxDB 2 server is running: Use the following command
    to check the status of the server:

sudo systemctl status influxdb

  - Download and install Telegraf: You can download the installation
    package from the Telegraf website. For example, on Ubuntu, you can
    run the following command to download the latest version:

wget
<https://dl.influxdata.com/telegraf/releases/telegraf-1.x.x_linux_amd64.tar.gz>

  - Extract the Telegraf installation package: Use the following command
    to extract the package:

tar xvfz telegraf-1.x.x\_linux\_amd64.tar.gz

  - Copy the Telegraf configuration file: Use the following command to
    copy the default configuration file:

sudo cp telegraf-1.x.x/etc/telegraf/telegraf.conf/etc/telegraf/

  - Edit the Telegraf configuration file: Use a text editor to edit the
    configuration file and specify the InfluxDB 2 server as the output.
    For example:

\[\[outputs.influxdb\_v2\]\]

urls = \["http://localhost:8086"\]

token = "my-influxdb2-token"

organization = "my-organization"

bucket = "my-bucket"

  - Start the Telegraf service: Use the following command to start the
    service:

sudo systemctl start telegraf

  - Verify the Telegraf service is running: Use the following command to
    check the status of the service:

sudo systemctl status telegraf

Alternatively, we can install influxdb and telegraf from the debian’s
repo and their package manager. Follow the instructions from below link:

<https://portal.influxdata.com/downloads/>

<https://docs.influxdata.com/influxdb/v2.6/install/?t=Linux>

**To set up Grafana on Linux, follow these steps:**

  - Install Grafana: You can download the installation package from the
    Grafana website or use a package manager like apt or yum. For
    example, on Ubuntu, you can run the following command:

*sudo apt-get install -y grafana*

  - Start the Grafana server: After installation, start the Grafana
    server using the following command:

*sudo systemctl start grafana-server*

  - Enable the Grafana server to start on boot: To enable the Grafana
    server to start automatically on boot, use the following command:

*sudo systemctl enable grafana-server*

  - Configure the firewall: If you are using a firewall, you need to
    allow access to the Grafana server. For example, on Ubuntu, you can
    use the following command:

*sudo ufw allow 3000/tcp*

  - Access the Grafana web interface: Open a web browser and go to
    http://\<server-ip\>:3000. You should see the Grafana login page.

  - Log in to Grafana: The default login credentials are admin for the
    username and admin for the password. After logging in, you will be
    prompted to change the password.

  - Configure data sources: To use Grafana, you need to configure data
    sources. You can do this by clicking on the "Configuration" icon in
    the side menu, selecting "Data Sources", and then adding a new data
    source.

  - Create a dashboard: After configuring a data source, you can create
    a dashboard by clicking on the "Create" icon in the side menu and
    selecting "Dashboard".

References:

<https://grafana.com/docs/grafana/latest/setup-grafana/installation/debian/>
