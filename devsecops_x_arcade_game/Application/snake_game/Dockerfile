#pull down a minimal base image
FROM python:3.9-slim 

#add the project source code
COPY . .

#set the working directory from where the cmd instruction will be executed
WORKDIR .

# Create a non-root user which will run the invoke cmd
RUN useradd --create-home appuser
USER appuser

#command that Docker will execute once container has started: 
CMD ["python", "oop_main.py"] 










