FROM ubuntu:22.04

USER root
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

# Install psql
RUN apt-get install -y curl ca-certificates
RUN install -d /usr/share/postgresql-common/pgdg
RUN curl -o /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc --fail https://www.postgresql.org/media/keys/ACCC4CF8.asc
RUN sh -c 'echo "deb [signed-by=/usr/share/postgresql-common/pgdg/apt.postgresql.org.asc] https://apt.postgresql.org/pub/repos/apt jammy-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
RUN apt-get update
RUN apt -y install postgresql-16

# Install dbgen dependencies
RUN apt-get install -y build-essential

WORKDIR /home

# Compile dbgen
COPY dbgen dbgen
WORKDIR /home/dbgen
RUN make

# Generate data with a scale factor of 1
RUN ./dbgen -s 1
RUN mkdir generated_data
RUN mv *.tbl generated_data

WORKDIR /home
# Copy additional files
COPY dbqueries dbqueries
COPY schema.sql schema.sql
COPY load_data.sql load_data.sql

# Setup entrypoint
WORKDIR /home
COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

RUN chown -R postgres:postgres .

USER postgres
ENTRYPOINT ["/bin/sh", "-c" , "./entrypoint.sh"]