From python:alpine

WORKDIR /mkdocs
RUN apk add build-base 
RUN pip install --upgrade pip && pip install mkdocs && pip install mkdocs-material && pip install mkdocs-roamlinks-plugin && pip install mkdocs-mermaid2-plugin
COPY mkdocs.yml .
COPY recipes docs
COPY javascripts docs/javascripts
RUN /usr/local/bin/mkdocs build

From nginx:alpine
WORKDIR /usr/share/nginx/html
COPY htpasswd /etc/nginx/htpasswd
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=0 /mkdocs/site .
