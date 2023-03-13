FROM ubuntu
RUN apt update && apt install -y wget apt-transport-https software-properties-common figlet
RUN wget -q "https://github.com/PowerShell/PowerShell/releases/download/v7.3.2/powershell_7.3.2-1.deb_amd64.deb"
RUN dpkg -i powershell_7.3.2-1.deb_amd64.deb
COPY *.ps1 /tmp
COPY pwshlogo.txt /tmp
RUN mkdir /tmp/podcasts
COPY *.dll /tmp
ENTRYPOINT [ "pwsh","-c","/tmp/presentatie.ps1" ]