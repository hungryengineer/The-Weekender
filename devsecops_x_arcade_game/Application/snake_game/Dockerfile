#pull down a minimal base image
FROM python:3.9-slim 

# Set environment variables (display mandatory)
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    DISPLAY=:0

#set the working directory from where the cmd instruction will be executed
WORKDIR /app

#add the project source
COPY . /app

#install tkinter lib
RUN apt-get update && \
    apt-get install -y \
    python3-tk \
    && rm -rf /var/lib/apt/lists/*

# Install Xvfb
RUN apt-get update && \
    apt-get install -y \
    xvfb \
    && rm -rf /var/lib/apt/lists/*

# Set up Xvfb
RUN Xvfb :99 -screen 0 1024x768x24 &

# Create a non-root user which will run the invoke cmd
RUN useradd --create-home appuser
USER appuser

#command that Docker will execute once container has started: 
#CMD pwd && ls -l && xvfb-run -a && python devsecops_x_arcade_game/Application/snake_game/main.py
CMD ["xvfb-run", "-a", "python", "python devsecops_x_arcade_game/Application/snake_game/main.py"]








