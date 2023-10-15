#use an ubuntu image
FROM ubuntu:latest

#setting environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:0

#run the barebones stuff to install gnuradio and to get the GUI up and running
RUN apt-get update -y && \
    apt-get install -y gnuradio x11-apps libgtk-3-dev

#get sudo for the autoinstallations for sdrplay
RUN apt-get install sudo
    
#install the sdrplay specific packages
RUN sudo apt-get install swig git cmake libboost-all-dev wget -y

# Copy the local API .run file to the container
COPY ./SDRplay_RSP_API-Linux-3.07.1.run /tmp/SDRplay_RSP_API-Linux-3.07.1.run
	
# Install expect
RUN apt-get update && apt-get install -y expect

# Copy expect script into image
COPY ./install_sdrplay /tmp/install_sdrplay


# Make the script executable
RUN chmod +x /tmp/install_sdrplay


# Run the expect script
RUN /tmp/install_sdrplay


# Clone the repository
RUN git clone https://github.com/fventuri/gr-sdrplay3.git

# Change directory
WORKDIR /gr-sdrplay3

# Create build directory
RUN mkdir build

# Change to build directory
WORKDIR /gr-sdrplay3/build

# Run cmake and capture any errors
RUN cmake .. 

# Run make and capture any errors
RUN make

# Install
RUN make install

#Lastly, need to run the file_fixer due to a known bug in gnuradio on Ubuntu
#copy in file_fixer into tmp in the container
COPY ./file_fixer /tmp/file_fixer

# Make the script executable
RUN chmod +x /tmp/file_fixer

# Run the expect script
RUN /tmp/file_fixer

# (Optional) Remove the tmp files to clean up
RUN rm /tmp/SDRplay_RSP_API-Linux-3.07.1.run && \
	rm /tmp/file_fixer && \
	rm /tmp/install_sdrplay


#Auto run gnuradio-companion when the container boots !
CMD ["gnuradio-companion"]
