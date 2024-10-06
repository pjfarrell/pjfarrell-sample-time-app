FROM python:3.11

RUN apt-get update \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN groupadd -g 799 nyu && \
    useradd -r -u 999 -g nyu nyu

# Set up a working folder and install the pre-reqs
WORKDIR /app
COPY run.py /app

RUN pip3.11 install Flask
RUN pip3.11 install datetime

USER nyu

COPY --chown=nyu:nyu . .

CMD [ "python", "./run.py" ]
