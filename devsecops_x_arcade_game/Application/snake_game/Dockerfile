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

# Create a non-root user which will run the invoke cmd
RUN useradd --create-home appuser
USER appuser

#command that Docker will execute once container has started: 
CMD pwd && ls -l && python devsecops_x_arcade_game/Application/snake_game/main.py









