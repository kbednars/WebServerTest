FROM ubuntu:18.04
RUN apt update && apt install -y wget git
RUN wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt install -y apt-transport-https && apt update && apt install -y dotnet-sdk-3.1
COPY . ./
WORKDIR WebServerTest
EXPOSE 80:80 
ENTRYPOINT dotnet run